close all
clearvars
clc
% adds all files and folders in the provided directory

% read the human data from the directory stored in data_path
data_path = 'Fixation_Data/';
data_dir = dir([data_path, '*.mat']);

for i = 1 : size(data_dir, 1)
    
    usr = importdata([data_path, data_dir(i).name]);
    
    for k = 1 : size(usr.data, 2)
        strng = usr.data(k).name;
        num = str2double(strng(1 : end - 4));
        
        if size(usr.data(k).x, 1) == 1 || size(usr.data(k).x, 2) == 1 
            fix_data(num).name = strng;
            fix_data(num).observer(i).x = usr.data(k).x;
            fix_data(num).observer(i).y = usr.data(k).y;
        end
    end
    

    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% resolution of the HP monitor
row = 1080;
col = 1920;

height_pix = 1080;
width_pix = 1920;

ppd = 61; % degree of visual angle in pixels per degree

%batch = [1,2,3,4]; % batch numbers.


%for index = 1 : 4
%index = 1;
% read images from the corresponding batch number
img_path = ['image_dataset_new/Batch_',num2str(1),'/'];
%img_path = ['image_dataset_new'];
img_dir = dir([img_path, '*.jpg']);

for ii = 1 : size(img_dir, 1)
    s = img_dir(ii).name;
    imgList(ii) = str2double(s(1:end-4));
end
% store image names into a list
imgList = sort(imgList);



for i = 1 : size(img_dir,1)
    % read an image from the list
    strng = [num2str(imgList(i)), '.jpg'];
    im = imread([img_path, strng]);
    [x,y,~] = size(im);    

    % defining the new resolution
    r = x / y;
    
    if x > y
        new_row = row;
        new_col = row / r;
    else
        new_col = col;
        new_row = col * r;
    end

    new_row = round(new_row);
    new_col = round(new_col);
    img = imresize(im, [new_row, new_col]);

    % pad the initial fixation map
    pad_x = abs(row - new_row);
    pad_y = abs(col - new_col);
    
    pad = zeros(new_row + pad_x, new_col + pad_y, 3);
    pad(pad_x/2 + 1 : pad_x/2 + new_row, pad_y/2 + 1 : pad_y/2 + new_col, :) = img;
    
    map = zeros(new_row + pad_x, new_col + pad_y);

    % placing the fixation point on the fixation map as ones
    if size(fix_data(imgList(i)).observer,1) ~= 0
        for k = 1 : size(fix_data(imgList(i)).observer, 2)
            if size(fix_data(imgList(i)).observer(k).x,1) ~= 0
                L = size(fix_data(imgList(i)).observer(k).x,2);
                for j = 1 : L
                    X = round(fix_data(imgList(i)).observer(k).y(j));
                    Y = round(fix_data(imgList(i)).observer(k).x(j));
                    
                    map(X,Y) = 1;
                end
            end
        end

        % blurring the binary fixation maps with cut off frequency equivalent to the degree of visual angle
        [fix, ~] = antonioGaussian(map, ppd);
        fix = uint8((fix - min(fix(:))) ./ (max(fix(:)) - min(fix(:))) .* 255);
        fixMap = fix(pad_x/2 + 1 : pad_x/2 + new_row, pad_y/2 + 1 : pad_y/2 + new_col);

        % saving the fixation blurred maps
        imwrite(fixMap, ['fixation_maps_aashish_new/', strng(1:end-4), '_fixMap.jpg']);
        
        pts = map(pad_x/2 + 1 : pad_x/2 + new_row, pad_y/2 + 1 : pad_y/2 + new_col);
        %disp(pts);
        %pause(15);
        fixPts = uint8(pts .* 255);
        
      

        % saving the binary fixation maps
        imwrite(fixPts, ['fixation_maps_aashish_new/', strng(1:end-4), '_fixPts.jpg'])
    end
%         
end
%end
    
