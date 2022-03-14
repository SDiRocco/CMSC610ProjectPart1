% Histogram Equalization
function DiRoccoEquHistogram(OutputfilePath,Original,FilesNames,EquHistogramColor,EquBinCount,cR,cG,cB)
        if strcmpi('rgb',EquHistogramColor) || strcmpi('color',EquHistogramColor)
            mkdir(OutputfilePath,'Histogram Equalization')
            for i = 1:1:length(Original)
                A = Original{i};
                if size(A,3) == 1
                    error('Gray Scale Image Inputed')
                end
                numofpixels = size(A,1)*size(A,2);
                for j = 1:1:size(A,3)
                    freq=zeros(256,1);
                    probf=zeros(256,1);
                    probc=zeros(256,1);
                    cum=zeros(256,1);
                    output=zeros(256,1);
                    for r = 1:1:size(A,1)
                        for c = 1:1:size(A,2)
                            value=A(r,c,j);
                            freq(value+1)=freq(value+1)+1;
                            probf(value+1)=freq(value+1)/numofpixels;
                        end
                    end
                    sum=0;
                    for t=1:size(probf)
                        sum=sum+freq(t);
                        cum(t)=sum;
                        probc(t)=cum(t)/numofpixels;
                        output(t)=round(probc(t)*EquBinCount);
                    end
                    for r = 1:1:size(A,1)
                        for c = 1:1:size(A,2)
                            A(r,c,j) = output(Original{i}(r,c)+1);
                        end
                    end
                end
                imwrite(A,OutputfilePath+"Histogram Equalization\"+FilesNames{i},'bmp')
            end
        elseif strcmpi('gray',EquHistogramColor) || strcmpi('grayscale',EquHistogramColor)
            mkdir(OutputfilePath,'Histogram Equalization')
            for i = 1:1:length(Original)
                A = Original{i};
                if size(A,3) == 3
                    A = cR*A(:,:,1)+cG*A(:,:,2)+cB*A(:,:,3);
                end
                numofpixels = size(A,1)*size(A,2);
                freq=zeros(256,1);
                probf=zeros(256,1);
                probc=zeros(256,1);
                cum=zeros(256,1);
                output=zeros(256,1);
                for r = 1:1:size(A,1)
                    for c = 1:1:size(A,2)
                        value=A(r,c);
                        freq(value+1)=freq(value+1)+1;
                        probf(value+1)=freq(value+1)/numofpixels;
                    end
                end
                sum=0;
                for t=1:size(probf)
                    sum=sum+freq(t);
                    cum(t)=sum;
                    probc(t)=cum(t)/numofpixels;
                    output(t)=round(probc(t)*EquBinCount);
                end
                for r = 1:1:size(A,1)
                    for c = 1:1:size(A,2)
                        A(r,c) = output(Original{i}(r,c)+1);
                     end
                end
                imwrite(A,OutputfilePath+"Histogram Equalization\"+FilesNames{i},'bmp')
            end
        else
            error('Please Input Color Code into EquHistogramColor Variable')
        end   
end