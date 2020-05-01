function [ actionRemoved ] = RemoveAction(imageList)
% RemoveAction creates an image that has the action removed by applying a
% median filter (i.e. each pixel in the new image is obtained by taking
% the median RGB values of the stack of corresponding pixels taken from
% the source images. The input images are concatenated into a 4D array.
% Then the medians of the elements along the 4th dimension are calculated
% and used to produce the actionRemoved image.
%
% Inputs:
% imageList = A 1xn 1D cell array containing n images, where each
%             element is an RGB image (recall RGB images stored as 3D
%             arrays of uint8 values ranging from 0 to 255)
%
% Outputs:
% actionRemoved = An RGB image (stored as 3D arrays of uint8 values ranging
%                 from 0 to 255) that was obtained by taking the median RGB
%                 values of the stack of corresponding pixels from the
%                 source images
%
% Author: George Clooney


% Concatenate the images in the imageList into a 4D array. Then use the
% median function to calculate the medians of the elements along the 4th
% dimension. Finally, register the median values into the "actionRemoved"
% array.
actionRemoved = median( cat( 4, imageList{:} ), 4 );

end