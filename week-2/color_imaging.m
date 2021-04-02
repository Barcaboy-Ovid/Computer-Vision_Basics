%Read the image
img = imread('image.jpg');

%Get the size (rows and columns) of the image 
[r,c] = size(img);
rr=r/3;

%Wrire code to split the image into three equal parts and store them in B, G, R channels
% Getting channels from the image
B = img(1:rr,:,:);
G = img(rr+1:2*rr,:,:);
R = img(2*rr+1:r,:,:);

% Concatenate R,G,B channels and assign the RGB image to ColorImg variable
ColorImg(:,:,1) = R;
ColorImg(:,:,2) = G;
ColorImg(:,:,3) = B;
imshow(ColorImg)