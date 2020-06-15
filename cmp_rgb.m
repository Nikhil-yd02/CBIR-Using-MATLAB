%Enter the path of the folder
folder = 'D:\dataset';

%read images with specific extention
filenames = dir(fullfile(folder,'*.jpg'));

totalImages = numel(filenames);

%reading all test images and storing in array:
for n =1:totalImages
    %it will specify image name with full path and extention:
    g = fullfile(folder,filenames(n).name);
    
    images = imread(g);
    Image{n} = images;
end


for n = 1:totalImages
    %input image:
    Orgimg = imread('bbt3.jpg');
    
    %Split input image into rgb channels:
    Red = Orgimg (:,:,1);
    Green = Orgimg (:,:,2);
    Blue = Orgimg (:,:,3);


    %Spliting test images into rgb 
    red = Image{n}(:,:,1);
    green = Image{n}(:,:,2);
    blue = Image{n}(:,:,3);

  

    %conversion of image into vector
    r1 = imhist(Red)./numel(Red);
    r2 = imhist(red)./numel(red);
    
    
    g1 = imhist(Green)./numel(Green);
    g2 = imhist(green)./numel(green);
    
    
    b1 = imhist(Blue)./numel(Blue);
    b2 = imhist(blue)./numel(blue);

    %calculating the similarity
    r = sum(sqrt(r1-r2).^2);
    g = sum(sqrt(g1-g2).^2);
    b = sum(sqrt(b1-b2).^2);
    
    %Displaying the output
    if (abs(r) <= 8.0000e-17 ) && (abs(r) >= 0)&&(abs(g) <= 6.0000e-17 ) && (abs(g) >= 0)&&(abs(b) <= 6.0000e-17 ) && (abs(b) >= 0)
        figure;
        imshow(Image{n});
    end
    
    
end

