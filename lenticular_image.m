close all;clear;clc;
addpath("./ocean_images");

dpi = 720;
lpi = 75;
pixels_space = 9.56;

sample_im = imread('ocean001.jpg') ;
size_sample = size(sample_im);
samples = ceil( pixels_space );

dim = [size_sample(1)*samples,size_sample(2)*samples];
%m=4;
%dim = [dpi*m,dpi*m];
%dim = [4725,6300]; %phone

image = zeros([dim,3],'uint8');
indices = round( 1:pixels_space:dim(2) );

%combine image
image_array = zeros([dim,3],'uint8');
for nr=1:samples
    image_array = imresize( imread(['ocean00',int2str(nr),'.jpg']) , dim );
    %image_array(:,:,:,nr) = imresize( imread(['pacman',int2str(floor(nr/2)),'.jpg']) , dim );
    
    while (max(indices)+nr-1)>dim(2)
        indices(end) = []; %delete last element: wtf ?
    end
    
    image(:,indices+nr-1,:) = image_array(:,indices+nr-1,:);
end

figure(1);imagesc(image);axis equal;
%figure(1);imshow(result);axis equal;
imwrite(image, 'lenticular.tiff','Resolution',dpi);
