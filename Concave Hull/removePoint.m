function pts = removePoint(points,pt)

%---------------------------------------------------------------------------------%
% function pts = removePoint(points,pt)
%
% Description:
%
%   - Remove the specified point from given dataset
%
% Input:
%   points: point dataset (x, y-coordinates, mx2 matrix)
%   pt    : x,y-coordinate of the point to be removed from the dataset (1x2 matrix)
%
% Output:
%   pts: point list after removing the specified point ((m-1)x2 matrix)
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

delmask = (or(points(:,1)~= pt(1),points(:,2)~= pt(2)));
pts = [points(delmask,1) points(delmask,2)];