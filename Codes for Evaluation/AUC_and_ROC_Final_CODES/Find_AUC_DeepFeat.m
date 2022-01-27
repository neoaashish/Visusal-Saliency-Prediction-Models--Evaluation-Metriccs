
function [score_matrix_final, score_final] = Find_AUC_DeepFeat(LayerName,MapType)

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
  strng_1 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Ground_Truth_Map/fixation_maps/%d_fixPts.jpg', m);
  %fixationMap = imread([image_path_1, strng_1]);
  fixationMap = imread(strng_1);
% 

  strng_2 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Saliency_Maps_DeepFeat/GoogLeNet_Maps/%s/%s/%d.jpg',LayerName,MapType,m);
  salMap = imread(strng_2);


% compute AUC-Borji
saliencyMap = im2double(salMap);

[score,tp,fp,allthreshes] = AUC_Judd_for_combined_ROC(saliencyMap, fixationMap);


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

 
