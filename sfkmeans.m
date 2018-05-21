function [clusterid,clusterC] = sfkmeans(data,k)
clusterC = zeros(k,2);
clusterC = datasample(data,k,'Replace',false);
clusterid = zeros(size(data,1),1);
items=size(data,1);
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

