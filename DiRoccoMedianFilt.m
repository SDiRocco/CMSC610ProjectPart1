% Median Filter
function DiRoccoMedianFilt(OutputfilePath,Original,FilesNames,MedianFilterColor,MedianFilterWeights,cR,cG,cB)
    Filtersize = size(MedianFilterWeights);
    if Filtersize(1) ~= Filtersize(2)
        error('Median Filter is not Square')
    elseif rem(Filtersize(1),2) == 0 || rem(Filtersize(2),2) == 0
        error('Median Filter does not have odd sized edges')
    end
    
    if sum(MedianFilterWeights,'all') ~= 1
        MedianFilterWeights = MedianFilterWeights./sum(MedianFilterWeights,'all');
    end

    if strcmpi('rgb',MedianFilterColor) || strcmpi('color',MedianFilterColor)
        mkdir(OutputfilePath,'Median Filter')
         for i = 1:1:length(Original)
             A = Original{i}(1+floor(Filtersize(1)/2):size(Original{i},1)-floor(Filtersize(1)/2),1+floor(Filtersize(1)/2):size(Original{i},2)-floor(Filtersize(1)/2),:);
             if size(A,3) == 1
                error('Gray Scale Image Inputed')
             end
             for r = 1:1:size(A,1)
                 for c = 1:1:size(A,2)
                     A(r,c,1) = median(double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1,1)).*MedianFilterWeights,'all');
                     A(r,c,2) = median(double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1,2)).*MedianFilterWeights,'all');
                     A(r,c,3) = median(double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1,3)).*MedianFilterWeights,'all');
                 end
             end
             imwrite(uint8(A),OutputfilePath+"Median Filter\"+FilesNames{i},'bmp')
         end
    elseif strcmpi('gray',MedianFilterColor) || strcmpi('grayscale',MedianFilterColor)
        mkdir(OutputfilePath,'Median Filter')
        for i = 1:1:length(Original)
            A = Original{i}(1+floor(Filtersize(1)/2):size(Original{i},1)-floor(Filtersize(1)/2),1+floor(Filtersize(1)/2):size(Original{i},2)-floor(Filtersize(1)/2),:);
            if size(A,3) == 3
                A = cR*A(:,:,1)+cG*A(:,:,2)+cB*A(:,:,3);
                tempOriginal = cR*Original{i}(:,:,1)+cG*Original{i}(:,:,2)+cB*Original{i}(:,:,3);
            else
                tempOriginal = Original{i};
            end

            for r = 1:1:size(A,1)
                 for c = 1:1:size(A,2)
                     A(r,c) = median(double(tempOriginal(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1)).*MedianFilterWeights,'all');
                 end
            end
            imwrite(uint8(A),OutputfilePath+"Median Filter\"+FilesNames{i},'bmp')
        end
    else
        error('Please Input Color Code into MedianFilterColor Variable')
    end
end