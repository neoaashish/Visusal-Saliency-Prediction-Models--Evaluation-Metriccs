function ret = evaluation_KL(ModelType)


m = 1;

score_matrix = [];



while true

  disp('m = ');
  disp(m)
  
  %reading Fixation Map
  strng_1 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Ground_Truth_Map/%d_fixMap.jpg', m);
  %fixationMap = imread([image_path_1, strng_1]);
  fixationMap = imread(strng_1);
%   
  strng_2 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Eight_Other_Model_Maps_For_Comparison/%s/Maps/%d.jpg',ModelType, m);
  saliencyMap = imread(strng_2);
  
  
  
  score_matrix(m) = KLdiv(saliencyMap, fixationMap);
  
  m = m+1;
  
 % pause(2)
 if(m == 76)
      break;
  end
end
 KLDiv_score_matrix_final = transpose(score_matrix);
 score_KLdiv_final = mean(KLDiv_score_matrix_final);
    
 