function point_sets = find_points_in_triangle(vertex1,vertex2,vertex3,m,n)
	v = [vertex1(:, 1), vertex2(:, 1), vertex3(:, 1)];
	sort_v = sort(v, 2, 'descend');
	%max-min
	difference = sort_v(:, 1) - sort_v(:, 3);
	idx = find(difference(:, 1)>n/2);
	tmp = v(idx, :);
    tmp(tmp>n/2) = tmp(tmp>n/2)-n;
	v(idx, :) = reshape(tmp, size(v(idx, :)));
	trans_v1 = [v(:, 1), vertex1(:, 2), vertex1(:,3)];
	trans_v2 = [v(:, 2), vertex2(:, 2), vertex2(:,3)];
	trans_v3 = [v(:, 3), vertex3(:, 2), vertex3(:,3)]; 

    vertex = cat(3, trans_v1, trans_v2, trans_v3);
    max_v = ceil(max(vertex, [], 3));
    min_v = floor(min(vertex, [], 3));

    %max_tri=max(max(vertex1,vertex2),vertex3);
	%min_tri=min(min(vertex1,vertex2),vertex3);
	%mid_tri=min(min(max(vertex1,vertex2),max(vertex1,vertex3)),max(vertex2,vertex3));
	num_face = size(vertex1, 1);
	point_sets = cell(num_face, 1);
	for j = 1:num_face
		bottom_x = min_v(j,1);
		top_x = max_v(j,1);
        temp_x = bottom_x:1:top_x;

		bottom_y = min_v(j,2);
		top_y = max_v(j,2);
        temp_y = bottom_y:1:top_y;

        [x, y] = meshgrid(temp_x, temp_y);
        x = x(:);
        y = y(:);
        x(x<0) = x(x<0)+n;
        point_sets{j} = [x, y];
    end
end






