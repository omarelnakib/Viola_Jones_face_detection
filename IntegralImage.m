function f = IntegralImage(I,row,col)

f=zeros(row,col);
for i=1:row
    for j=1:col
            if  i-1 <=0 && j-1 <= 0
                        f(i,j)=I(i,j);
                        elseif j-1 <= 0
                        f(i,j)=I(i,j)+f(i-1,j);
                        elseif i-1 <=0 
                        f(i,j)=I(i,j)+f(i,j-1); 
                        else
                       f(i,j)=I(i,j)+f(i,j-1)+f(i-1,j)-f(i-1,j-1);
            end
    end
end