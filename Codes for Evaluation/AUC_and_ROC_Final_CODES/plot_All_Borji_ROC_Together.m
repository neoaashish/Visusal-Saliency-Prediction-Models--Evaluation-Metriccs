% Plot all ROC Curves Together


close all
clearvars
clc



[fpr_CovSal, tpr_CovSal, Score_CovSal] = Find_Borji_ROC_Curve_General('CovSal');
[fpr_DeepFeat, tpr_DeepFeat, Score_DeepFeat] = Find_Borji_ROC_Curve_General('DeepFeat_Google_Incep');
%[fpr_FES, tpr_FES, Score_FES] = Find_Borji_ROC_Curve_General('FES');
% [fpr_SAM_Vgg16, tpr_SAM_Vgg16, Score_SAM_Vgg16] = Find_Borji_ROC_Curve_General('SAM_Vgg16');
[fpr_gbvs, tpr_gbvs, Score_gbvs] = Find_Borji_ROC_Curve_General('gbvs');
[fpr_IttiKoch, tpr_IttiKoch, Score_IttiKoch] = Find_Borji_ROC_Curve_General('IttiKoch');
[fpr_UHF, tpr_UHF, Score_UHF] = Find_Borji_ROC_Curve_General('UHF');
[fpr_WMAP, tpr_WMAP, Score_WMAP] = Find_Borji_ROC_Curve_General('WMAP');
[fpr_SAM_Resnet, tpr_SAM_Resnet, Score_SAM_Resnet] = Find_Borji_ROC_Curve_General('SAM_Resnet');
[fpr_eDN, tpr_eDN, Score_eDN] = Find_Borji_ROC_Curve_General('eDN');


    p8 = plot(fpr_CovSal,tpr_CovSal,'.b-'); %title('Area Under ROC Curve : ')
    p8.LineWidth = 1.25;
    xlabel('False Positive','fontweight','bold','fontsize',16); ylabel('True Positive','fontweight', 'bold','fontsize',16);
    grid on;
    xlim([0 1])
    xticks(0:0.2:1)
    ylim([0 1])
    yticks(0:0.2:1)
    hold on;
    
    p7 = plot(fpr_WMAP,tpr_WMAP,'c-');    
    p7.LineWidth = 1.25;
    hold on;
    
%     p7 = plot(fpr_FES,tpr_FES,'m-');    
%     p7.LineWidth = 1.25;
%     hold on;
    
    p1 = plot(fpr_DeepFeat,tpr_DeepFeat,'r-');   
    p1.LineWidth = 1.5;
    hold on;
    
    p3 = plot(fpr_gbvs,tpr_gbvs,'y-');    
    p3.LineWidth = 1.25;
    hold on;
    
    p6 = plot(fpr_IttiKoch,tpr_IttiKoch,'g-');    
    p6.LineWidth = 1.25;
    hold on;
    
    p4 = plot(fpr_UHF,tpr_UHF,'k-');    
    p4.LineWidth = 1.25;
    hold on;
    
    p5 = plot(fpr_SAM_Resnet,tpr_SAM_Resnet,'-', 'Color', [0.4940 0.1840 0.5560]);    
    p5.LineWidth = 1.25;
    hold on;
    
    p2 = plot(fpr_eDN,tpr_eDN,'-','Color',[0.6350 0.0780 0.1840]);    
    p2.LineWidth = 1.25;
    hold on;
    
      
    lgd = legend;
    
    lgd.Location = 'southeast';
    lgd.FontSize = 10;
    lgd.Orientation = 'vertical';
    
    legend([p1 p2 p3 p4 p5 p6 p7 p8],strcat('DF GoogLeNet - AUC: ',num2str(Score_DeepFeat)), strcat('eDN - AUC: ', num2str(Score_eDN)), strcat('GBVS - AUC: ',num2str(Score_gbvs)),  strcat('UHF - AUC: ', num2str(Score_UHF)), strcat('SAM Resnet - AUC: ',num2str(Score_SAM_Resnet)), strcat('IttiKoch - AUC: ', num2str(Score_IttiKoch)), strcat('WMAP - AUC: ', num2str(Score_WMAP)) , strcat('CovSal - AUC: ',num2str(Score_CovSal))) 
    
   