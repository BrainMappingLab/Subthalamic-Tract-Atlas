#replace with your destination
WORKDIR="/your/path/to/subthalamic_tract_atlas/"

#paths definitions
TRACTROIDIR="$WORKDIR/data/ROIs/manually_delineated_tracts"
SUBJDIR="$WORKDIR/demo_subjects"
mkdir $WORKDIR/results/within_subjs
RESULTSDIR="$WORKDIR/results/within_subjs"

#looping for each tract
for i in `echo $TRACTROIDIR/*.nii.gz`; do
base=`basename $i .nii.gz`

#looping for each subject folder in the test dataset
for j in `ls $SUBJDIR/trt_data_test`; do

#looping for each different combination of angle and step length
for k in `cat $WORKDIR/codes/order.txt`; do

#defining test and retest volume paths
TEST="$SUBJDIR/trt_data_test/$j/FODtemplate_${base}_${k}_bin_thr5.nii.gz"
RETEST="$SUBJDIR/trt_data_retest/$j/FODtemplate_${base}_${k}_bin_thr5.nii.gz"

#Calculating Dice similarity coefficient
if test ! -e $TEST; then
echo 0
elif test ! -e $RETEST; then
echo 0
else
fslmaths $RETEST -mul $TEST -bin tmp_intersection
fslstats tmp_intersection -V > tmp_intersection.txt
fslstats $RETEST -V > tmp_RETEST.txt
fslstats $TEST -V > tmp_TEST.txt
INTERSECTION=`cut -d ' ' -f 1 tmp_intersection.txt`
TESTVOL=`cut -d ' ' -f 1 tmp_TEST.txt`
RETESTVOL=`cut -d ' ' -f 1 tmp_RETEST.txt`
NUMERATOR=`echo 2*${INTERSECTION} | bc -l`
DENOMINATOR=`echo $TESTVOL+$RETESTVOL | bc -l`
if [ "$DENOMINATOR" -eq "0" ]; then
echo 0
else
echo $NUMERATOR/$DENOMINATOR | bc -l
fi
fi

# print results in separate file for each subject and tract following the order of parameter combinations as specified in "order.txt"
done > $RESULTSDIR/within_subjs_${j}_${base}.txt
done
rm tmp*
done

