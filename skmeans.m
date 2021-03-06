function [clusterid,clusterC,variance] = skmeans(data,k,n)
%SKMEANS Summary of this function goes here
%random select points according to k
clusterC = zeros(k,2);
clusterC = datasample(data,k,'Replace',false);
clusterid = zeros(size(data,1),1);
items=size(data,1);
variance=zeros(n,k);
for a = 1:n
for i =1:items
    item = data(i,:);
    temp = vertcat(item,clusterC);
    distance = pdist(temp);
    id = find(distance==min(distance(1:k)));
    clusterid(i,1) = id;
    
end
clusterall=horzcat(data,clusterid);


%update center
for i=1:k
    
  
    temp = mean(clusterall(clusterall(:,3)==i,1:2));
    
    variance(a,i)=pdist([clusterC(i,:);temp]);
    
    clusterC(i,:) = temp;
end



end
  for j = 1:k
      figure, plot((1:n),variance(:,j));
  end
  



end

