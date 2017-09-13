function [ newP, newN, newM, newFc, newF, newV, newA ] = detectCollision( p, N, m, fc, f, v, a  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    manipulated = false;

    for i = 1:length(p(1,:))
        if ~manipulated
            for j = 1:length(p(1,:))
                if ~manipulated
                    if i ~= j
% TODO: Calculate Radius!
    %                 sumRadius = (m(i) + m(j)) * 10^-13;
                        sumRadius = 0.05;
                        dist = norm(p(:,i) - p(:,j));

                        if sumRadius >= dist %Point i and j collided -> i,j index of p / Remove j and keep i

                            manipulated = true;
                            disp('collision')

                            % Manipulate data
                            p(:,j) = [];
                            N = N - 1;
                            
                            a(:,i) = a(:,i) + a(:,j);
                            a(:,j) = [];
                            
                            v(:,i) = (m(i) * v(:,i) + m(j) * v(:,j)) / (m(i) + m(j));
                            v(:,j) = [];
                            
                            m(i) = m(i) + m(j);
                            m(j) = [];
                            
% TODO: J = ((m(i) * m(j)) / (m(i) + m(j))) * (v(j) - v(i))
                            f(:,i) = f(:,i) + f(:,j);
                            f(:,j) = [];
                            
                            fc = getForce(N, m, p);
                            
                          
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
    
    newP = p;
    newN = N;
    newM = m;
    newFc = fc;
    newF = f;
    newV = v;
    newA = a;
end

