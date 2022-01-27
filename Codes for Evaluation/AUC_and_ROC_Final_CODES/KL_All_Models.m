close all
clearvars
clc

warning('off','all')
tic;

evaluation_KL('covSal')
evaluation_KL('eDN')
evaluation_KL('FES')
evaluation_KL('gbvs')
evaluation_KL('IttiKoch')
evaluation_KL('SAM_Resnet')
evaluation_KL('SAM_Vgg16')
evaluation_KL('UHM')
evaluation_KL('WMAP')


