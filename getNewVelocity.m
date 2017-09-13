function [ newVelocity ] = getNewVelocity( currentVelocity,  oldAcceleration, newAcceleration, timeStep)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    newVelocity = 0.5 * (oldAcceleration + newAcceleration) * timeStep + currentVelocity;

end

