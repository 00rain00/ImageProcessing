function [classidx,clusterC,variance] = sfkmeans(pic,data,k,n)
clusterC = zeros(k,3);
% for t=1:5
%     imshow(pic,'InitialMagnification',200);
%     [xi,yi] = getpts;
%     points =impixel(pic,xi,yi);
%     clusterC(t,:)=rgb2lab(points);
%     
%    
% end
clusterC = datasample(data,k,'Replace',false);
classidx = zeros(size(data,1),1);
U = zeros(size(data,1),k);
variance=zeros(n,k);
%compute u values
items=size(data,1);
for a = 1:n
    
for i =1:items
    item = data(i,:);
    
    [uvalue, classid] = membership(item,clusterC);
    
    U(i,:) = uvalue;
    classidx(i,:)=classid;
    
end
%update center
for i=1:k
   
   temp = sum((U(:,i).^2).*data) ./ sum(U(:,i).^2);
  
   variance(a,i) = pdist([clusterC(i,:);temp]);
    clusterC(i,:) = temp;
end
end
end

