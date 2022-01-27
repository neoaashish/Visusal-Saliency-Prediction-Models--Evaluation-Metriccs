clc
clear 
close all

addpath(genpath('./src'));
addpath(genpath('./sc-master'));

 m = [5 7 8 10 26 37 40 41 75 ];
 
 i = 1;
 
 while true
     
strng_1 = sprintf('C:/Users/Deep Learning/Desktop/Model Comparison/create_color_salmap/%d.jpg', m(i));

im = (imread(strng_1));

path = sprintf('C:/Users/Deep Learning/Desktop/Model Comparison/DeepFeat_Google_Incep/Maps/%d.jpg',m(i));
salMap = imread(path);



if size(salMap, 1)~=size(im, 1) || size(salMap, 2)~=size(im, 2)
    im = imresize(im, size(salMap));
end

sc(cat(3, salMap, im), 'prob_jet');

pause(15);

i = i+1;
if (i == 10)
    break
end
 end

