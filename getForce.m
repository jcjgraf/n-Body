function [ fc ] = getForce( N, m, p)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    G = 6.6*10^-11;
    
    fc = zeros(N,N,3);
    
    for i = 1:N
       for j = 1:N
           if j ~= i
               dvec = p(:,j) - p(:,i);
                d = norm(dvec);
               
               fc(i, j, :) = (G * m(i) * m(j) * dvec) / d^3;

           end
       end
    end
end

