% function pt = GetFirstPoint(dataset)
%---------------------------------------------------------------------------------%
% Description:
%
%   - Returns index of first point, which has the lowest y value
%
% Input:
%   dataset: point dataset (x, y-coordinates, mx2 matrix)
%
% Output:
%   pt: index of point in the dataset, which has the lowest y value
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

function pt = GetFirstPoint(dataset)

[~, indx_min] = min(dataset(:,2));
pt = [dataset(indx_min,1) dataset(indx_min,2)];