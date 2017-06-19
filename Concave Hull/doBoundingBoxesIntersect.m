function stat = doBoundingBoxesIntersect(a,b,c,d)

%---------------------------------------------------------------------------------%
% function stat = doBoundingBoxesIntersect(a,b,c,d)
%
% Description:
%
%   - Check if bounding boxes intersect. If one bounding box touches the other, 
%     they do intersect. First segment is of points a and b, second of c and d.
%
% Input:
%   a, b, c, d = 1X2 matrices containing point locations
%
% Output:
%   stat: stat = 1; TRUE
%         stat = 0; FLASE
%
% % Test %
% a = [63.711 -35.929];
% b = [86.175 -20.293];
% c = [51.826 63.973];
% d = [63.711 -35.929];
% stat = doBoundingBoxesIntersect(a,b,c,d);
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
% @ created: 21-MARCH-2017
%
% @ Modified: 
%
% Change Log:       
%
%---------------------------------------------------------------------------------%
%
%---------------------------------------------------------------------------------%

ll1_x = min(a(1),b(1)); ll2_x = min(c(1),d(1));
ll1_y = min(a(2),b(2)); ll2_y = min(c(2),d(2));
ur1_x = max(a(1),b(1)); ur2_x = max(c(1),d(1));
ur1_y = max(a(2),b(2)); ur2_y = max(c(2),d(2));

stat = 0;   
if (ll1_x <= ur2_x && ur1_x >= ll2_x && ll1_y <= ur2_y && ur1_y >= ll2_y)
    stat = 1;   
end