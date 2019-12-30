function e = Ihaarf(I,row,col,num_features)
f = zeros(4,num_features);
e = zeros(1,num_features);
%sum of feature 1 calculation
findex=1;
countLoop= 0;
count=1;
featureRow = 1;
for i=1:row
    for j=1:col
        h=1;
        while (h+i-1<=row)
            w=1;
            while((2*w+j-1)<=col)
        
                        if i-1 <=0 && j-1 <=0
                        s1=I(i+h-1,j+w-1);
                        elseif i-1<=0
                            s1=I(i+h-1,j+w-1)-I(i+h-1,j-1);
                        elseif j-1 <=0
                            s1 = I(i+h-1,j+w-1)-I(i-1,j+w-1);
                        else
                        s1=I(i+h-1,j+w-1)-I(i-1,j+w-1)+I(i-1,j-1)-I(i+h-1,j-1);
                       
                        end
                        if i-1 <=0 && (w+j)-1 <=0
                        s2=I(i+h-1,j+2*w-1);
                        elseif i-1<=0
                            s2=I(i+h-1,j+2*w-1)-I(i+h-1,(w+j)-1);
                        elseif (w+j)-1 <=0
                            s2 = I(i+h-1,j+2*w-1)-I(i-1,2*w+j-1);
                        else
                        s2=I(i+h-1,j+2*w-1)-I(i-1,2*w+j-1)+I(i-1,(w+j)-1)-I(i+h-1,(w+j)-1);
                        end
             
            countLoop= countLoop +1;
                        f(featureRow,findex)=abs(s1-s2);
                        e(featureRow,count)=f(1,findex);
                        count = count + 1;
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end
featureRow = featureRow + 1;
%sum of feature 2 calculation
findex=1;
countLoop= 0;

for i=1:row
    for j=1:col
        h=1;
        while (h+i-1<=row)
            w=1;
            while((3*w+j-1)<=col)
        %s1 calculation
                        if i-1 <=0 && j-1 <=0
                        s1=I(i+h-1,j+w-1);
                        elseif i-1<=0
                            s1=I(i+h-1,j+w-1)-I(i+h-1,j-1);
                        elseif j-1 <=0
                            s1 = I(i+h-1,j+w-1)-I(i-1,j+w-1);
                        else
                        s1=I(i+h-1,j+w-1)-I(i-1,j+w-1)+I(i-1,j-1)-I(i+h-1,j-1);
                        end
                        %s2 calculation
                        if i-1 <=0 && (w+j)-1 <=0
                        s2=I(i+h-1,j+2*w-1);
                        elseif i-1<=0
                            s2=I(i+h-1,j+2*w-1)-I(i+h-1,(w+j)-1);
                        elseif (w+j)-1 <=0
                            s2 = I(i+h-1,j+2*w-1)-I(i-1,2*w+j-1);
                        else
                        s2=I(i+h-1,j+2*w-1)-I(i-1,2*w+j-1)+I(i-1,(w+j)-1)-I(i+h-1,(w+j)-1);
                        end
               %s3 calculation
                        if i-1 <=0 && (2*w+j)-1 <=0
                        s3=I(i+h-1,3*w+j-1);
                        elseif i-1<=0
                            s3=I(i+h-1,3*w+j-1)-I(i+h-1,(2*w+j)-1);
                        elseif (2*w+j)-1 <=0
                            s3 = I(i+h-1,j+2*w-1)-I(i-1,3*w+j-1);
                        else
                        s3=I(i+h-1,3*w+j-1)-I(i-1,3*w+j-1)+I(i-1,(2*w+j)-1)-I(i+h-1,(2*w+j)-1);
                        end
             
            countLoop= countLoop +1;
                        f(featureRow,findex)=abs(s1-s2+s3);
                          e(1,count)=f(1,findex);
                        count = count + 1;
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end

featureRow = featureRow + 1;
%sum of feature 3 calculation
findex=1;
countLoop= 0;

for i=1:row
    for j=1:col
        h=1;
        while (2*h+i-1<=row)
            w=1;
            while((w+j-1)<=col)
        %s1 calculation
                        if i-1 <=0 && j-1 <=0
                        s1=I(i+h-1,j+w-1);
                        elseif i-1<=0
                            s1=I(i+h-1,j+w-1)-I(i+h-1,j-1);
                        elseif j-1 <=0
                            s1 = I(i+h-1,j+w-1)-I(i-1,j+w-1);
                        else
                        s1=I(i+h-1,j+w-1)-I(i-1,j+w-1)+I(i-1,j-1)-I(i+h-1,j-1);
                        end
                        %s2 calculation
                        if h+i-1 <=0 && (j)-1 <=0
                        s2=I(i+2*h-1,w+j-1);
                        elseif h+i-1<=0
                            s2=I(i+2*h-1,w+j-1)-I(i+2*h-1,(j)-1);
                        elseif (j)-1 <=0
                            s2 = I(i+2*h-1,w+j-1)-I(h+i-1,w+j-1);
                        else
                        s2=I(i+2*h-1,w+j-1)-I(h+i-1,w+j-1)+I(h+i-1,(j)-1)-I(i+2*h-1,(j)-1);
                        end
              
            countLoop= countLoop +1;
                        f(featureRow,findex)=abs(s1-s2);
                          e(1,count)=f(1,findex);
                        count = count + 1;
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end
featureRow = featureRow + 1;

