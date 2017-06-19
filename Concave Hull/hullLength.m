function len = hullLength(hull)
%---------------------------------------------------------------------------------%
% function function len = hullLength(hull)
%
% Description:
%
%   - Returns the total length of a hull (convex/concave)
%
% Input:
%   hull: Convex/concave hull points (x, y-coordinates, nx2 matrix)
%
% Output:
%   len: total length of the hull
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
% @ created: 30-MARCH-2017
%
% @ Modified: 
%
% Change Log:       
%
%---------------------------------------------------------------------------------%
%
%---------------------------------------------------------------------------------%

num = 1;
edLen = zeros(1, length(hull));
for i = 1:1:(length(hull)-1)
	% Calculate length of each edge (Euclidean distance measure)
    edLen(num) = sqrt((hull(i+1, 2)-hull(i, 2))^2 + ...
                   (hull(i+1, 1)-hull(i, 1))^2);
    num = num+1;
end

len = sum(edLen);