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

#The code iterates tractography generation by seeding 250 streamlines from each waypoint ROI per bundle and then merging the result to a single tract output. This is implemented for all the tracts with both deterministic and probabilistic tractography, first with default parameters, then with custom parameters (angle threshold, step length)

for algorithm in iFOD2 SD_STREAM; do
for side in L_ R_; do

echo "___Tracking with default parameters: $algorithm ___ "

echo "Generating Fasciculus Lenticularis"
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FL_roi1.nii.gz  -include subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}FL_1_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}FL_roi1.nii.gz  -include subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz  -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}FL_2_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FT_roi3.nii.gz -include subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}FL_roi1.nii.gz  -exclude subjsp_${side}CTT_roi1.nii.gz  -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}FL_3_${algorithm}_def.tck -force
tckedit tmp_${side}FL_1_${algorithm}_def.tck tmp_${side}FL_2_${algorithm}_def.tck tmp_${side}FL_3_${algorithm}_def.tck ${side}FL_${algorithm}_def.tck -force

echo "Generating Ansa Lenticularis"
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}AL_roi1.nii.gz -include subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}AL_1_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}AL_roi1.nii.gz -include subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}AL_2_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FT_roi3.nii.gz -include subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}AL_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}AL_3_${algorithm}_def.tck -force
tckedit tmp_${side}AL_1_${algorithm}_def.tck tmp_${side}AL_2_${algorithm}_def.tck tmp_${side}AL_3_${algorithm}_def.tck ${side}AL_${algorithm}_def.tck -force

echo "Generating cerebellothalamic tract"
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}CTT_roi1.nii.gz -include subjsp_${side}CTT_roi2.nii.gz -include subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}CTT_1_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}CTT_roi2.nii.gz -include subjsp_${side}CTT_roi1.nii.gz -include subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}CTT_2_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}CTT_roi3.nii.gz -include subjsp_${side}CTT_roi2.nii.gz -include subjsp_${side}CTT_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}CTT_3_${algorithm}_def.tck -force
tckedit tmp_${side}CTT_1_${algorithm}_def.tck tmp_${side}CTT_2_${algorithm}_def.tck tmp_${side}CTT_3_${algorithm}_def.tck ${side}CTT_${algorithm}_def.tck -force

echo "Generating Mammillothalamic tract"
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MTT_roi1.nii.gz -include subjsp_${side}MTT_roi2.nii.gz -include subjsp_${side}MTT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MTT_1_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MTT_roi2.nii.gz -include subjsp_${side}MTT_roi1.nii.gz -include subjsp_${side}MTT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MTT_2_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MTT_roi3.nii.gz -include subjsp_${side}MTT_roi2.nii.gz -include subjsp_${side}MTT_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MTT_3_${algorithm}_def.tck -force
tckedit tmp_${side}MTT_1_${algorithm}_def.tck tmp_${side}MTT_2_${algorithm}_def.tck tmp_${side}MTT_3_${algorithm}_def.tck ${side}MTT_${algorithm}_def.tck -force

echo "Generating Lemniscus Medialis"
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MedL_roi1.nii.gz -include subjsp_${side}MedL_roi2.nii.gz -include subjsp_${side}MedL_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MedL_1_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MedL_roi2.nii.gz -include subjsp_${side}MedL_roi1.nii.gz -include subjsp_${side}MedL_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MedL_2_${algorithm}_def.tck -force
tckgen -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MedL_roi3.nii.gz -include subjsp_${side}MedL_roi2.nii.gz -include subjsp_${side}MedL_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MedL_3_${algorithm}_def.tck -force
tckedit tmp_${side}MedL_1_${algorithm}_def.tck tmp_${side}MedL_2_${algorithm}_def.tck tmp_${side}MedL_3_${algorithm}_def.tck ${side}MedL_${algorithm}_def.tck -force

echo "___Tracking with custom parameters: $algorithm ___"

counterstep=0
for step in 0.25 0.5 1 1.25; do
counterstep=$((counterstep + 1))
for angle in 20 30 60 80; do

echo " tracking parameters: step = $step angle = $angle "

echo "Generating Fasciculus Lenticularis"
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FL_roi1.nii.gz  -include subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}FL_1_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}FL_roi1.nii.gz  -include subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz  -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}FL_2_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FT_roi3.nii.gz -include subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}FL_roi1.nii.gz  -exclude subjsp_${side}CTT_roi1.nii.gz  -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}FL_3_${algorithm}_${counterstep}_${angle}.tck -force
tckedit tmp_${side}FL_1_${algorithm}_${counterstep}_${angle}.tck tmp_${side}FL_2_${algorithm}_${counterstep}_${angle}.tck tmp_${side}FL_3_${algorithm}_${counterstep}_${angle}.tck ${side}FL_${algorithm}_${counterstep}_${angle}.tck -force

