% Image Histogram
function DiRoccoHistogram(OutputfilePath,Original,FilesNames,HistogramColor,BinCount,cR,cG,cB)
        if strcmpi('gray',HistogramColor) || strcmpi('grayscale',HistogramColor) 
            mkdir(OutputfilePath,'Histogram')
            for i = 1:1:length(Original)
                A = Original{i};
                if size(A,3) == 3
                    A = cR*A(:,:,1)+cG*A(:,:,2)+cB*A(:,:,3);
                end
                f = figure('visible','off');
                histogram(A,BinCount)
                xlabel("Luminance")
                ylabel('Count')
                title(['Histogram for ',FilesNames{i}])
                saveas(f,OutputfilePath+"Histogram\"+FilesNames{i},'bmp')
            end
        elseif strcmpi('rgb',HistogramColor) || strcmpi('color',HistogramColor)
            mkdir(OutputfilePath,'Histogram')
            for i = 1:1:length(Original)
                A = Original{i};
                if size(A,3) == 1
                    error('Gray Scale Image Inputed')
                end
                f = figure('visible','off');
                hold on
                histogram(A(:,:,1),BinCount,'FaceColor','r')
                histogram(A(:,:,2),BinCount,'FaceColor','g')
                histogram(A(:,:,3),BinCount,'FaceColor','b')
                legend('Red','Green','Blue')
                xlabel("Luminance")
                ylabel('Count')
                title(['Histogram for ',FilesNames{i}])
                hold off
                saveas(f,OutputfilePath+"Histogram\"+FilesNames{i},'bmp')
            end
        else
            error('Please Input Color Code into HistogramColor Variable')
        end
end