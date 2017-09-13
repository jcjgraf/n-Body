function  newPos = getNewPosition( currentPos, acceleration, velocity, timeStep )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

    newPos = 0.5 * acceleration * timeStep ^ 2 + velocity * timeStep + currentPos;
end
