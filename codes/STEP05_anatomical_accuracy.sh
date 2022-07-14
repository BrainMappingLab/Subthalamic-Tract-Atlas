#replace with your destination
WORKDIR="your/path/to/subthalamic_tract_atlas/"

#paths definitions
TRACTROIDIR="$WORKDIR/data/ROIs/manually_delineated_tracts"
SUBJDIR="$WORKDIR/demo_subjects"
mkdir $WORKDIR/results
mkdir $WORKDIR/results/anat_accuracy
RESULTSDIR="$WORKDIR/results/anat_accuracy"

#looping for each tract
for i in `echo $TRACTROIDIR/*.nii.gz`; do
base=`basename $i .nii.gz`

#looping for each subject folder in the main dataset
for j in `ls $SUBJDIR/main_dataset`; do
cd $SUBJDIR/main_dataset/$j

#looping for each different combination of angle and step length
for k in `cat $WORKDIR/codes/order.txt`; do

#calculating volume of binarized tract mask
TARGET=$TRACTROIDIR/${base}.nii.gz
if test ! -e FODtemplate_${base}_${k}_bin_thr5.nii.gz; then
echo 0
else
fslstats FODtemplate_${base}_${k}_bin_thr5.nii.gz -V > tmp_roivol.txt
ROIVOL=`cut -d ' ' -f 1 tmp_roivol.txt`

#calculating overlap between tract mask and manually defined tractogram
if [ "$ROIVOL" -eq "0" ]; then
echo 0
else
fslmaths FODtemplate_${base}_${k}_bin_thr5.nii.gz -mul $TARGET tmp_overlap.nii.gz
fslstats tmp_overlap.nii.gz -V > tmp_overlap.txt

#calculating percentage overlap
OVERLAPVOL=`cut -d ' ' -f 1 tmp_overlap.txt`
echo ${OVERLAPVOL}/${ROIVOL} | bc -l
fi
fi

#print results in separate file for each subject and tract following the order of parameter combinations as specified in "order.txt"
done > $RESULTSDIR/anat_accuracy_${j}_${base}.txt
rm tmp*
done
done

