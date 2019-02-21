function obtain_point_clouds(number)
% 
labels={'cNT','dWL','dWP'};
persistentIntervals=[];

for idL = 1 : numel(labels)

    imgs=dir(sprintf('data/%s/*.mat',labels{idL}));
    numFiles(idL,1)=size(imgs,1);

    %If the directories already exists, this function do nothing.
    mkdir(strcat('point_clouds/',num2str(number)));

    for idF=1:size(imgs,1)
        tissue_data=sprintf('data/%s/%s',labels{idL},imgs(idF,1).name);

        [point_cloud]=reduce_cells(tissue_data,number);

        namePlot=sprintf(strcat('point_clouds/',...
            num2str(number),'/%s.txt'), imgs(idF,1).name(1:(end-9)));

        fid = fopen(namePlot,'wt');
        for ii = 1:size(point_cloud,1)
            fprintf(fid,'%g  ',point_cloud(ii,:));
            fprintf(fid,'\n');
        end
        fclose(fid);
    end
end
end