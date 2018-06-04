alpha = 30;
beta = 20;
gamma = 70;
alpha = degtorad(alpha);
beta = degtorad(beta);
gamma = degtorad(gamma);
rotation_per_frame = 0.01;

cubelength = 5;

hold on;
view(3);
grid on;
axis equal;

loops = 1/rotation_per_frame + 1;
F(loops) = struct('cdata',[],'colormap',[]);
for i = 1:(loops)
    obj = cube_plot_rotation([0;0;0], cubelength, cubelength, cubelength, 'red', alpha*(i-1)*rotation_per_frame, beta*(i-1)*rotation_per_frame, gamma*(i-1)*rotation_per_frame);
    axis([-7 7 -7 7 -7 7])
    drawnow
    F(i) = getframe;
    pause(rotation_per_frame);
    if i ~= loops
        delete(obj)
    end
end