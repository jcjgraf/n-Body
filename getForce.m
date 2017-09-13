function [ f ] = getForce( m1, m2, p1, p2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    G = 6.6*10^-11;
    
    dvec = p2 - p1;
    d = norm(dvec);
    
    f = (G * m1 * m2 * dvec) / d^3;

end

