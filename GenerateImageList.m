function [ filenames ] = GenerateImageList(directory, fileExt)
% GenerateImageList fetches a list of the names of all the images with a
% particular file extension that are contained in a specified directory.
%
% Inputs:
% directory = a string containing the name of the directory the images are
%             contained in
% fileExt = a string containing the file extension of the images to
%           fetch
%
% Outputs:
% filenames = A 1xn 1D cell array containing n strings where each element
%             is the filename of an image from the specified directory that
%             has a particular file extension
%
% Author: George Clooney


% Make a structArray that contains all the files that are in the
% specified directory.
structArray = dir(directory);

% Record the length of structArray as a variable "n".
n = length(structArray);

% Use for loop to extract the file names from the structArray. Note
% that the i value starts from 3 in order to avoid registering '.' and '..'
% into "allFileNames" array. '.' and '..' are the first two elements of
% "structArray". For the explanation of the occurrence of these, refer to
% the Piazza question "dir(directory) showing files that".
for i = 3:n
    allFileNames{i-2} = structArray(i).name;
end

% We need the array "filenames" to start as an empty array for the next for
% loop. This allows "filenames" to be created without 0x0 doubles.
filenames = [];

% Use for loop and strfind to extract the file names with the specified
% file extension then register those into the cell array "filenames".
for i = 1:numel(allFileNames)
    compareFileExt = strfind( allFileNames{i}, fileExt );
    
    % 1st condition: Check whether compareFileExt is an empty array or
    % not. If it is, and therefore current file name doesn't contain the
    % specified file extension, move on to examining the next file name.
    % 2nd condition: Check whether the specified file extension is found
    % at the end of the file name or not. If it is not found at the end,
    % then it is the case when the file name contains the specified
    % extension in its name but has a different file extension at the end
    % (e.g. FILEpng.jpg).
    if ( length(compareFileExt) ~= 0 ) && ...
            ( length(allFileNames{i}) - length(fileExt) < ...
            compareFileExt(length(compareFileExt)) )
        
        % If the file extension is the same the specified file extension,
        % add that file into the cell array "filenames".
        filenames{ length(filenames) + 1 } = allFileNames{i};
    end
end

end