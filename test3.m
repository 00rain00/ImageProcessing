clear;
clc;
%read image
pic = imread('pic.bmp');

lab_pic=rgb2lab(pic);

temp = lab_pic(:,:,2:3);
nrows = size(temp,1);
ncols = size(temp,2);
temp = reshape(temp,nrows*ncols,2);

nColors = 5;
% repeat the clustering 3 times to avoid local minima
%[cluster_idx, cluster_center] = kmeans(temp,nColors,'distance','sqEuclidean','Replicates',3);
[cluster_idx, cluster_center] = skmeans(temp,nColors);
pixel_labels = reshape(cluster_idx,nrows,ncols);
pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels,[]), title('image labeled by cluster index');
% 
% segmented_images = cell(1,5);
% rgb_label = repmat(pixel_labels,[1 1 5]);
% 
% 
% 
% for k = 1:nColors
%     color = pic;
%     temp = rgb_label~=k;
%     color(temp(:,:,1:3)) = 0;
%     segmented_images{k} = color;
% end
% 
% imshow(segmented_images{1}), title('objects in cluster 1');
% imshow(segmented_images{2}), title('objects in cluster 2');
% imshow(segmented_images{3}), title('objects in cluster 3');
% imshow(segmented_images{4}), title('objects in cluster 4');
% imshow(segmented_images{5}), title('objects in cluster 5');
% 
% fuzzy k-means cluster
% lab_pic = reshape(lab_pic,157500,3);
% [centers,U] = fcm(lab_pic,5);

                              
                                 