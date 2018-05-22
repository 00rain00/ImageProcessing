function [classidx,clusterC] = sfkmeans(data,k,n)
clusterC = zeros(k,3);
clusterC = datasample(data,k,'Replace',false);

classidx = zeros(size(data,1),1);
U = zeros(size(data,1),k);
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
   clusterC(i,:)= sum((U(:,i).^2).*data) ./ sum(U(:,i).^2);
   
    
end

end



end

