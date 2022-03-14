% DiRocco CMSC610 Project Part 1 Main
% Shawn DiRocco

% Run Main using SetUp file as string as input
% SetUp file must be in same path
function DiRoccoCMSC610ProjectPart1Main(SetupFile)
    StartTime = tic;
    %Runs Setup File to retrieve variables
    run(SetupFile)
    
    %Reads and Saves Original Images
    imds = imageDatastore(InputfilePath);
    Original = readall(imds);
    
    %Save File Names
    Files = imds.Files;
    Files = convertCharsToStrings(Files);
    match = wildcardPattern + "\";
    FilesNames = erase(Files,match);
    
    %Checking to See if amount of images matches amount inputed as Classes
    if length(Original) ~= (cyl+inter+let+modc+para+super+svar)
        error('Unequal Amount of Images in Input Folder Compared to Amount per Class')
    end

    Classes = [cyl,inter,let,modc,para,super,svar];
    Classstr = strsplit('cyl inter let mod para super svar');

    %Normalizing grayscale values to be equal to 1
    if (cR+cG+cB) ~= 1.0
        ctemp = [cR cG cB];
        cR = ctemp(1)/(ctemp(1)+ctemp(2)+ctemp(3));
        cG = ctemp(2)/(ctemp(1)+ctemp(2)+ctemp(3));
        cB = ctemp(3)/(ctemp(1)+ctemp(2)+ctemp(3));
    end
    
    disp("Setup Excution Time(s) =")
    display(toc(StartTime))

    disp("Setup Excution Time per Image(s) =")
    display(toc(StartTime)./size(Original,1))
    
    ClearTime = tic;
    % Clear Output Folder
    if strcmpi('yes',Clear)
        DiRoccoClear(OutputfilePath)
    end
    
    disp("Clear Excution Time(s) =")
    display(toc(ClearTime))

    disp("Clear Excution Time per Image(s) =")
    display(toc(ClearTime)./size(Original,1))
    
    CopyTime = tic;
    % Copy Input to Output
    if strcmpi('yes',Copy)
        DiRoccoCopy(OutputfilePath,Original,FilesNames)
    end
    
    disp("Copy Excution Time(s) =")
    display(toc(CopyTime))

    disp("Copy Excution Time per Image(s) =")
    display(toc(CopyTime)./size(Original,1))
    
    SaltTime = tic;
    %Salt and Pepper
    if strcmpi('yes',SPN)
        DiRoccoSNP(OutputfilePath,Original,FilesNames,SPNstr)
    end
    
    disp("Salt and Pepper Excution Time(s) =")
    display(toc(SaltTime))

    disp("Salt and Pepper Excution Time per Image(s) =")
    display(toc(SaltTime)./size(Original,1))

    GaussTime = tic;
    % Gaussian Noise
    if strcmpi('yes',Gauss)
        DiRoccoGaussian(OutputfilePath,Original,FilesNames,GaussStd)
    end
    
    disp("Gaussian Noise Excution Time(s) =")
    display(toc(GaussTime))

    disp("Gaussian Noise  Excution Time per Image(s) =")
    display(toc(GaussTime)./size(Original,1))

    SCTime = tic;
    %Single Color Spectrum
    if strcmpi('yes',SingleColor)
        DiRoccoSingleColor(OutputfilePath,Original,FilesNames,Color,cR,cG,cB)
    end
    
    disp("Single Color Excution Time(s) =")
    display(toc(SCTime))

    disp("Single Color  Excution Time per Image(s) =")
    display(toc(SCTime)./size(Original,1))

    HistTime = tic;
    %Histogram
    if strcmpi('yes',HistogramImage)
        DiRoccoHistogram(OutputfilePath,Original,FilesNames,HistogramColor,BinCount,cR,cG,cB)
    end
    
    disp("Histogram Excution Time(s) =")
    display(toc(HistTime))

    disp("Histogram  Excution Time per Image(s) =")
    display(toc(HistTime)./size(Original,1))

    AvgHistTime = tic;
    %Average Histogram
    if strcmpi('yes',AvgHistogram)
        DiRoccoAvgHistogram(OutputfilePath,Original,Classes,Classstr,AvgHistogramColor,AvgBinCount,cR,cG,cB)
    end
    
    disp("Average Histogram Excution Time(s) =")
    display(toc(AvgHistTime))

    disp("Average Histogram  Excution Time per Image(s) =")
    display(toc(AvgHistTime)./size(Original,1))

    HistEquTime = tic;
    % Histogram Equalization
    if strcmpi('yes',HistogramEqual)
        DiRoccoEquHistogram(OutputfilePath,Original,FilesNames,EquHistogramColor,EquBinCount,cR,cG,cB)
    end
    
    disp("Histogram Equalization Excution Time(s) =")
    display(toc(HistEquTime))

    disp("Histogram Equalization Excution Time per Image(s) =")
    display(toc(HistEquTime)./size(Original,1))

    ImgQuaTime = tic;
    % Image Quantization
    if strcmpi('yes',ImageQuant)
        DiRoccoQuant(OutputfilePath,Original,FilesNames,ImageQuantColor,P,cR,cG,cB)
    end
    
    disp("Image Quantization Excution Time(s) =")
    display(toc(ImgQuaTime))

    disp("Image Quantization Excution Time per Image(s) =")
    display(toc(ImgQuaTime)./size(Original,1))

    LinTime = tic;
    % Linear Filter
    if strcmpi('yes',LinearFilter)
        DiRoccoLinearFilt(OutputfilePath,Original,FilesNames,LinearFilterColor,LinearFilterWeights,cR,cG,cB)
    end
    
    disp("Linear Filter Excution Time(s) =")
    display(toc(LinTime))

    disp("Linear Filter Excution Time per Image(s) =")
    display(toc(LinTime)./size(Original,1))

    MedTime = tic;
    % Median Filter
    if strcmpi('yes',MedianFilter)
        DiRoccoMedianFilt(OutputfilePath,Original,FilesNames,MedianFilterColor,MedianFilterWeights,cR,cG,cB)
    end
    disp("Median Filter Excution Time(s) =")
    display(toc(MedTime))

    disp("Median Filter Excution Time per Image(s) =")
    display(toc(MedTime)./size(Original,1))

    disp("Total Excution Time(s) =")
    display(toc(StartTime))

    disp("Total Excution Time per Image(s) =")
    display(toc(StartTime)./size(Original,1))
end