function get_features_pano(file,outfile)
    addpath('stlTools/stlTools/')
    addpath('deeppano')
    
    [~,~,ext] = fileparts(file);
    if strcmpi(ext,".stl")
        [VM,FM,~,~] = stlRead(file);
    elseif strcmpi(ext,".off")
        [VM,FM] =  read_off(file);
        VM = VM';
    elseif strcmpi(ext,".obj")
        obj = readObj(file);
        VM = obj.v;
        FM = obj.f.v;
    end
    
    all_image = get_pano(VM,FM);
    
    cVM = VM;
    cVM(:,2)=VM(:,3);
    cVM(:,3)=VM(:,2);
    all_image = [all_image;get_pano(cVM,FM)];
    
    cVM = VM;
    cVM(:,1)=VM(:,3);
    cVM(:,3)=VM(:,1);
    all_image = [all_image;get_pano(cVM,FM)];
    
    img_file = sprintf(outfile);
    imwrite(mat2gray(all_image*255),img_file)
end