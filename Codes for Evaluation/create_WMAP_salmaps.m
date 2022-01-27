close all
clearvars
clc

warning('off','all')
tic;

n = 1;

while  true
 
strng_1 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish Research/Final Evaluation Codes/image_dataset_new/Batch_1/%d.jpg', n);

salMap = WMAP(strng_1);

salMap = salMap - min(min(salMap));
salMap = salMap / max(max(salMap));


baseFileName = sprintf('%d.jpg', n); 
fullFileName = fullfile('C:/Users/neoaa/OneDrive/Desktop/WMAP/Maps', baseFileName);
imwrite(salMap, fullFileName);

n = n + 1;
 if (n == 76)
     break
 end
end
