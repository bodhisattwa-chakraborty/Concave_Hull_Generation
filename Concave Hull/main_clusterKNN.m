%---------------------------------------------------------------------------------%
% Description:
%
%   - Concave Hull Generation from 2-dimensional data set
%       - Generate concave hull using K-nearest neighbour method
%       - Based on the paper: A K-NEAREST NEIGHBOURS APPROACH FOR THE COMPUTATION
%                             OF THE REGION OCCUPIED BY A SET OF POINTS.                 
%                             By Adriano Moreira and Maribel Yasmina Santos 2007
%
% External function used:
%   - GetFirstPoint      : Returns index of first point, which has the lowest y value
%   - removePoint        : Remove the specified point from given dataset
%   - GetNearestNeighbors: Returns indices of k nearest neighbors of point in dataset
%   - SortByAngle        : Sorts the k nearest points given by angle
%   - doLinesIntersect   : Check if line segments (a-b) and (c-d) intersect.
%   - hullLength         : Returns the total length of a hull (convex/concave)
%
% Inspired by: <https://codeclimate.com/github/sebastianbeyer/concavehull>
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
% @ Modified: 27-MARCH-2017
%             30-MARCH-2017
%
% Change Log:
%           - 27.03.2017: Bug fixes
%           - 30.03.2017: Added function to measeure the total length of
%                         concave/convex hull; measure of concaveness
%          
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%

clc; close all; clear; warning('off', 'all')

%% Initial value of K: No. of nearest neighbours to be considered 
%  (should be greater than or equal to 3) 
K = 5;
fprintf('Started with k = %d\n', K);

%% Read Data
points = csvread('SimpleData.csv');
xdata = points(:,1);
ydata = points(:,2);

%% Generate Convex Hull
startTimeHull = tic;
runTime_convexHull = [];

% Generate N-D convex hull
[cnvx, vol] = convhulln(points);

timeConvexHull = toc(startTimeHull);
runTime_convexHull = [runTime_convexHull timeConvexHull];

% Plot the convex hull
figure('Color',[1 1 1]), subplot(121),
plot(xdata, ydata, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 10); hold on
plot(xdata(cnvx), ydata(cnvx), 'Color', 'r', 'LineWidth', 2)
axis equal
str = sprintf('Convex Hull');
title(str,'fontsize',13)
set(gcf, 'Position', get(0, 'ScreenSize'));

%% Concave Hull Generation
startTimeConcaveHull = tic;
runTime_concaveHull = [];

% Generate concave hull
concaveHull = concaveHull(points, K);

timeConcaveHull = toc(startTimeConcaveHull);
runTime_concaveHull = [runTime_concaveHull timeConcaveHull];

% Calculate the area (volume) occupied by the concave hull
areaConcvHull = polyarea(concaveHull(:,1), concaveHull(:,2));

% subplot(133)
subplot(122)
plot(xdata, ydata, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 10); hold on
plot(concaveHull(:,1), concaveHull(:,2), 'Color', 'b', 'LineWidth', 2)
axis equal
str = sprintf('Concave Hull');
title(str,'fontsize',13)

%% Measure of Concaveness
% $$CM(c) = (Concave total length - Convex total
% length)/ Convex total length$$
convexHull = [xdata(cnvx(:,1)) ydata(cnvx(:,1))];
convexLen = hullLength(convexHull);
concaveLen = hullLength(concaveHull);

concaveness = (concaveLen-convexLen)/convexLen;

%% Display the parameters: Area and Measure of concaveness
fprintf('Area of convex hull: %0.4f\n', vol);
fprintf('Area of concave hull: %0.4f\n', areaConcvHull);
fprintf('Measure of concaveness: %0.4f\n', concaveness);

%% Run time estimation
fprintf('Runtime for Convex Hull Generation:  %0.6f seconds\n\n', mean(runTime_convexHull))
fprintf('Runtime for Concave Hull Generation:  %0.6f seconds\n\n', mean(runTime_concaveHull))

