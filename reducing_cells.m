function point_cloud=reducing_cells(tissue_data, number_cells)
%The input of our function is a .mat with the data corresponding to the
%image of a tissue and the number of cells we want to extract.
%The output is a list with the desired number of cells if possible.
%Otherwise, the list contain all valid cells in the image.

load(tissue_data)
% The data corresponding to each cell is given by
%   l_img: an image where each region corresponds to a cell and their
%   boundaries are marked with a 0.
%   valid_cells: list of cells which do not intersect with the boundary of
%   the image.
%   cell_info: information of each cell given by regionprop, it includes
%   its centroid.

[extreme1, extreme2] = size(l_img);
valid_cells = double(valid_cells);
pos1=floor(length(l_img)/2);
pos2=pos1;
list = [];

% (pos1,pos2) will be the starting point of our algorithm.
if l_img(pos1,pos2)~=0
    list(end+1)=l_img(pos1,pos2);
end

% We look for cells rounding our starting point and stop when arriving
% desired number of cells or to the boundaries of the image.
i = 1;
while length(list) < number_cells && pos1 < extreme1 && pos2 < extreme2 ...
        && pos1>0 && pos2>0
    Xaux = 1;
    Yaux = 1;
    while Yaux <= i && length(list) < number_cells && pos2 < extreme2 ...
        && pos1>0 && pos2>0
        pos2 = pos2 + (-1)^(i+1);
        Yaux = Yaux+1;
        if l_img(pos1,pos2)~=0 && ~ismember(l_img(pos1,pos2),list) &&...
                ismember(l_img(pos1,pos2),valid_cells)
            list(end+1)=l_img(pos1,pos2);
        end
    end
    while Xaux <= i && length(list) < number_cells && pos1 < extreme1 ...
            && pos2 < extreme2
    pos1 = pos1 + (-1)^(i+1);
    Xaux = Xaux+1;
        if l_img(pos1,pos2)~=0 && ~ismember(l_img(pos1,pos2),list) &&...
                ismember(l_img(pos1,pos2),valid_cells) 
            list(end+1)=l_img(pos1,pos2);
        end
    end
    i = i+1;
end
    
cells=list;
point_cloud=zeros(length(cells),2);
for i=1:length(cells)
    point_cloud(i,:)=cellInfo(cells(i)).Centroid;
end

end