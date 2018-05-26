function [classidx,clusterC] = sfkmeans(data,k,n)
clusterC = zeros(k,3);
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
%can put in the main function
for j = 1:k
     figure, plot((1:n),variance(:,j));
    
end



end

