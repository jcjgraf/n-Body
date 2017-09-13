function [ newSize ] = setDisplaySize( currentSize )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%     TODO: Create algorithm
    
    maxElement = max(currentSize);
    minElement = min(currentSize);
    
    maxSize = 200;
    minSize = 50;

    a = (maxSize - minSize) / (maxElement - minElement);
    
    newSize = a * currentSize + minSize - a * minElement;

end

