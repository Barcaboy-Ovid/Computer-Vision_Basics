RGB = imread('image1.jpg');

% RGB TO HSV
J = rgb2hsv(RGB);

% Slice for HSV
H = J(:,:,1); 
S = J(:,:,2); 
V = J(:,:,3); 

% Plot HSV
subplot(2, 2, 1); imshow(J);
subplot(2, 2, 2); imshow(H);
subplot(2, 2, 3); imshow(S);
subplot(2, 2, 4); imshow(V);