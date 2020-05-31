function exMap = extendMap(origMap, verRatio, horRatio)
if(nargin ==1)
    verRatio = 0.1;
    horRatio = 0.5;
end 
[m, n] = size(origMap);
boundery = zeros(floor(verRatio*m), n);
exMap = [boundery;origMap;boundery];
exMap = [exMap, exMap(:, 1:floor(horRatio*n))];
end