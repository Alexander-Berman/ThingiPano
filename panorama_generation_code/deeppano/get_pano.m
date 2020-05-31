function panoview=get_pano(vertex,face)
    %vertex = vertex';  face =face';

    %% construct cylinder for projection
    cld = construct_cylinder(vertex);

    %%  take the average coordinates of all triangles weighted by their respective area
    %%  as the origin of the cylinder
    tri1 = vertex(face(:,1),:);
    tri2 = vertex(face(:,2),:);
    tri3 = vertex(face(:,3),:);
    area = triangleArea3d(tri1,tri2,tri3);
    meantri = (tri1+tri2+tri3)/3;
    cld.orig = sum(meantri.*repmat(area, 1, 3), 1)./sum(area);

    %% project all triangles to the constructed cylinder 
    proj_map = proj_panoview(cld, vertex, face);

    %% extend the projection map
    panoview = extend_map(proj_map);
    %pano_image=mat2gray(panoview);
    %image(pano_image)
end