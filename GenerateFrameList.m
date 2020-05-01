function [ frameNumbers ] = GenerateFrameList(startNum, step, n)
% GenerateFrameList generates a list of frames we are interested in which
% can be used by other functions. In particular it will be useful for
% determining which frames to extract from a movie file.
%
% Inputs:
% startNum = starting frame number
% step = step size
% n = number of frames to generate
%
% Outputs:
% frameNumbers = it returns a single output, a 1xn 1D array, where n is 
%                the desired number of frames (n).  The first element of 
%                the array will be the starting frame number  and each 
%                subsequent element will have a frame value that is the 
%                step size greater than the last. 
%
% Author: George Clooney


% Use for loop to create an array that includes the list of frames.
for i = 1:n
    frameNumbers(i) = startNum;
    startNum = startNum + step;
end

end