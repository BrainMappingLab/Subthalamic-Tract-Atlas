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

#transform waypoint masks in subject space
mrconvert WM_FODs_1mm.mif -coord 3 0 -axes 0,1,2 FOD_3D_1mm.nii.gz
for k in `ls $ROIDIR/waypoint_masks`; do
antsApplyTransforms -d 3 -i $ROIDIR/waypoint_masks/$k -r FOD_3D_1mm.nii.gz -t FOD2FODTemplateComposite.h5 -o subjsp_${k}
done
gzip subjsp*.nii

done 
done
