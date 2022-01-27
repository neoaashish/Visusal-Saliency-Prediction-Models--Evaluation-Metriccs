function ret = evaluation_final_CC_KL_SIM_NSS(LayerType,MapType)

%%%%%%PART ONE: CC SCORE%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
  strng_2 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Saliency_Maps_DeepFeat/GoogLeNet_Maps/%s/%s/%d.jpg',LayerType, MapType, m);
  saliencyMap = imread(strng_2);
  
  
  
  score_matrix(m) = CC(saliencyMap, fixationMap);
  
  m = m+1;
  
 % pause(2)
 if(m == 76)
      break;
  end
end
 CC_score_matrix_final = transpose(score_matrix);
 score_CC_final = mean(CC_score_matrix_final);
    

 
 %%%%%PART TWO: KLDiv SCORE%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
  strng_2 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Saliency_Maps_DeepFeat/GoogLeNet_Maps/%s/%s/%d.jpg',LayerType, MapType, m);
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
    
 
 %%%%%PART THREE: NSS SCORE%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 1;

score_matrix = [];



while true

  disp('m = ');
  disp(m)
  
  %reading Fixation Map
  strng_1 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Ground_Truth_Map/%d_fixPts.jpg', m);
  %fixationMap = imread([image_path_1, strng_1]);
  fixationMap = imread(strng_1);
%   
  strng_2 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Saliency_Maps_DeepFeat/GoogLeNet_Maps/%s/%s/%d.jpg',LayerType, MapType, m);
  saliencyMap = imread(strng_2);
  
  
  
  score_matrix(m) = NSS(saliencyMap, fixationMap);
  
  m = m+1;
  
 % pause(2)
 if(m == 76)
      break;
  end
end
 NSS_score_matrix_final = transpose(score_matrix);
 score_NSS_final = mean(NSS_score_matrix_final);
    


 %%%%%%PART FOUR: SIM SCORE%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
  strng_2 = sprintf('C:/Users/neoaa/OneDrive/Desktop/Aashish_Research/Saliency_Maps_DeepFeat/GoogLeNet_Maps/%s/%s/%d.jpg',LayerType, MapType, m);
  saliencyMap = imread(strng_2);
  
  
  
  score_matrix(m) = SIM(saliencyMap, fixationMap);
  
  m = m+1;
  
 % pause(2)
 if(m == 76)
      break;
  end
end
 SIM_score_matrix_final = transpose(score_matrix);
 score_SIM_final = mean(SIM_score_matrix_final);