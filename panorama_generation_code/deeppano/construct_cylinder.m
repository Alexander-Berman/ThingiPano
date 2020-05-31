function cld = construct_cylinder(vertex)
%Construct a cylinder with points(X, Y, Z) and origin
%[X, Y, Z, orig]
nhor_div = 500;%800;%2*pi*1
nver_div = 300;%400;%round(nhor_div*(zmax-zmin)/(2*pi));
zmax = max(vertex(:,3));
zmin = min(vertex(:,3));
[x,y,z] = cylinder(ones(nver_div,1),nhor_div);
x = x-mean(mean(x)*(mean(x(:))>10e-3));
y = y-mean(mean(y)*(mean(y(:))>10e-3));
maxz = max(z(:));   
minz = min(z(:));
z = (z-minz)*(zmax - zmin)/(maxz-minz)+zmin ;

origX = mean(vertex(:,1));
origY = mean(vertex(:,2));
origZ = 0;
orig = [origX, origY, origZ];

cld.X = x;
cld.Y = y;
cld.Z = z;
cld.orig = orig;
end

