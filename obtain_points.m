labels={'cNT','dWL','dWP'};
persistentIntervals=[];

for idL = 1 : numel(labels)

    imgs=dir(sprintf('data/%s/*.mat',labels{idL}));
    numFiles(idL,1)=size(imgs,1);
    
    %If the directories already exists, this function do nothing.
    mkdir(sprintf('results/%s',labels{idL}));
    mkdir(sprintf('results/%s/point_clouds',labels{idL}));
    
    for idF=1:size(imgs,1)
        tissue_data=sprintf('data/%s/%s',labels{idL},imgs(idF,1).name);
        
        [point_cloud]=reducing_cells(tissue_data,400);
        
        namePlot=sprintf(strcat('results/%s/point_clouds/%s.txt'),...
            labels{idL},strcat(labels{idL},num2str(idF)));
        
        fid = fopen(namePlot,'wt');
        for ii = 1:size(point_cloud,1)
            fprintf(fid,'%g  ',point_cloud(ii,:));
            fprintf(fid,'\n');
        end
        fclose(fid);
    end
end
