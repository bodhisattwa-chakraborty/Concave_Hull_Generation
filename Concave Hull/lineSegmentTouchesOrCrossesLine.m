function stat = lineSegmentTouchesOrCrossesLine(a,b,c,d)

%---------------------------------------------------------------------------------%
% function stat = lineSegmentTouchesOrCrossesLine(a,b,c,d)
%
% Description:
%
%   - Check if line segment (a-b) touches or crosses line segment (c-d).
%
% Input:
%   a, b, c, d = 1X2 matrices containing point locations
%
% Output:
%   stat: stat = 1; TRUE
%         stat = 0; FLASE
%
% External functions:
%
%   - isPointOnLine     : Check if a point is on a line.
%   - isPointRightOfLine: Check if a point (c) is right of a line (a-b).
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
   
   statPtonLn1 = isPointOnLine(a,b,c);
   statPtonLn2 = isPointOnLine(a,b,d);
   
   statPtRightofLn1 = isPointRightOfLine(a,b,c);
   statPtRightofLn2 = isPointRightOfLine(a,b,d);
   
   stat = 0;
   if (statPtonLn1==1 || statPtonLn2==1 || bitxor(statPtRightofLn1, statPtRightofLn2)==1)
       stat = 1;
   end
   
   
