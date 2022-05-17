%Matlab generates GIF images  

clc;close all;clear; warning off;

[filename, folder] = uigetfile('*.mp4;*.avi');     
filename = [ folder, filename,];

obj = VideoReader(filename) ;     

numFrames = obj.NumberOfFrame;  
obj_height = obj.Height;   
obj_Width = obj.Width;   

 
len = 100;
imageArray = zeros(obj_height, obj_Width, 3, len);

for k = 1 : len     
     newFrame = read(obj, k);  
     imageArray(:,:,:,k) = newFrame;
end
 
GifName = 'medicalIMG.gif';
delay = 0.05;       % Delay between frames (s)
for ii = 1:len
    A = uint8(imageArray(:,:,:,ii));
    [X, map] = rgb2ind(A, 256);
    if ii == 1
        imwrite(X, map, GifName, 'gif', 'LoopCount', inf, 'DelayTime', delay)
    else
        imwrite(X, map, GifName, 'gif', 'WriteMode', 'append', 'DelayTime', delay)
    end
end


