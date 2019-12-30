function f = haarf(I,row,col)

% Sum of feature 1 of haar features
% dark side - white side
f = (5:100000);
findex=1;
countLoop=0;
for i=1:row
    for j=1:col
        h=1;
        while (h+i-1<=row)
            w=1;
            while((2*w+j-1)<=col)
                %calculate s1 sum of left side
                s1=0;
                numelems = 0;
                for ind=i:(i+h-1)
                    for ind2 = j:(j+w-1)
                        s1=s1+I(ind,ind2);
                        numelems= numelems +1;
                        countLoop= countLoop +1;
                    end
                end
              %calculate s2 sum of right rectangle
                s2 = 0;
                numelems=0;
                for ind=i:(i+h-1)
                    for ind2 = (w+j):(2*w+j-1);
                        s2=s2+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
               %calculate subtraction of rectangles values
                f(1,findex)=abs(s1-s2);
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end


% Sum of feature 2 of haar features
%white side - dark side - white side
findex = 1;
countLoop=0;
for i=1:row
    for j=1:col
        h=1;
        while (h+i-1<=row)
            w=1;
            while((3*w+j-1)<=col)
                %calculate s1 sum of left side
                s1=0;
                numelems = 0;
                for ind=i:(i+h-1)
                    for ind2 = j:(j+w-1)
                        s1=s1+I(ind,ind2);
                        numelems= numelems +1;
                        countLoop= countLoop +1;
                    end
                end
                %calculate s2 sum of middle rectangle
                s2 = 0;
                numelems=0;
                for ind=i:(i+h-1)
                    for ind2 = (w+j):(2*w+j-1);
                        s2=s2+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
                %calculate s3 sum of right side
                   s3 = 0;
                numelems=0;
                for ind=i:(i+h-1)
                    for ind2 = (2*w+j):(3*w+j-1);
                        s3=s3+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
               % sum of s1 s3 subtracted by s2
                f(2,findex)=abs(s1-s2+s3);
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end

% Sum of feature 3 of haar features
%top white - bottom dark 
findex = 1;
countLoop=0;
for i=1:row
    for j=1:col
        h=1;
        while (2*h+i-1<=row)
            w=1;
            while((w+j-1)<=col)
                %calculate s1 sum of left side
                s1=0;
                numelems = 0;
                for ind=i:(i+h-1)
                    for ind2 = j:(j+w-1)
                        s1=s1+I(ind,ind2);
                        numelems= numelems +1;
                        countLoop= countLoop +1;
                    end
                end
                %calculate s2 sum of middle rectangle
                s2 = 0;
                numelems=0;
                for ind=(h+i):(i+2*h-1)
                    for ind2 = j:(w+j-1);
                        s2=s2+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
               
               % sum of s1 s3 subtracted by s2
                f(3,findex)=abs(s1-s2);
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end


% Sum of feature 4 of haar features
%top white - middle dark - bottom white
findex = 1;
countLoop=0;
for i=1:row
    for j=1:col
        h=1;
        while (3*h+i-1<=row)
            w=1;
            while((w+j-1)<=col)
                %calculate s1 sum of top side
                s1=0;
                numelems = 0;
                for ind=i:(i+h-1)
                    for ind2 = j:(j+w-1)
                        s1=s1+I(ind,ind2);
                        numelems= numelems +1;
                        countLoop= countLoop +1;
                    end
                end
                %calculate s2 sum of middle rectangle
                s2 = 0;
                numelems=0;
                for ind=(h+i):(i+2*h-1)
                    for ind2 = (j):(w+j-1);
                        s2=s2+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
                  %calculate s3 sum of bottom rectangle
                s3 = 0;
                numelems=0;
                for ind=(2*h+i):(i+3*h-1)
                    for ind2 = (j):(w+j-1);
                        s3=s3+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
               % sum of s1 s3 subtracted by s2
                f(4,findex)=abs(s1-s2+s3);
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end


% Sum of feature 5 of haar features
%top white-top dark + bottom white - bottom dark
findex = 1;
countLoop=0;
for i=1:row
    for j=1:col
        h=1;
        while (2*h+i-1<=row)
            w=1;
            while((2*w+j-1)<=col)
                %calculate s1
                s1=0;
                numelems = 0;
                for ind=i:(i+h-1)
                    for ind2 = j:(j+w-1)
                        s1=s1+I(ind,ind2);
                        numelems= numelems +1;
                        countLoop= countLoop +1;
                    end
                end
                %calculate s2 
                s2 = 0;
                numelems=0;
                for ind=(h+i):(i+2*h-1)
                    for ind2 = (j):(w+j-1);
                        s2=s2+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
                  %calculate s3
                s3 = 0;
                numelems=0;
                for ind=(i):(i+h-1)
                    for ind2 = (j+w):(2*w+j-1);
                        s3=s3+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
                  %calculate s4
                s4 = 0;
                numelems=0;
                for ind=(i+h):(i+2*h-1)
                    for ind2 = (j+w):(2*w+j-1);
                        s4=s4+I(ind,ind2);
                        numelems=numelems+1;
                        countLoop= countLoop +1;
                    end
                end
               % sum of s1 s3 subtracted by s2
                f(5,findex)=abs(s1-s2-s3+s4);
                findex=findex+1;
                w=w+1;
            end
            h=h+1;
        end
    end
end


end