echo "Generating Ansa Lenticularis"
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}AL_roi1.nii.gz -include subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}AL_1_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}AL_roi1.nii.gz -include subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}AL_2_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}FT_roi3.nii.gz -include subjsp_${side}FT_roi2.nii.gz -include subjsp_${side}AL_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}AL_3_${algorithm}_${counterstep}_${angle}.tck -force
tckedit tmp_${side}AL_1_${algorithm}_${counterstep}_${angle}.tck tmp_${side}AL_2_${algorithm}_${counterstep}_${angle}.tck tmp_${side}AL_3_${algorithm}_${counterstep}_${angle}.tck ${side}AL_${algorithm}_${counterstep}_${angle}.tck -force

echo "Generating cerebellothalamic tract"
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}CTT_roi1.nii.gz -include subjsp_${side}CTT_roi2.nii.gz -include subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}CTT_1_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}CTT_roi2.nii.gz -include subjsp_${side}CTT_roi1.nii.gz -include subjsp_${side}CTT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}CTT_2_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}CTT_roi3.nii.gz -include subjsp_${side}CTT_roi2.nii.gz -include subjsp_${side}CTT_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz  -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}CTT_3_${algorithm}_${counterstep}_${angle}.tck -force
tckedit tmp_${side}CTT_1_${algorithm}_${counterstep}_${angle}.tck tmp_${side}CTT_2_${algorithm}_${counterstep}_${angle}.tck tmp_${side}CTT_3_${algorithm}_${counterstep}_${angle}.tck ${side}CTT_${algorithm}_${counterstep}_${angle}.tck -force


echo "Generating Mammillothalamic tract"
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MTT_roi1.nii.gz -include subjsp_${side}MTT_roi2.nii.gz -include subjsp_${side}MTT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MTT_1_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MTT_roi2.nii.gz -include subjsp_${side}MTT_roi1.nii.gz -include subjsp_${side}MTT_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MTT_2_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MTT_roi3.nii.gz -include subjsp_${side}MTT_roi2.nii.gz -include subjsp_${side}MTT_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MedL_roi1.nii.gz -exclude subjsp_${side}MedL_roi2.nii.gz -exclude subjsp_${side}MedL_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MTT_3_${algorithm}_${counterstep}_${angle}.tck -force
tckedit tmp_${side}MTT_1_${algorithm}_${counterstep}_${angle}.tck tmp_${side}MTT_2_${algorithm}_${counterstep}_${angle}.tck tmp_${side}MTT_3_${algorithm}_${counterstep}_${angle}.tck ${side}MTT_${algorithm}_${counterstep}_${angle}.tck -force

echo "Generating Lemniscus Medialis"
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MedL_roi1.nii.gz -include subjsp_${side}MedL_roi2.nii.gz -include subjsp_${side}MedL_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MedL_1_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MedL_roi2.nii.gz -include subjsp_${side}MedL_roi1.nii.gz -include subjsp_${side}MedL_roi3.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MedL_2_${algorithm}_${counterstep}_${angle}.tck -force
tckgen -step ${step} -angle ${angle} -algorithm ${algorithm} -exclude subjsp_${side}IC_roi1.nii.gz -select 250 -seeds 500000 -seed_image subjsp_${side}MedL_roi3.nii.gz -include subjsp_${side}MedL_roi2.nii.gz -include subjsp_${side}MedL_roi1.nii.gz  -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}CTT_roi1.nii.gz -exclude subjsp_${side}CTT_roi2.nii.gz -exclude subjsp_${side}CTT_roi3.nii.gz -exclude subjsp_${side}AL_roi1.nii.gz -exclude subjsp_${side}FL_roi1.nii.gz -exclude subjsp_${side}FT_roi2.nii.gz -exclude subjsp_${side}FT_roi3.nii.gz -exclude subjsp_${side}MTT_roi1.nii.gz -exclude subjsp_${side}MTT_roi2.nii.gz -exclude subjsp_${side}MTT_roi3.nii.gz -stop WM_FODs_1mm.mif tmp_${side}MedL_3_${algorithm}_${counterstep}_${angle}.tck -force
tckedit tmp_${side}MedL_1_${algorithm}_${counterstep}_${angle}.tck tmp_${side}MedL_2_${algorithm}_${counterstep}_${angle}.tck tmp_${side}MedL_3_${algorithm}_${counterstep}_${angle}.tck ${side}MedL_${algorithm}_${counterstep}_${angle}.tck -force

done
done
done
done
rm tmp*.tck

done 
done
