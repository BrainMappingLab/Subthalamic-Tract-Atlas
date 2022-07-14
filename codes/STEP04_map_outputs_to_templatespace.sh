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
for k in `echo *.tck`; do
bas=`basename $k .tck`

#mapping streamlines to track density maps
tckmap -upsample 100 -precise -template WM_FODs_1mm.mif ${bas}.tck ${bas}.nii.gz

#cleaning with 5% intensity percentage threshold and binarizing
fslmaths ${bas}.nii.gz -thrP 5 -bin ${bas}_bin_thr5.nii.gz

#Transforming to FOD template space using previously computed non-linear transformations
antsApplyTransforms -d 3 -i ${bas}_bin_thr5.nii.gz -r $TEMPLATEDIR/FOD_template_3D.nii -t FOD2FODTemplateInverseComposite.h5 -o FODtemplate_${bas}_bin_thr5.nii.gz

done
done
done 
