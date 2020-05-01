function [ R, G, B ] = MedianPixel(pixels)
% MedianPixel calculates the median RGB values from a list of pixels.
%
% Inputs:
% pixels = A 1xnx3 3D array of RGB values representing a list of pixels 
%          (pixel 1 will be in column 1, pixel 2 in column 2 etc).   
%          Typically n will be greater than 1 (i.e. there are two or more 
%          pixels in the list) but your code should still be able to handle 
%          the special case of n being 1
%
% Outputs: 
% R = The median red value, which will be the median of all the R values 
%     from the list of pixels 
% G = The median green value, which will be the median of all the G values 
%     from the list of pixels 
% B = The median blue value, which will be the median of all the B values 
%     from the list of pixels 
%
% Author: George Clooney


% Create individual arrays for R, G and B.
reds = pixels(:,:,1);
greens = pixels(:,:,2);
blues = pixels(:,:,3);

% Find the median values for R, G and B.
nonRoundedRed = median(reds);
nonRoundedGreen = median(greens);
nonRoundedBlue = median(blues);

% Round the median values to the nearest integer because uint8 values can
% only be integers.
R = round(nonRoundedRed);
G = round(nonRoundedGreen);
B = round(nonRoundedBlue);

end