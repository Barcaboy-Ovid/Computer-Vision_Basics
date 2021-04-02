%Read the image
img = imread('course1image.jpg');

%Get the size
[r,c] = size(img);
rr=(r/3);

%slice the image
B = img(1:rr,:);
G = img((rr+1):(2*rr),:);
R = img((2*rr+1):(3*rr),:);

%slice the image
c_x = ((341*0.5)-25);
c_y = ((400*0.5)-25);

%reference image GREEN
ref_img_region = double(G(c_x:c_x + 50, c_y:c_y + 50));

%sliding Red and Blue
red_offset = offset(double(R(c_x:c_x + 50, c_y:c_y + 50)), ref_img_region);
shifted_red = circshift(R, red_offset);

blue_offset = offset(double(B(c_x:c_x + 50, c_y:c_y + 50)), ref_img_region);
shifted_blue = circshift(B, blue_offset);

%concatenate
ColorImg_aligned = cat(3, shifted_red, G, shifted_blue);
imshow(ColorImg_aligned);

% Find the minimun offset by ssd
function [output] = offset(img1, img2)
    MIN = inf; 
    for x = -10:10
        for y = -10:10
            temp = circshift(img1, [x, y]);
            ssd = sum((img2 - temp).^2, 'all');
            if ssd < MIN
                MIN = ssd;
                output = [x, y];
            end
        end
    end
end
