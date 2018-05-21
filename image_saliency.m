function Emean=image_saliency(x)
[rows, cols, dim]=size(x);

%sobel operator used to calculate gradient image
Grd=[ -1 -2 -1;
       0  0  0;
       1  2  1];

   Emean=zeros(rows,cols);
for i=1:dim
    Eh(:,:,i)=conv2(x(:,:,i),Grd,'same');
    Ev(:,:,i)=conv2(x(:,:,i),Grd.','same');
    E(:,:,i)=abs(Eh(:,:,i))+abs(Ev(:,:,i));


end
Emean=1/dim*sum(E,3);  