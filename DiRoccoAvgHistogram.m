% Average Histogram
function DiRoccoAvgHistogram(OutputfilePath,Original,Classes,Classstr,AvgHistogramColor,AvgBinCount,cR,cG,cB)
        if strcmpi('gray',AvgHistogramColor) || strcmpi('grayscale',AvgHistogramColor)
            mkdir(OutputfilePath,'Average Histogram')
            counter = 0;
            for i = 1:1:length(Classes)
                Avg = [];
                for j = 1:1:Classes(i)
                    counter = counter + 1;
                    A = Original{counter};
                    if size(A,3) == 3
                        A = cR*A(:,:,1)+cG*A(:,:,2)+cB*A(:,:,3);
                    end
                    Avg = [Avg mean(A)];
                end
                f = figure('visible','off');
                histogram(Avg,AvgBinCount)
                xlabel("Luminance")
                ylabel('Count')
                title(['Average Histogram for ',Classstr(i)])
                saveas(f,OutputfilePath+"Average Histogram\"+Classstr{i},'bmp')
            end
        elseif strcmpi('rgb',AvgHistogramColor) || strcmpi('color',AvgHistogramColor)
            mkdir(OutputfilePath,'Average Histogram')
            counter = 0;
            for i = 1:1:length(Classes)
                Avgr = [];
                Avgg = [];
                Avgb = [];
                for j = 1:1:Classes(i)
                    counter = counter + 1;
                    A = Original{counter};
                    if size(A,3) == 1
                        error('Gray Scale Image Inputed')
                    end
                    Avgr = [Avgr mean(A(:,:,1))];
                    Avgg = [Avgg mean(A(:,:,2))];
                    Avgb = [Avgb mean(A(:,:,3))];
                end
                f = figure('visible','off');
                hold on
                histogram(Avgr,AvgBinCount,'FaceColor','r')
                histogram(Avgg,AvgBinCount,'FaceColor','g')
                histogram(Avgb,AvgBinCount,'FaceColor','b')
                legend('Red','Green','Blue')
                xlabel("Luminance")
                ylabel('Count')
                title(['Average Histogram for ',Classstr(i)])
                hold off
                saveas(f,OutputfilePath+"Average Histogram\"+Classstr{i},'bmp')
            end
        else
            error('Please Input Color Code into AvgHistogramColor Variable')
        end
end