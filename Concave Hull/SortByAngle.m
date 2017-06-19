function cPoints = SortByAngle(kNearestPoints, currentPoint, prevPoint)

%---------------------------------------------------------------------------------%
% function cPoints = SortByAngle(kNearestPoints, currentPoint, prevPoint)
%
% Description:
%
%   - Sorts the k nearest points given by angle
%
% Input:
%   kNearestPoints: point list in the neighbourhood (nx2 matrix)
%   currentPoint  : reference point (1x2 matrix)
%   prevPoint     : a point right of currentpoint (angle=0)
%
% Output:
%   cPoints: k-nearest points sorted according to angle
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

angles = zeros(1, length(kNearestPoints));
cPoints = zeros(length(kNearestPoints), 2);
cnt = 1; k = 1;

for i = 1:length(kNearestPoints)
    % calculate the angle
    angle = atan2(kNearestPoints(i,2)-currentPoint(2), ...
                  kNearestPoints(i,1)-currentPoint(1)) - ...
            atan2(prevPoint(2)-currentPoint(2), ...
                  prevPoint(1)-currentPoint(1));    
    angle = rad2deg(angle);
    % Only positive angles
    angle = mod(angle+360, 360);
    
    angles(cnt) = angle;
    cnt = cnt+1;

end

% sort by angle
[~, idxSort] = sort(angles);
for i = 1:length(idxSort)
    sortPoints = [kNearestPoints(idxSort(i),1) kNearestPoints(idxSort(i),2)];
    cPoints(k,1) = sortPoints(1);
    cPoints(k,2) = sortPoints(2);
    k = k+1;
end