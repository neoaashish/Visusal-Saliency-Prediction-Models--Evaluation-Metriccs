close all
clearvars
clc

warning('off','all')
tic;

n = 1;

while  true
 
strng_1 = sprintf('/Users/Deep Learning/Desktop/DeepFeat/image_dataset/%d.jpg', n);

salMap_All = gbvs(strng_1);

salMap = salMap_All.master_map_resized;

baseFileName = sprintf('%d.jpg', n); 
fullFileName = fullfile('C:/Users/Deep Learning/Desktop/Model Comparison/gbvs/Maps', baseFileName);
imwrite(salMap, fullFileName);

n = n + 1;
 if (n == 76)
     break
 end
end
