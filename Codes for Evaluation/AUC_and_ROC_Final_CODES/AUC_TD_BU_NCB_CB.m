% Plot all ROC Curves Together


close all
clearvars
clc



% [BU_ALL, Score_BU_All] = Find_AUC_DeepFeat('All','BU','bottomUp');
% [TD_ALL, Score_TD_All] = Find_AUC_DeepFeat('All','TD','topDown');
% [NCB_ALL, Score_NCB_All] = Find_AUC_DeepFeat('All','NCB','NCB');
% [CB_ALL, Score_CB_All] = Find_AUC_DeepFeat('All','CB','CB');
% 
% 
% [BU_CONV, Score_BU_Conv] = Find_AUC_DeepFeat('Conv','BU','bottomUp');
% [TD_CONV,Score_TD_Conv] = Find_AUC_DeepFeat('Conv','TD','topDown');
% [NCB_CONV, Score_NCB_Conv] = Find_AUC_DeepFeat('Conv','NCB','NCB');
% [CB_CONV, Score_CB_Conv] = Find_AUC_DeepFeat('Conv','CB','CB');
% 
% 
% [BU_RELU, Score_BU_ReLU] = Find_AUC_DeepFeat('ReLU','BU','bottomUp');
% [TD_RELU, Score_TD_ReLU] = Find_AUC_DeepFeat('ReLU','TD','topDown');
% [NCB_RELU, Score_NCB_ReLU] = Find_AUC_DeepFeat('ReLU','NCB','NCB');
% [CB_RELU, Score_CB_ReLU] = Find_AUC_DeepFeat('ReLU','CB','CB');

[BU_Pool, Score_BU_Pool] = Find_AUC_DeepFeat('Pool','BU');
[TD_Pool, Score_TD_Pool] = Find_AUC_DeepFeat('Pool','TD');
[NCB_Pool, Score_NCB_Pool] = Find_AUC_DeepFeat('Pool','NCB');
[CB_Pool, Score_CB_Pool] = Find_AUC_DeepFeat('Pool','CB');

[BU_Incep, Score_BU_Incep] = Find_AUC_DeepFeat('Incep','BU');
[TD_Incep, Score_TD_Incep] = Find_AUC_DeepFeat('Incep','TD');
[NCB_Incep, Score_NCB_Incep] = Find_AUC_DeepFeat('Incep','NCB');
[CB_Incep, Score_CB_Incep] = Find_AUC_DeepFeat('Incep','CB');

% [BU_Blocks, Score_BU_Blocks] = Find_AUC_DeepFeat('Blocks','BU','bottomUp');
% [TD_Blocks, Score_TD_Blocks] = Find_AUC_DeepFeat('Blocks','TD','topDown');
% [NCB_Blocks, Score_NCB_Blocks] = Find_AUC_DeepFeat('Blocks','NCB','NCB');
% [CB_Blocks, Score_CB_Blocks] = Find_AUC_DeepFeat('Blocks','CB','CB');
