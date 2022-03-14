% Salt and Pepper Noise
function DiRoccoSNP(OutputfilePath,Original,FilesNames,SPNstr)
    mkdir(OutputfilePath,'SaltandPepper')
    % Making strength inbetween 0 and 1
    if SPNstr > 1
        SPNstr = 1;
    end
    if SPNstr < 0
        SPNstr = 0;
    end
        
    for i = 1:1:length(Original)
        A = Original{i};
        for r = 1:1:size(A,1)
            for c = 1:1:size(A,2)
                if rand() <= SPNstr
                    if rand() >= 0.5
                        A(r,c,:) = 255;
                    else
                        A(r,c,:) = 0;
                    end
                end
            end
        end
        imwrite(A,OutputfilePath+"SaltandPepper\"+FilesNames{i},'bmp')
   end
end