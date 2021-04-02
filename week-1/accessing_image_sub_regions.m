img = imread('cameraman.tif');
subimg1 = img(1:50,1:50);
subimg2 = img(207:256,207:256);
SSD = sum(sum((double(subimg1) - double(subimg2)).^2));
