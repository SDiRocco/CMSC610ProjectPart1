% Linear Filter
function DiRoccoLinearFilt(OutputfilePath,Original,FilesNames,LinearFilterColor,LinearFilterWeights,cR,cG,cB)
    Filtersize = size(LinearFilterWeights);
    if Filtersize(1) ~= Filtersize(2)
        error('Linear Filter is not Square')
    elseif rem(Filtersize(1),2) == 0 || rem(Filtersize(2),2) == 0
        error('Linear Filter does not have odd sized edges')
    end
    if sum(LinearFilterWeights,'all') ~= 1
        LinearFilterWeights = LinearFilterWeights./sum(LinearFilterWeights,'all');
    end
    if strcmpi('rgb',LinearFilterColor) || strcmpi('color',LinearFilterColor)
         mkdir(OutputfilePath,'Linear Filter')
         for i = 1:1:length(Original)
             A = Original{i}(1+floor(Filtersize(1)/2):size(Original{i},1)-floor(Filtersize(1)/2),1+floor(Filtersize(1)/2):size(Original{i},2)-floor(Filtersize(1)/2),:);
             if size(A,3) == 1
                error('Gray Scale Image Inputed')
             end
             for r = 1:1:size(A,1)
                 for c = 1:1:size(A,2)
                     A(r,c,1) = sum(double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1,1)).*LinearFilterWeights,'all');
                     A(r,c,2) = sum(double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1,2)).*LinearFilterWeights,'all');
                     A(r,c,3) = sum(double(Original{i}(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1,3)).*LinearFilterWeights,'all');
                 end
             end
             imwrite(uint8(A),OutputfilePath+"Linear Filter\"+FilesNames{i},'bmp')
         end
    elseif strcmpi('gray',LinearFilterColor) || strcmpi('grayscale',LinearFilterColor)
        mkdir(OutputfilePath,'Linear Filter')
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
                     A(r,c) = sum(double(tempOriginal(r:r+Filtersize(1)-1,c:c+Filtersize(1)-1)).*LinearFilterWeights,'all');
                 end
            end
            imwrite(uint8(A),OutputfilePath+"Linear Filter\"+FilesNames{i},'bmp')
        end
    else
        error('Please Input Color Code into LinearFilterColor Variable')
    end
end