% Gaussian Noise
function DiRoccoGaussian(OutputfilePath,Original,FilesNames,GaussStd)
    mkdir(OutputfilePath,'Gaussian')
    for i = 1:1:length(Original)
        A = Original{i};
        Noise = uint8(GaussStd*randn(size(A)));
        A = A+Noise;
        imwrite(A,OutputfilePath+"Gaussian\"+FilesNames{i},'bmp')
    end
end