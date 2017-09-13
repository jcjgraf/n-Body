function [ newP ] = detectCollision( p, m, N )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    manipulated = false;

    for i = 1:length(p(1,:))
        if ~manipulated
            for j = 1:length(p(1,:))
                if ~manipulated
                    if i ~= j
    %                 TODO: Calculate Radius!
    %                 sumRadius = (m(i) + m(j)) * 10^-13;
                        sumRadius = 0.1;
                        dist = norm(p(:,i) - p(:,j));

                        if sumRadius >= dist %Point i and j collided -> i,j index of p

                            manipulated = true;
                            disp('collision')

                            % Manipulate data
                            p(:,j) = [];
                            N = N - 1;

                            m(i) = m(i) + m(j);
                            m(j) = [];



                        end
                    end
                else
                    break
                end
            end
        else
            break
        end
    end
    
    % For the case that there is no collision
    newP = p;
    newN = N;
%     newM = m;
end

