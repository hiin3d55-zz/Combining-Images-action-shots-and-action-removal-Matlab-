function [ r, g, b ] = MostDistantPixel(pixels)
% MostDistantPixel calculates the pixel from a list that is most distant 
% from the median RGB values of that list. The distance metric to be 
% used is that described in the PixelDistance task (i.e. the squared 
% distance between points in RGB colour space).
%
% Inputs:
% pixels = A 1xnx3 3D array of RGB values representing a list of pixels 
%          (pixel 1 will be in column 1, pixel 2 in column 2 etc).   
%          Typically n will be greater than 1 (i.e. there are two or more 
%          pixels in the list) but your code should still be able to handle 
%          the special case of n being 1
%
% Outputs:
% R = The red value of the most distant pixel 
% G = The green value of the most distant pixel 
% B = The blue value of the most distant pixel 
%
% Author: George Clooney


% Use the MedianPixel function to calculate the RGB values of the
% "medianPixel".
[ R, G, B ] = MedianPixel(pixels);
medianPixel = [ R, G, B ];

% currentMax is a variable that records the highest squaredDistance.
currentMax = 0;

pixelsSize = size(pixels);

% Create a 1x3 array that holds the RGB values of each pixels.
for i = 1:pixelsSize(2)
    eachPixels(1) = pixels(1, i, 1);
    eachPixels(2) = pixels(1, i, 2);
    eachPixels(3) = pixels(1, i, 3);
    
    % Use PixelDistance function to calculate the distance between a pixel
    % and the median pixel.
    [ squaredDistance ] = PixelDistance(medianPixel, eachPixels);
    
    % Replace currentMax and currentRGB if squaredDistance is greater 
    % than the current maximum.
    if ( squaredDistance > currentMax )
        currentMax = squaredDistance;
        currentRGB = eachPixels; 
    end
end

% In the case when medianPixel = eachPixels, thus squaredDistance = 0, 
% assume that the first pixel of "pixels" is the currentRGB.
if ( currentMax == 0 )
    currentRGB = [ pixels(1, 1, 1) pixels(1, 1, 2) pixels(1, 1, 3) ];
end

% Register the RGB values of the pixel that has greatest squaredDistance to
% the output r,g and b variables.
r = currentRGB(1);
g = currentRGB(2);
b = currentRGB(3);

end