%sum of feature 4 calculation
findex=1;
countLoop= 0;

for i=1:row
    for j=1:col
        h=1;
        while (3*h+i-1<=row)
            w=1;
            while((w+j-1)<=col)
        %s1 calculation
                        if i-1 <=0 && j-1 <=0
                        s1=I(i+h-1,j+w-1);
                        elseif i-1<=0
                            s1=I(i+h-1,j+w-1)-I(i+h-1,j-1);
                        elseif j-1 <=0
                            s1 = I(i+h-1,j+w-1)-I(i-1,j+w-1);
                        else
                        s1=I(i+h-1,j+w-1)-I(i-1,j+w-1)+I(i-1,j-1)-I(i+h-1,j-1);
                        end
                        %s2 calculation
                        if h+i-1 <=0 && (j)-1 <=0
                        s2=I(i+2*h-1,w+j-1);
                        elseif h+i-1<=0
                            s2=I(i+2*h-1,w+j-1)-I(i+2*h-1,(j)-1);
                        elseif (j)-1 <=0
                            s2 = I(i+2*h-1,w+j-1)-I(h+i-1,w+j-1);
                        else
                        s2=I(i+2*h-1,w+j-1)-I(h+i-1,w+j-1)+I(h+i-1,(j)-1)-I(i+2*h-1,(j)-1);
                        end
                %s3 calculation
                        if 2*h+i-1 <=0 && (j)-1 <=0
                        s3=I(i+3*h-1,w+j-1);
                        elseif 2*h+i-1<=0
                            s3=I(i+3*h-1,w+j-1)-I(i+3*h-1,(j)-1);
                        elseif (j)-1 <=0
                            s3 = I(i+3*h-1,w+j-1)-I(2*h+i-1,w+j-1);
                        else
                        s3=I(i+3*h-1,w+j-1)-I(2*h+i-1,w+j-1)+I(2*h+i-1,(j)-1)-I(i+3*h-1,(j)-1);
                        end
            countLoop= countLoop +1;
                        f(featureRow,findex)=abs(s1-s2+s3);
                          e(1,count)=f(1,findex);
                        count = count + 1;
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end

featureRow = featureRow + 1;
%sum of feature 5 calculation
findex=1;
countLoop= 0;

for i=1:row
    for j=1:col
        h=1;
        while (2*h+i-1<=row)
            w=1;
            while((2*w+j-1)<=col)
        %s1 calculation
                        if i-1 <=0 && j-1 <=0
                        s1=I(i+h-1,j+w-1);
                        elseif i-1<=0
                            s1=I(i+h-1,j+w-1)-I(i+h-1,j-1);
                        elseif j-1 <=0
                            s1 = I(i+h-1,j+w-1)-I(i-1,j+w-1);
                        else
                        s1=I(i+h-1,j+w-1)-I(i-1,j+w-1)+I(i-1,j-1)-I(i+h-1,j-1);
                        end
                        %s2 calculation
                        if h+i-1 <=0 && (j)-1 <=0
                        s2=I(i+2*h-1,w+j-1);
                        elseif h+i-1<=0
                            s2=I(i+2*h-1,w+j-1)-I(i+2*h-1,(j)-1);
                        elseif (j)-1 <=0
                            s2 = I(i+2*h-1,w+j-1)-I(h+i-1,w+j-1);
                        else
                        s2=I(i+2*h-1,w+j-1)-I(h+i-1,w+j-1)+I(h+i-1,(j)-1)-I(i+2*h-1,(j)-1);
                        end
                %s3 calculation
                        if i-1 <=0 && (j+w)-1 <=0
                        s3=I(i+h-1,2*w+j-1);
                        elseif i-1<=0
                            s3=I(i+h-1,2*w+j-1)-I(i+h-1,(j+w)-1);
                        elseif (j+w)-1 <=0
                            s3 = I(i+h-1,2*w+j-1)-I(i-1,2*w+j-1);
                        else
                        s3=I(i+h-1,2*w+j-1)-I(i-1,2*w+j-1)+I(i-1,(j+w)-1)-I(i+h-1,(j+w)-1);
                        end
                        
                         %s4 calculation
                        if i+h-1 <=0 && (j+w)-1 <=0
                        s4=I(i+2*h-1,2*w+j-1);
                        elseif i+h-1<=0
                            s4=I(i+2*h-1,2*w+j-1)-I(i+2*h-1,(j+w)-1);
                        elseif (j+w)-1 <=0
                            s4 = I(i+2*h-1,2*w+j-1)-I(i+h-1,2*w+j-1);
                        else
                        s4=I(i+2*h-1,2*w+j-1)-I(i+h-1,2*w+j-1)+I(i+h-1,(j+w)-1)-I(i+2*h-1,(j+w)-1);
                        end
            countLoop= countLoop +1;
                        f(featureRow,findex)=abs(s1-s2-s3+s4);
                          e(1,count)=f(1,findex);
                        count = count + 1;
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end


