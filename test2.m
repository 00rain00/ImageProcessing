clear;
clc;
%read image
pic = imread('pic.bmp');
%construct training vector


dataCell=cell(5);
meanCell=cell(5);
covCell=cell(5);
%select points & cal mean & covariance
for t=1:5
    imshow(pic,'InitialMagnification',200);
    [xi,yi] = getpts;
    points =impixel(pic,xi,yi);
    dataCell(t) = {points};
    meanCell(t)={mean(points)};
    covCell(t)={cov(points)};
end



result = construct(pic,meanCell,covCell);

img = result.resultpic;
c1 = result.c{1};
c2 = result.c{2};
c3 = result.c{3};
c4 = result.c{4};
c5 = result.c{5};
% % select 100 sample from the first selection
% sc1 = datasample(c1,1000,'Replace',false);
% sc2 = datasample(c2,1000,'Replace',false);
% sc3 = datasample(c3,1000,'Replace',false);
% sc4 = datasample(c4,1000,'Replace',false);
% sc5 = datasample(c5,1000,'Replace',false);
% scall={sc1,sc2,sc3,sc4,sc5};
% 
% 
% %repeat calculating the parameters
% for t=1:5
%     temp = scall{t};
%     row = zeros(1,1000);
% col= zeros(1,1000);
%     for p = 1:1000
%        codinate = temp{p};
%         
%         row = codinate(1,1);
%         col = codinate(1,2);
%         xi(p) = col;
%         yi(p) = row;
%     end
%     points =impixel(pic,xi,yi);
%     dataCell(t) = {points};
%     meanCell(t)={mean(points)};
%     covCell(t)={cov(points)};
%     
% end
% result2 = construct(pic, meanCell,covCell);
% img2 = result2.resultpic;
% 
% 
% 
% 
