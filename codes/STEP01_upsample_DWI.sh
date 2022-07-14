#replace with your destination
WORKDIR="/your/path/to/subthalamic_tract_atlas/"

#paths definitions
ROIDIR="$WORKDIR/data/ROIs"
SUBJDIR="$WORKDIR/demo_subjects"
for i in `ls $SUBJDIR`; do
cd $SUBJDIR/$i
for j in `ls`; do
echo $i/$j
cd $SUBJDIR/$i/$j

#disassembling composite transform to get affine registration
CompositeTransformUtil --disassemble FOD2FODTemplateComposite.h5  FOD2FODtemplate_disassembled
mv $ROIDIR/bounding_box.nii.gz `pwd`

#register bounding box to subject space
antsApplyTransforms -d 3 -i bounding_box.nii.gz -r FOD_3D.nii -t 00_FOD2FODtemplate_disassembled_AffineTransform.mat -o bounding_box_subjsp.nii.gz
mv bounding_box.nii.gz $ROIDIR

#crop and upsample individual DWI on bounding box
mrgrid -mask bounding_box_subjsp.nii.gz DWI.mif crop - | mrgrid -vox 1 -interp cubic - regrid DWI_cropped_1mm.mif -force

#re-estimate tissue response functions and FODs from cropped upsampled DWIs"
dwi2response dhollander DWI_cropped_1mm.mif WM_1mm.txt GM_1mm.txt CSF_1mm.txt
dwi2fod msmt_csd DWI_cropped_1mm.mif WM_1mm.txt WM_FODs_1mm.mif GM_1mm.txt GM_1mm.mif CSF_1mm.txt CSF_1mm.mif
done 
done
