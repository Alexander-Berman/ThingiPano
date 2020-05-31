function map = proj_panoview(cld, vertex, face)
	orig = cld.orig;
	orig_x = orig(1);
	orig_y = orig(2);
	X = cld.X;
	Y = cld.Y;
	Z = cld.Z;
    [m, n] = size(X);

	vert1 = vertex(face(:,1),:);
	vert2 = vertex(face(:,2),:);
	vert3 = vertex(face(:,3),:);
    
    %% compute the depth of all vertex
    depth = sqrt(max(((vertex(:,1)-orig_x).^2 + (vertex(:,2)-orig_y).^2), 0.0001));
    %% max depth for each face(triangle)
    %depth1 = depth(face(:,1));
    %depth2 = depth(face(:,2));
    %depth3 = depth(face(:,3));
    max_depth = max([depth(face(:, 1)), depth(face(:,2)), depth(face(:,3))], [], 2);
    %max_depth = max(max(depth1, depth2), depth3);
    %face_min_depth = min(min(depth1, depth2), depth3);
    [~, depth_idx] = sort(max_depth, 'descend');
    
    %% project all vertex to the clinder
	%[m,n,myTri1,myTri2,myTri3]=triangleProjection(cld, vertex, face);
    new_vertex = proj_vertex(cld, vertex);
    new_v1 = new_vertex(face(:, 1), :);
    new_v2 = new_vertex(face(:, 2), :);
    new_v3 = new_vertex(face(:, 3), :);
    point_sets = find_points_in_triangle(new_v1, new_v2, new_v3, m, n);
    num_face = size(vert1, 1);
    C = zeros(m,n);
    
	for m = 1:num_face
        i = depth_idx(m);
        point_idx = point_sets{i}+1;
        if length(point_idx)<1
            continue;
        end
        idx = sub2ind(size(C), point_idx(:, 2), point_idx(:, 1));
        idx_use = idx(C(idx)<max_depth(i));
        if length(idx_use)<1
            continue;
        end
        orig = zeros(length(idx_use), 3);
        orig(:,1) = orig_x;
        orig(:,2) = orig_y;
        orig(:,3) = Z(idx_use);
        direction = [X(idx_use), Y(idx_use), zeros(length(idx_use),1)];
        direction = direction./repmat(sqrt(sum((direction.^2), 2)), 1,3);
        [intersect, t, ~,~,~] = TriangleRayIntersection(orig, direction, vert1(i,:), vert2(i,:), vert3(i,:));
        if sum(intersect)
            inter_idx = find(intersect==1);
            new_depth = t(inter_idx);
            C(idx_use(inter_idx)) = max(C(idx_use(inter_idx)), new_depth);
        end
    end
	map = mat2gray(C);
end



