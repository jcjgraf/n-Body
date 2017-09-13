clear 

N = 2;

m = 10^13*rand(1,N);
% p = rand(3,N);
% v = rand(3,N);

p = [0,1; 0,0; 0,0];
v = zeros(3, N);

fc = zeros(N,N,3);
f = zeros(3,N);

a = zeros(3,N);


timeStep = 0.0001;
totalTime = 1000;
totalFrames = totalTime / timeStep;
counter = 0;

axis tight manual
ax = gca;
ax.NextPlot = 'replaceChildren';

F(totalFrames/100) = struct('cdata', [], 'colormap', []);
plotLims = 2 ;


% Update Data
for t = 1:totalFrames
    % All Forces between each point
    for i = 1:N
       for j = 1:N
           if j ~= i
               fc(i, j, :) = getForce(m(i), m(j), p(:,i),p(:,j));

           end
       end
    end

    % Resulting Force of each point
    for i = 1:N
        f(:,i) = sum(fc(i,:,:),2);
    end

    % Acceleration of each point
    aCache = a;
    for i = 1:N
        a(:,i) = f(:,i)/m(i);
    end
    
    % Update velocity and the position
    v = getNewVelocity(v, aCache, a, timeStep);
    p = getNewPosition(p, a, v, timeStep);
   
    disp('---')
    disp(p)
    p = detectCollision(p, m, N);
    
    disp('reasign')
    disp(p)
    disp('---')
    
    % Draw 
    if mod(t,10) == 0
        counter = counter + 1;
        hold on
        scatter3(p(1,:), p(2,:),p(3,:), setDisplaySize(m), 'filled')
        xlim([-plotLims plotLims]);
        ylim([-plotLims plotLims]);
        zlim([-plotLims plotLims]);
        grid on
        drawnow
        F(counter) = getframe;
    end
    
end




