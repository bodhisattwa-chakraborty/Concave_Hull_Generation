function kNNPoints = GetNearestNeighbors(points, currPt, nhood)

%---------------------------------------------------------------------------------%
% function kNNPoints = GetNearestNeighbors(points, currPt, nhood)
%
% Description:
%
%   - Returns indices of k-nearest neighbours of point in dataset
%
% Input:
%   points: point dataset (x, y-coordinates, mx2 matrix)
%   currPt: the point from which nearest neighbours has to be calculated (1x2 matrix)
%   nhood : initial value of neighbourhood points (default = 5)
%
% Output:
%   kNNPoints: point list in the neighbourhood (nx2 matrix)
%
% Author: Bodhisattwa Chakraborty | bodhisattwa.chakraborty@gmail.com
%
% Copyright (c) 2017 Bodhisattwa Chakraborty
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in 
% all copies or substantial portions of the Software.
%
% @ created: 20-MARCH-2017
%
% @ Modified: 
%
% Change Log:       
%
%---------------------------------------------------------------------------------%
%
%---------------------------------------------------------------------------------%

[idx,~] = knnsearch(points, currPt, 'k', nhood, 'NSMethod', 'kdtree');
kNNPoints = zeros(length(idx), 2);
num = 1;
for i = 1:length(idx)
   nearestPoint = [points(idx(i),1) points(idx(i),2)]; 
   kNNPoints(num,1) =  nearestPoint(1);
   kNNPoints(num,2) =  nearestPoint(2);
   num = num+1; 
end

