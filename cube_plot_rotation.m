function obj = cube_plot_rotation(origin,X,Y,Z,color,alpha,beta,gamma)

Ralpha = [cos(alpha) sin(alpha) 0; -sin(alpha) cos(alpha) 0; 0 0 1];
Rbeta = [cos(beta) 0 -sin(beta); 0 1 0; sin(beta) 0 cos(beta)];
Rgamma = [cos(gamma) sin(gamma) 0; -sin(gamma) cos(gamma) 0; 0 0 1];
R = Rgamma * Rbeta * Ralpha;

ver = [1 1 0;
    0 1 0;
    0 1 1;
    1 1 1;
    0 0 1;
    1 0 1;
    1 0 0;
    0 0 0];

fac = [1 2 3 4;
    4 3 5 6;
    6 7 8 5;
    1 2 8 7;
    6 7 1 4;
    2 3 5 8];

cube = [ver(:,1)*X+origin(1),ver(:,2)*Y+origin(2),ver(:,3)*Z+origin(3)];
cube = (R*(cube.')).';
obj = patch('Faces',fac,'Vertices',cube,'FaceColor',color);
end