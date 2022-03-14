% Image Quantization
function DiRoccoQuant(OutputfilePath,Original,FilesNames,ImageQuantColor,P,cR,cG,cB)
    P = floor(P);
    roundtargets = linspace(0,255,P);
    if strcmpi('rgb',ImageQuantColor) || strcmpi('color',ImageQuantColor)
        mkdir(OutputfilePath,'Image Quant')
        for i = 1:1:length(Original)
            total = [];
            A = double(Original{i});
            if size(A,3) == 1
                error('Gray Scale Image Inputed')
            end
            for r = 1:1:size(A,1)
                A(r,:,1) = interp1(roundtargets,roundtargets,A(r,:,1),'nearest');
                A(r,:,2) = interp1(roundtargets,roundtargets,A(r,:,2),'nearest');
                A(r,:,3) = interp1(roundtargets,roundtargets,A(r,:,3),'nearest');
            end
            A = uint8(A);
            total = [total sum((Original{i}-A).^2,'all')/(size(A,1)*size(A,2))];
            imwrite(A,OutputfilePath+"Image Quant\"+FilesNames{i},'bmp')
        end
        disp('MSQE =')
        display(sum(total)/length(Original))
    elseif strcmpi('gray',ImageQuantColor) || strcmpi('grayscale',ImageQuantColor)
        mkdir(OutputfilePath,'Image Quant')
        for i = 1:1:length(Original)
            A = double(Original{i});
            if size(A,3) == 3
                A = cR*A(:,:,1)+cG*A(:,:,2)+cB*A(:,:,3);
            end
            total = [];
            for r = 1:1:size(A,1)
                A(r,:) = interp1(roundtargets,roundtargets,A(r,:),'nearest');
            end
            A = uint8(A);
            total = [total sum((Original{i}-A).^2,'all')/(size(A,1)*size(A,2))];
            imwrite(A,OutputfilePath+"Image Quant\"+FilesNames{i},'bmp')
        end
        disp('MSQE =')
        display(sum(total)/length(Original))
    else
        error('Please Input Color Code into ImageQuantColor Variable')
    end
end