
function [fpr_final,tpr_final, score_final] = Find_Borji_ROC_Curve_General(ModelName)

TPR_matrices = cell(1,5);
FPR_matrices = cell(1,5);
FPR_combined_matrix = [];
TPR_combined_matrix = [];

score_matrix = [];
count = 76;
  m = 1;
  while true 

  disp('m = ');
  disp(m)
  
  
 %reading Fixation Map
  strng_1 = sprintf('C:/Users/Deep Learning/Desktop/DeepFeat/fixation_maps/%d_fixPts.jpg', m);
  %fixationMap = imread([image_path_1, strng_1]);
  fixationMap = imread(strng_1);
% 

  strng_2 = sprintf('C:/Users/Deep Learning/Desktop/Model Comparison/%s/Maps/%d.jpg',ModelName,m);
  salMap = imread(strng_2);


% compute AUC-Borji
saliencyMap = im2double(salMap);

[score,tp,fp,allthreshes] = AUC_Borji_for_combined_ROC(saliencyMap, fixationMap);


    TPR_matrices{m} = tp;
    FPR_matrices{m} = fp;
    elements_threshold = allthreshes;
    number_of_elements = size(elements_threshold);
    score_matrix(m) = score;
  
  m = m+1;
 
 
 if(m == count)
      break;
  end
  end
  
score_matrix_final = transpose(score_matrix); 
score_final = round(mean(score_matrix_final),3);

 

 y_points_individual = cell(1,75); %cell size actually updates automatically
 
 step_size = 20;
 x_axis_new = linspace(0, 1, step_size);

 for k = 1:length(TPR_matrices)%i.e from 1 to 75, number of images
 
       
    y_1 = transpose(TPR_matrices{k});
    x_1 = transpose(FPR_matrices{k});
    
    %%%WE NEED TO AVOID DUPLICATE POINTS %%%%%
    [x_1, index] = unique(x_1); 
    y_points_individual {k} = interp1(x_1, y_1(index), x_axis_new, 'linear');
    
     
end


  %%%CREATING A SINGLE MATRIX WITH ALL INDIVIDUAL tPR POINTS%%%
for k = 1:length(y_points_individual)%i.e from 1 to 75, number of images
    content = y_points_individual{k};
    for p = 1:length(content)
        y_point_matrix_all_together(p,k) = content(1,p);
    end
end
    
y_points_final = mean(y_point_matrix_all_together,2);
x_points_final = x_axis_new;


fpr_final = smooth(x_points_final);
tpr_final = smooth(y_points_final);
