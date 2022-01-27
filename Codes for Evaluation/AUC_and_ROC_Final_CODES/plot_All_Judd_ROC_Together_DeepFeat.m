% Plot all Judd ROC Curves Together for DeepFeat


close all
clearvars
clc



%[fpr_TD, tpr_TD, Score_TD] = Find_Judd_ROC_Curve_General_For_DeepFeat('Concat','TD');%Pass the Layer Name and Map Type
[fpr_BU, tpr_BU, Score_BU] = Find_Judd_ROC_Curve_General_For_DeepFeat('Concat', 'BU');
[fpr_NCB, tpr_NCB, Score_NCB] = Find_Judd_ROC_Curve_General_For_DeepFeat('Concat', 'NCB');
[fpr_CB, tpr_CB, Score_CB] = Find_Judd_ROC_Curve_General_For_DeepFeat('Concat', 'CB');



%     p4 = plot(fpr_TD,tpr_TD,'b-'); title('AUC Judd Score')%Layer Name
%     p4.LineWidth = 1.5;
%     xlabel('False Positive','fontweight','bold','fontsize',16); ylabel('True Positive','fontweight', 'bold','fontsize',16);
%     grid on;
%     xlim([0 1])
% %     xticks([0 0.2 0.4 0.6 0.8 1])
%     set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1])
%     ylim([0 1])
% %     yticks([0 0.2 0.4 0.6 0.8 1])
%     set(gca,'YTick',[0 0.2 0.4 0.6 0.8 1])
%     hold on;
%     
%     p3 = plot(fpr_BU,tpr_BU,'k-');    
%     p3.LineWidth = 1.5;
%     hold on;
%     
%    
%     p1 = plot(fpr_CB,tpr_CB,'r-');   
%     p1.LineWidth = 1.5;
%     hold on;
%     
%     p2 = plot(fpr_NCB,tpr_NCB,'g-');    
%     p2.LineWidth = 1.5;
%     hold on;
%     
% %     lgd = legend;
% %     
% %     lgd.Location = 'southeast';
% %     lgd.FontSize = 10;
% %     lgd.Orientation = 'vertical';
%     
%     legend([p1 p2 p3 p4],strcat('With Centre Bias: ',num2str(Score_CB)), strcat('Without Centre Bias: ',num2str(Score_NCB)), strcat('Bottom Up Map: ',num2str(Score_BU)),strcat('Top Down Map: ',num2str(Score_TD)), 'Location', 'southeast', 'Orientation', 'vertical', 'FontSize', 10) 
%     
%    