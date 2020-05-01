function [ actionImage ] = ActionShot(imageList)
% ActionShot creates an action shot image by finding the pixels from a
% stack of images that are most distant from the median RGB values (i.e.
% each pixel in the new image is obtained by finding the pixel in the same
% row and column of the source images that is most distant from the median
% RGB values of the stack of corresponding pixels.
%
% Inputs:
% imageList = A 1xn 1D cell array containing n images, where each element
%             is an RGB image (recall RGB images stored as 3D arrays of
%             uint8 values ranging from 0 to 255)
%
% Outputs:
% actionImage = An action shot in the form of an RGB image (stored as 3D
%               arrays of uint8 values ranging from 0 to 255)
%
% Author: George Clooney


% Concatenate the images in the imageList into a 4D array. Note that double
% function is used because uint8 values can only be in the range 0~255.
array4D = double( cat(4, imageList{:}) );

% Use the median function to calculate the median values of the elements
% along the 4th dimension.
medImg = median(array4D, 4);

% Find the dimensions of "array4D". Note that the size of the 3rd dimension
% is not being recorded because we already know that it is 3 (RGB). imgNum
% refers to which image in the cell array "array4D" the image is.
[ row, col, ~, imgNum ] = size(array4D);

% Firstly, calculate the square of the distance between two points
% in colour space. The sqaure of the distance is calculated based on this
% equation: D = (P1-Q1)^2 + (P2-Q2)^2 + (P3-Q3)^2, where P = (P1,P2,P3)
% (point in 3D space). However, unlike in "PixelDistance", matrix
% subtraction and element-by-element squaring have been used in this
% function to make the function more efficient.
%
% Secondly, sum the values in the array in the direction of the 3rd
% dimension.
%
% Finally, find the indices of where the maxima occur for each pixel
% location. This is done by finding the maxima in the direction of the 4th
% dimension. "idx" is a row x col array that contains the image numbers
% that correspond to 'which image contains the maximum distance value'.
[ ~, idx ] = max( sum((medImg - array4D).^2, 3), [], 4 );

% *** This comment is very detailed in order to prevent confusion as the
% code relating to this comment is difficult to understand. The best way to
% understand the code below is to step through the code and perform hand
% calculations, instead of just reading the comments.
%
% "idx" contains the indices of where the maximum distant pixels are.
% However, it cannot be used straight away with "array4D" to create the
% output image. So this part of the function is used to create an 3D array
% that can be utilised to index "array4D" and thereby extract the values
% that are needed to create the output image.
%
% The 1st line creates a row x col array that has a starting value of 1 in
% the left hand corner. Then row by row, the value increases by 1.
% e.g. [ 1 3;
%        2 4 ] when "tiny" is used. Notice that the values increase by 1
%        row-by-row.
%
% The 2nd line is an 1x1x3 array. The values in this array depend on how
% big the row*col is. The step size between the layers in the directin of
% the 3rd dimension ( e.g. stepSize = ans(:,:,1) - ans(:,:,2) ) is row*col.
%
% Adding the 1st line and 2nd line together results row x col x 3 array.
% The values increase row by row from the left hand corner by 1. Because of
% this, when the 3rd line is added to the rest, the resulting array
% "maxPixExtract" contains the positions of the RGB values of the maximum
% distant pixels. Therefore, maxPixExtract allows the RGB values of the
% maximum distant pixels to be extracted out from "array4D".
%
% The layers maxPixExtract(:,:,1), maxPixExtract(:,:,2) and
% maxPixExtract(:,:,3) each relate to R, G and B values.
%
% Algorithm retrievend from: https://stackoverflow.com/questions/57649949/
% indexing-a-4d-array-with-a-2d-matrix-of-indicies?answertab=votes#tab-top
maxPixExtract = reshape( (1:row*col), row, col ) + ...       % 1st line
    reshape( (0:2)*row*col, 1, 1, [] ) + ...                 % 2nd line
    (idx-1)*row*col*3;                                       % 3rd line

% Extract the values that are needed to created an Action Shot.
actionImage = uint8( array4D(maxPixExtract) );

end
