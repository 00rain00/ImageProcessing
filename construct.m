function resultStr = construct(pic,meanCell,covCell)
%CONSTRUCT Summary of this function goes here
%   Detailed explanation goes here
c1 = {};
c2 = {};
c3 = {};
c4 = {};
c5 = {};

%generating result image
resultpic = zeros(350,450,3);
for i = 1:350
 for j = 1:450
     pixel = double(reshape(pic(i,j,:),3,1));
     result = calp(pixel,meanCell,covCell);
     if result == 1
         %0 51 204 0 102 0
         resultpic(i,j,1)=0; 
        resultpic(i,j,2)=51;
        resultpic(i,j,3)=204;
      c1{end+1} =[i,j];
        
     elseif result ==2
        resultpic(i,j,1)=0;
         resultpic(i,j,2)=255;
         resultpic(i,j,3)=0;
        c2{end+1} =[i,j];
     elseif result==3
        resultpic(i,j,1)=255;
         resultpic(i,j,2)=255;
         resultpic(i,j,3)=0;
     c3{end+1} =[i,j];
     elseif result == 4
        resultpic(i,j,1)=255;
         resultpic(i,j,2)=255;
         resultpic(i,j,3)=255;
    c4{end+1} =[i,j];
     elseif result == 5
        resultpic(i,j,1)=255;
         resultpic(i,j,2)=0;
         resultpic(i,j,3)=0;
   c5{end+1} =[i,j];
     end
     
 end
end
resultStr.resultpic = resultpic;
c = {c1,c2,c3,c4,c5};
resultStr.c = c;


end

