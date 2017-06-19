function stat = isPointOnLine(a,b,c)
%---------------------------------------------------------------------------------%
% function stat = isPointOnLine(a,b,c)
%
% Description:
%
%   - Check if a point is on a line.
%
% Input:
%   a, b, c = 1X2 matrices containing point locations
%
% Output:
%   stat: stat = 1; TRUE
%         stat = 0; FLASE
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
% @ created: 23-MARCH-2017
%
% @ Modified: 
%
% Change Log:       
%
%---------------------------------------------------------------------------------%
%
%---------------------------------------------------------------------------------% 

bTmp = [b(1) - a(1) b(2) - a(2)];
cTmp = [c(1) - a(1) c(2) - a(2)];
r = bTmp(1)*cTmp(2)-bTmp(2)*cTmp(1);    % Cross product

stat = 0;     
if abs(r) < 0.0000000001
    stat = 1; 
end