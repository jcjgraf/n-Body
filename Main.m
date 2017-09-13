clear 

N = 5;

m = 10^12*rand(1,N);
p = rand(3,N);
v = rand(3,N);

% m = 10^13*[1, 1, 2];
% p = [0,0.5,2; 0,0,2; 0,0,0];
% v = [10,0,-5; 5,0, 3; 0,0,-25];

fc = zeros(N,N,3);
f = zeros(3,N);

a = zeros(3,N);


timeStep = 0.0001;
totalTime = 1000;
totalFrames = totalTime / timeStep;
counter = 0;

plotLims = 2;

axis tight manual
ax = gca;
ax.NextPlot = 'replaceChildren';

F(totalFrames/100) = struct('cdata', [], 'colormap', []);

grid on
hold off


% Update Data
for t = 1:totalFrames

    % All Forces between each point
    fc = getForce(N, m, p);

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
    
    [p, N, m, fc, f, v, a] = detectCollision(p, N, m, fc, f, v, a);
    disp(p)
    
    % Draw 
    if mod(t,10) == 0
        counter = counter + 1;
% TODO: setDisplaySize -> NaN setDisplaySize(m)
        scatter3(p(1,:), p(2,:),p(3,:), 200, 'filled')
        xlim([-plotLims plotLims]);
        ylim([-plotLims plotLims]);
        zlim([-plotLims plotLims]);
        drawnow
        F(counter) = getframe;
    end
    
end




