% DiRocco CMSC 601 Project Part 1 Setup
% Shawn DiRocco

% File Path of Images
InputfilePath = 'C:\Users\mail9\Desktop\DiRoccoCMSC601Project\Input Images\Cancerous cell smears\*.bmp';

% Output Path of Images
OutputfilePath = 'C:\Users\mail9\Desktop\DiRoccoCMSC601Project\Output\';

% Amount of Each Type of Cell
cyl = 50;
inter = 50;
let = 100;
modc = 100;
para = 50;
super = 50;
svar = 100;

% Grayscale Weights
cR = 0.299;
cG = 0.587;
cB = 0.114;

% Clear Output Folder
% To Clear Input 'Yes'
% Else Input Anything Else
Clear = 'Yes';

% Copy Input Images to Output
% To Copy Input 'Yes'
% Else Input Anything Else
Copy = 'Yes';

% Salt and Pepper Noise
% To Add Salt and Pepper Noise Input "Yes'
% Else Input Anything Else
SPN = 'Yes';

% Salt and Pepper Noise Strength (0-1)
% Input value between (0-1)
SPNstr = 0.25;

% Guassian Noise
% To Add Guassian Noise Input "Yes'
% Else Input Anything Else
Gauss = 'Yes';

% Guassian Noise Standard Deviation
GaussStd = 25;

% Single Color
% To Extract Single Color Input 'Yes'
% Else Input Anything Else
SingleColor = 'Yes';
% Input: 'r','g','b','red','green,'blue','gray','grayscale'
Color = 'r';

% RGB or Grayscale Historgram
% To Create Histogram Input 'Yes'
% Else Input Anything Else
HistogramImage = 'Yes';

% Histogram Bin Count
% Input a Scalar
BinCount = 100;

% To decide between RGB or Grayscale Histogram Input
% 'rgb','color','grayscale','gray'
% Else Input Anything Else
HistogramColor = 'rgb';

% Average Histogram per Class
% To Create Average Histogram Input 'Yes'
% Else Input Anything Else
AvgHistogram = 'Yes';

% Average Histogram Bin Count
% Input a Scalar
AvgBinCount = 50;

% To decide between RGB or Grayscale Avgerage Histogram Input
% 'rgb','color','grayscale','gray'
% Else Input Anything Else
AvgHistogramColor = 'rgb';

% Histogram Equalization
% To Apply Histogram Equalization Input 'Yes'
% Else Input Anything Else
HistogramEqual = 'Yes';

% To decide between RGB or Grayscale Equalization Histogram Input
% 'rgb','color','grayscale','gray'
% Else Input Anything Else
EquHistogramColor = 'rgb';

% Histogram Equalization Bin Count
% Input a Scalar
EquBinCount = 255;

% Image Quanitzation
% To Apply Image Quanization Input 'Yes'
% Else Input Anything Else
ImageQuant = 'Yes';

% To decide between RGB or Grayscale Image Quanitzation Input
% 'rgb','color','grayscale','gray'
% Else Input Anything Else
ImageQuantColor = 'rgb';

% Quanitzation Level
% Input Scaler Value
P = 50;

% Linear Filter
% To Apply a Linear Filter Input 'Yes'
% Else Input Anything Else
LinearFilter = 'Yes';

% To decide between RGB or Grayscale Linear Filter Input
% 'rgb','color','grayscale','gray'
% Else Input Anything Else

LinearFilterColor = 'rgb';

% Linear Filter Weights
% Input Filter Weights
% Must be odd and square in shape (3x3,5x5,7x7,...)
LinearFilterWeights = [1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9];

% Median Filter
% To Apply a Median Filter Input 'Yes'
% Else Input Anything Else
MedianFilter = 'Yes';

% To decide between RGB or Grayscale Median Filter Input
% 'rgb','color','grayscale','gray'
% Else Input Anything Else

MedianFilterColor = 'rgb';

% Median Filter Weights
% Input Filter Weights
% Must be odd and square in shape (3x3,5x5,7x7,...)
MedianFilterWeights = [1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9];

