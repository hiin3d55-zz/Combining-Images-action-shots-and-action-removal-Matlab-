function [ pics ] = ReadImages(directory, filenames)
% ReadImages reads in a specified list of images given the filenames and
% the directory the files are located in.
%
% Inputs:
% directory = a string containing the name of the directory the images are
%             contained in
% filenames = a 1xn 1D cell array containing n strings where each element
%             is a filename of an image to read
%
% Outputs:
% pics = A 1xn 1D cell array containing n images, where each element is an
%        RGB image (recall RGB images stored as 3D arrays of uint8 values
%        rangingfrom 0 to 255).  The first image will correspond to the
%        first filename from the list of filenames
%
% Author: George Clooney


% Use for loop to create the cell array "pics".
for i = 1:length(filenames)
    % Concatenate the strings shown inside the square brackets together so
    % that the resulting "imreadArg" can be passed into the imread
    % function.
    imreadArg = [directory '\' filenames{i}];
    pics{i} = imread(imreadArg);
end

end