%% clear some vars
% clc ; clearvars ; close all

%% read in the images from one protocol

LAT_OPTS = {'L' 'R'};
TRACT_OPTS = {'AL' 'CTT' 'FL' 'MedL' 'MTT'};
TRACKING_OPTS = {'SD_STREAM' 'iFOD2'};
PARAM_OPTS = {'def' '1_20' '1_30' '1_60' '1_80' '2_20' '2_30' '2_60' '2_80' '3_20' '3_30' '3_60' '3_80' '4_20' '4_30' '4_60' '4_80'};

% replace with your path
DATADIR = '../demo_subjects/main_dataset' ;

files = dir(DATADIR);
names = {files.name};
dirFlags = [files.isdir] & ~strcmp(names, '.') & ~strcmp(names, '..');
SUBS = names(dirFlags)';
num_subjs=size(SUBS,1);

% number of comparisons to be made (for making average later)
numComps = nnz(triu(ones(num_subjs),1)) ;

% initialize the table
output_table = table() ;

% loop over laterality, tractography, tracking parameters
for lat = LAT_OPTS
    for tracking = TRACKING_OPTS
        for param = PARAM_OPTS
            
            
            % initalize the variables
            allimgs = cell(num_subjs,length(TRACT_OPTS));
            allsz = zeros(num_subjs,length(TRACT_OPTS));
            
            m_dice = zeros(num_subjs,num_subjs,length(TRACT_OPTS));
            
            method_name = strcat(lat,'_',tracking,'_',param);
            
            % loop over the different TRACTS
            for cdx = 1:length(TRACT_OPTS)
                
                % what is the current TRACKING?
                tract = TRACT_OPTS{cdx} ;
                
                %% load all images for this protocol
                
                img = strcat('FODtemplate_',lat,'_',tract,'_',tracking,'_',param,'_bin_thr5.nii.gz');
                for idx = 1:length(SUBS)
                    disp(idx)
                    
                    tmp = niftiread(strrep(join(string([DATADIR '/' SUBS(idx,:) '/' img{1} ])),' ','')) > 0;
                    allimgs{idx,cdx} = tmp;
                    allsz(idx,cdx) = nnz(tmp);
                end
                
                %% now compare all images
                
                for idx = 1:num_subjs
                    for jdx = 1:num_subjs
                        if idx >= jdx
                            continue
                        end
                        disp([ num2str(idx) ' ' num2str(jdx)])
                        
                        m_dice(idx,jdx,cdx) = dice(allimgs{idx,cdx},allimgs{jdx,cdx}); % matlab dice function
                        
                        
                    end
                end
                
                
            end % TRACT_OPTS
            
            % get the average dice
            dice_by_layer = squeeze(nansum(m_dice,[1 2]));
            avg_dice_by_layer = dice_by_layer ./ numComps;
            
            % write into the table
            tmpoutvec = [avg_dice_by_layer'];
            tmptable = array2table(tmpoutvec);
            tmptable.Properties.RowNames = method_name;
            
            output_table = [ output_table ; tmptable ];
            
        end
    end
end


%% output information

columnNames = [strcat(TRACT_OPTS,'_avgDICE') ];

% replace with your path destination
mkdir('../results/between_subjs')
RESULTS_DIR ='../results/between_subjs';
output_table.Properties.VariableNames = columnNames;
% writetable(output_table,[  RESULTS_DIR '/between_subjs/avgdice.csv' ])
save([  RESULTS_DIR '/avgdice.mat'],'output_table');
