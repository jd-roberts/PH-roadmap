function [ Y ] = distmat_to_pointcloud( filename )
% Input: text file with distance matrix
% Output: text file with point cloud, one point per line
dist_matr=load(filename);

N=size(dist_matr,1);
Y = cmdscale(dist_matr);
m=min(min(Y));
%M=max(max);
size(Y,2)
formatSpec='%8.25f %8.25f %8.25f\n';

output_file_name=[filename,'_point_cloud.txt']
fileID=fopen(output_file_name,'w');
for i=1:N
output_line=sprintf('%8.18f ', Y(i,:));
fprintf(fileID,'%s\n',output_line);
end


end
