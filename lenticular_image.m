close all;clear;clc;
addpath("./cube");

dpi = 720;
lpi = 75;
pixels_space = 9.56;
samples = ceil( pixels_space );
fprintf("number of images: %i \n",samples);

sample_im = imread('1.jpg');
im_size = size(sample_im);
im_size = floor(im_size(1:2)/2);
fprintf("image res: %i x %i \n",im_size);
dim = [im_size(1)*samples,im_size(2)*samples];

image = zeros([dim,3],'uint8');
indices = round( 1:pixels_space:dim(2) );

%combine image
image_array = zeros([dim,3],'uint8');
for nr=1:samples
    image_array = imresize( imread(['',int2str(nr),'.jpg']) , dim );
    %image_array(:,:,:,nr) = imresize( imread(['pacman',int2str(floor(nr/2)),'.jpg']) , dim );
    
    while (max(indices)+nr-1)>dim(2)
        indices(end) = []; %delete last element: wtf ?
    end
    
    image(:,indices+nr-1,:) = image_array(:,indices+nr-1,:);
end

figure(1);imagesc(image);axis equal;
%figure(1);imshow(result);axis equal;
imwrite(image, 'lenticular.tiff','Resolution',dpi);
