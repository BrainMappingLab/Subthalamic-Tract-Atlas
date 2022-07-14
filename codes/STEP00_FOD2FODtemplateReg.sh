#This script replicates the preliminary steps including DWI signal modeling, FOD estimation and FOD registration to FOD template that were originally performed in a previous work (Basile GA, Bertino S, Bramanti A, Ciurleo R, Anastasi GP, Milardi D, Cacciola A. In Vivo Super-Resolution Track-Density Imaging for Thalamic Nuclei Identification. Cereb Cortex. 2021 Oct 22;31(12):5613-5636. doi: 10.1093/cercor/bhab184. PMID: 34296740.)


#replace with your destination
WORKDIR="/your/path/to/subthalamic_tract_atlas/"

#paths definitions
TEMPLATEDIR="$WORKDIR/data/template"
SUBJDIR="$WORKDIR/demo_subjects"
for i in `ls $SUBJDIR`; do
cd $SUBJDIR/$i
for j in `ls`; do
echo $i/$j
cd $SUBJDIR/$i/$j

#convert DWI to MrTrix custom format
mrconvert data.nii.gz DWI.mif -fslgrad bvecs bvals -datatype float32 -stride 0,0,0,1

#generate 5-tissue-type segmentation image from structural data
5ttgen fsl T1w_acpc_dc_restore_brain.nii.gz 5TT.mif -premasked -sgm_amyg_hipp

#estimate tissue-specific response functions
dwi2response msmt_5tt DWI.mif 5TT.mif RF_WM.txt RF_GM.txt RF_CSF.txt

#estimating FODs using Multi-shell multi-tissue Constrained Spherical Deconvolution
dwi2fod msmt_csd DWI.mif RF_WM.txt WM_FODs.mif RF_GM.txt GM.mif RF_CSF.txt CSF.mif -mask nodif_brain_mask.nii.gz -force

#coregistration to FOD template
mrconvert WM_FODs.mif -coord 3 0 FOD_3D.nii
mv $TEMPLATEDIR/FOD_template_3D.nii `pwd`
        antsRegistration --dimensionality 3 --float 0 --output FOD2FODTemplate --write-composite-transform 1 --interpolation Linear --winsorize-image-intensities [0.005,0.995] --use-histogram-matching 1 --initial-moving-transform [FOD_3D.nii,FOD_template_3D.nii,1] --transform Rigid[0.1] --metric MI[FOD_3D.nii,FOD_template_3D.nii,1,32,Regular,0.25] --convergence [1000x500x250x100,1e-6,10] --shrink-factors 8x4x2x1 --smoothing-sigmas 3x2x1x0vox --transform Affine[0.1] --metric MI[FOD_3D.nii,FOD_template_3D.nii,1,32,Regular,0.25] --convergence [1000x500x250x100,1e-6,10] --shrink-factors 8x4x2x1 --smoothing-sigmas 3x2x1x0vox --transform SyN[0.1,3,0] --metric CC[FOD_3D.nii,FOD_template_3D.nii,1,4] --convergence [100x70x50x20,1e-6,10] --shrink-factors 8x4x2x1 --smoothing-sigmas 3x2x1x0vox
        
mv FOD_template_3D.nii $TEMPLATEDIR/
done
done
