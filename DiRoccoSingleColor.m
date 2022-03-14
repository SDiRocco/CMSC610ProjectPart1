function DiRoccoSingleColor(OutputfilePath,Original,FilesNames,Color,cR,cG,cB)
        if strcmpi(Color,'r') || strcmpi(Color,'red')
            mkdir(OutputfilePath,'Single Color')
            for i = 1:1:length(Original)
                A = Original{i};
                if size(A,3) == 1
                    error('Gray Scale Image Inputed')
                end
                A(:,:,2:3) = 0;
                imwrite(A,OutputfilePath+"Single Color\"+FilesNames{i},'bmp')
            end
        
        elseif strcmpi(Color,'g') || strcmpi(Color,'green')
            mkdir(OutputfilePath,'Single Color')
            for i = 1:1:length(Original)
                A = Original{i};
                if size(A,3) == 1
                    error('Gray Scale Image Inputed')
                end
                A(:,:,1) = 0;
                A(:,:,3) = 0;
                imwrite(A,OutputfilePath+"Single Color\"+FilesNames{i},'bmp')
            end

        elseif strcmpi(Color,'b') || strcmpi(Color,'blue')
            mkdir(OutputfilePath,'Single Color')
            for i = 1:1:length(Original)
                A = Original{i};
                if size(A,3) == 1
                    error('Gray Scale Image Inputed')
                end
                A(:,:,1:2) = 0;
                imwrite(A,OutputfilePath+"Single Color\"+FilesNames{i},'bmp')
            end

        elseif strcmpi(Color,'gray') || strcmpi(Color,'grayscale')
            mkdir(OutputfilePath,'Single Color')
            for i = 1:1:length(Original)
                A = Original{i};
                if size(A,3) == 3
                    A = cR*A(:,:,1)+cG*A(:,:,2)+cB*A(:,:,3);
                end
                imwrite(A,OutputfilePath+"Single Color\"+FilesNames{i},'bmp')
            end
        else
            error('Please Input Color Code into Color Variable')
        end
end