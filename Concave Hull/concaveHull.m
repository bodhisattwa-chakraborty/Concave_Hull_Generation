function hull = concaveHull(dataset, K)
%---------------------------------------------------------------------------------%
% function function hull = concaveHull(dataset, K)
%
% Description:
%
%   - Generate the concave hull for a given dataset
%
% Input:
%   dataset: point dataset (x, y-coordinates, mx2 matrix)
%   K      : initial value of neighbourhood points (default = 5)
%
% Output:
%   hull: vertices of the concave hull (x, y-coordinates, nx2 matrix)
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
% @ created: 28-MARCH-2017
%
% @ Modified: 
%
% Change Log:       
%
%---------------------------------------------------------------------------------%
%
%---------------------------------------------------------------------------------%

if K >= 3   % k has to be greater or equal to 3
    newPoints = dataset;
    firstpoint = GetFirstPoint(newPoints);
    % initialize hull
    hull = [];
    % add first point to hull
    hull = firstpoint;
    % remove first point from dataset
    newPoints = removePoint(newPoints,firstpoint);
    currentPoint = firstpoint;
    % set prevPoint to a Point right of currentpoint (angle=0)
    prevPoint = [(currentPoint(1)+10) currentPoint(2)];
    st = 3;
  
    while ((isequal(firstpoint, currentPoint) == 0 || (st == 3)) && (numel(newPoints)> 0))
        if (st == 5)
            newPoints(end+1, :) =  firstpoint;
        end
        kNearestPoints = GetNearestNeighbors(newPoints, currentPoint, K);
        sortNearPoints = SortByAngle(kNearestPoints, currentPoint, prevPoint);
        % avoid intersections: select first candidate that does not intersect with any
        % polygon edge
        its = 1; % TRUE
        i = 1;
        while ((its==1) && (i<length(sortNearPoints)))
            i = i+1;
            if (isequal(sortNearPoints(i-1, :), firstpoint)==1) 
                lastpoint = 1;
            else
                lastpoint = 0;
            end
            j = 3;
            its = 0; % FALSE
            while((its==0) && (j<(length(hull)-lastpoint)))
                its = doLinesIntersect(hull(end, :), sortNearPoints(i-1, :),...
                                       hull(st-j-1, :), hull(st-j-0, :));
                j = j+1;                
            end     
        end
        if (its == 1)
            fprintf('All candidates intersect, restarting with k = %d\n', K+1);
            K = K+1;
            hull = concaveHull(dataset, K);
        end
        prevPoint = currentPoint;
        currentPoint = sortNearPoints(i-1, :);
        % add current point to hull
        hull(end+1,:) = currentPoint;
        newPoints = removePoint(newPoints, currentPoint);
        st = st+1;
    end
    % check if all points are inside the hull
    pContained = inpolygon(dataset(:,1), dataset(:,2), hull(:,1), hull(:,2));
    if (mean(pContained(:))<1)
        fprintf('Not all points of dataset contained in hull, restarting with k = %d\n', K+1);
        K = K+1;
        hull = concaveHull(dataset, K);
    else
       fprintf('Finished with k = %d\n', K); 
    end    
else
    fprintf('No. of initial neighbourhood points is less than 03, restarting with k = %d\n', K+1);
    K = K+1;
    hull = concaveHull(dataset, K);
end