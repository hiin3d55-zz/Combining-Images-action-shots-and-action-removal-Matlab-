function [ squaredDistance ] = PixelDistance(firstPoint, secondPoint)
% PixelDistance calculates the square of the distance between two points
% in colour space. The sqaure of the distance is calculated based on this
% equation: D = (P1-Q1)^2 + (P2-Q2)^2 + (P3-Q3)^2, where P = (P1,P2,P3)
% (point in 3D space).
%
% Inputs:
% firstPoint = an array containing three elements representing a point in
%              3D colour space
% secondPoint = An array containing three elements representing a second
%               point in 3D colour space
%
% Outputs:
% squaredDistance = the square of the distance between the two points in
%                   3D colour space
%
% Author: George Clooney


% Convert uint8 to doubles, as uint8 nunmber can only be an integer from 0
% to 255. Thus doubles is needed to perform the calculation AND obatain
% appropriate values.
firstPoint = double(firstPoint);
secondPoint = double(secondPoint);

% Matrix subtraction.
differences = firstPoint - secondPoint;

% Square element by element.
differencesSquared = differences.^2;

% Sum the elements.
squaredDistance = sum(differencesSquared);

end