clear;
clc;

%Enter the path of the folder from which you want to search for similar images:
image_folder = 'C:\Users\NIKHIL YADAV\Desktop\CBIR\Sample_images';

%read all images with specific extention(e.g.-jpg/jpeg etc):
filenames = dir(fullfile(image_folder,'*.jpg'));

%total no. of images present in folder:
total_images = numel(filenames);

%reading all test images and storing in array:
for i =1:total_images
    %it will specify image name with full path and extention:
    f = fullfile(image_folder,filenames(i).name);
    
    %reading and storing dataset images into array:
    our_images = imread(f);
    dim{i} = our_images;
end

%display all dataset images:
figure;
montage(dim());

for i = 1:total_images
    %query image:
    qimg = imread('sp2.jpg');
    
    %rgb to hsv:
    qimg = rgb2hsv(qimg);
    dimg{i} = rgb2hsv(dim{i});
    
    %Split query image into hsv channels:
    hue = qimg(:,:,1);
    sat = qimg(:,:,2);
    val = qimg(:,:,3);


    %Split dataset image into hsv channels:
    Hue = dimg{i}(:,:,1);
    Sat = dimg{i}(:,:,2);
    Val = dimg{i}(:,:,3);

  

    %conversion of query image to its normalized histogram:
    hnh1 = imhist(hue)./numel(hue);
    hns1 = imhist(sat)./numel(sat);
    hnv1 = imhist(val)./numel(val);
    
    %conversion of dataset image to its normalized histogram:
    hnh2 = imhist(Hue)./numel(Hue);
    hns2 = imhist(Sat)./numel(Sat);
    hnv2 = imhist(Val)./numel(Val);

    %calculation of similarity using euclidean distance method:
    fh = sum(sqrt(hnh1-hnh2).^2);
    fs = sum(sqrt(hns1-hns2).^2);
    fv = sum(sqrt(hnv1-hnv2).^2);
    
    %Display of output images: 
    %Use comparsion values according to your requirements:
    if (abs(fh) <= 9.0000e-17 ) && (abs(fh) >= 0)&&(abs(fs) <= 7.0000e-17 ) && (abs(fs) >= 0)&&(abs(fv) <= 7.0000e-17 ) && (abs(fv) >= 0)
        figure;
        imshow(dim{i});
        
    end
    
end

    
