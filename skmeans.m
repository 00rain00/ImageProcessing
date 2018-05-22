function [clusterid,clusterC] = skmeans(data,k,n)
%SKMEANS Summary of this function goes here
%random select points according to k
clusterC = zeros(k,2);
clusterC = datasample(data,k,'Replace',false);
clusterid = zeros(size(data,1),1);
items=size(data,1);
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
    temp = clusterall(:,3)==i;
    temp = clusterall(temp,1:2);
    temp = mean(temp);
    clusterC(i,:) = temp;
end



end




end

