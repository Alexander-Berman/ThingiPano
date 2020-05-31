function new_vertex = proj_vertex(cld, vertex)
	orig = cld.orig;
    [m, n] = size(cld.X);
	%% tranform the orignal coordinate system of all vertices(faces) to the new one
	%% ensure the main axis is z-axis
	trans_vertex = vertex - repmat([orig(1), orig(2), 0], size(vertex, 1), 1);
	%% 
	[theta, radius, height] = cart2pol(trans_vertex(:,1),trans_vertex(:,2),trans_vertex(:, 3));
	theta(theta<0) = theta(theta<0) + 2*pi;
	%% normaize X to 0~(n-1), Y to 0~(m-1)
	new_vertex = [theta/(2*pi)*(n-1), (height-min(height))/(max(height)-min(height))*(m-1), radius];
end


