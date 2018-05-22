function [uvalues,classid] = membership(point,clusterSet)
%MEMBERSHIP Summary of this function goes here
%   Detailed explanation goes here
clusters = size(clusterSet,1);


   temp = vertcat(point,clusterSet);
   distance = pdist(temp);
   
   distance = distance(1:clusters);
   for i = 1:length(distance)
       temp = distance(i);
       if temp == 0
           distance(i)=0.0001;
       end
   end
   
   uvalues = (distance.^-1)./sum(distance.^-1);
   classid= find(uvalues==max(uvalues));
  
%     if isnan(uvalues)~=0
%         disp(distance);
%     end
    
        



end

