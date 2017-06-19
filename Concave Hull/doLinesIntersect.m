function stat = doLinesIntersect(a,b,c,d)

%---------------------------------------------------------------------------------%
% function stat = doLinesIntersect(a,b,c,d)
%
% Description:
%
%   - Check if line segments (a-b) and (c-d) intersect.
%
% Input:
%   a,b,c,d: points of line segments (each point is a 1x2 matrix)
%
% Output:
%   stat: stat = 1; TRUE
%         stat = 0; FLASE
%
% External functions:
%
%   - doBoundingBoxesIntersect       : Check if bounding boxes intersect
%   - lineSegmentTouchesOrCrossesLine: Check if line segment (a-b) touches or crosses
%                                      line segment (c-d). 
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

statBBIntersect   = doBoundingBoxesIntersect(a,b,c,d);
statLnsegTchCrss1 = lineSegmentTouchesOrCrossesLine(a,b,c,d);
statLnsegTchCrss2 = lineSegmentTouchesOrCrossesLine(c,d,a,b);

stat = 0;
if (statBBIntersect==1 && statLnsegTchCrss1==1 && statLnsegTchCrss2==1)
    stat = 1;
end
  