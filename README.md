# CBIR-Using-MATLAB

## ABOUT:
#### This is a image search engine which uses hsv/rgb features of images and euclidean distance method to search for similar images in a given folder using query image.
#### 'cmp_rgb.m' uses rgb(Red-blue-Green) features of a image.
#### 'cmp_hsv.m' uses hsv(Hue-Saturation-value) features of a image.

## REQUIREMENTS:
#### 1.MATLAB.
#### 2.SAMPLE IMAGES - A set of images from which you want to find similar images(I have provided a 'Sample_images' folder along with code so that you can use them to test the code if needed).
#### 3.Query Image - Image whose similar images you want to find from a given folder(You can use one from sample images itself).

## WORKING OF CODE:
#### 1.First of all it reads all the images with specific extention(e.g.-jpg/jpeg etc) from the given folder e.g. in our code image format '.jpg' and folder location 'C:\Users\NIKHIL YADAV\Desktop\CBIR\Sample_images'.
#### 2.After that it will read and store them in an array.
#### 3.Now they will be split into rgb/hsv channels and later conversion of images into vector will take place.
#### 4.Finally similarity between query image and test images will be done using EUCLIDEAN DISTANCE METHOD.
#### 5.Output will be displayed by suitable comparision values in if statement.

## THANK YOU!
