%function maximum likelihood estimate
function class=calp(value,u,cov)
%calculate p for class 1
pr = zeros(1,5);

for ii = 1:5
    
    p =1;
        
        a= value-reshape(cell2mat(u(ii)),3,1);
        b = cell2mat(cov(ii))^(-1);
        temp= exp(-1/2*transpose(a)*b*a);
        temp2 = 1/((2*pi)^(2/3))*(det(cell2mat(cov(ii))))^(1/2)*temp;
           
        p = p*temp2;
  
        pr(ii) = p;
   
end
 [probability, class] = max(pr);
    





end