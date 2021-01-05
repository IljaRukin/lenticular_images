close all;clear;clc;

lpi = 75; %lenses per inch
dpi = 720; %dots per inch for image (effective printer resolution)
dpl = dpi/lpi; %dots per lens
img_sz = [4,4]; %image size in inch (4in = 101.6mm)
dim = img_sz*dpi; %image size in pixels

image = ones(dim); %image

%variate dots per lens
d_dpl = 0.1; %variation range from dpl
n = 21; %number of variations
steps = linspace(dpl-d_dpl,dpl+d_dpl,n); %range of dots per lens for calibration
l = floor(dim(1)/n);
q=0;
for stp=steps
    one_array = round( 1:stp:dim(2) ); %position of lines
    image(l*q+1:l*(q+1),one_array) = zeros(l,length(one_array));
    %image(l*q+1:l*(q+1),one_array+1) = zeros([l,length(one_array)]);
    q=q+1;
end

result = cat(1,image,rot90(image));


%figure(1);imagesc(image);axis equal;
figure(1);imshow(result);axis equal;
imwrite(result,'calibration.tiff','Resolution',dpi);
fprintf("space in pixels between lines:");
fprintf("%f ",steps);
fprintf("\n");