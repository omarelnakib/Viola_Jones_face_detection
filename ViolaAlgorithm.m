
clear all
close all
number_of_features = 162336;
trainingnum = 5;
pos_num = 5;
neg_num = 5;
f=zeros(trainingnum*2,number_of_features);
thresholds = zeros(1,number_of_features);
weight = zeros(1,trainingnum*2);
betas = zeros(1,number_of_features);
% result of each image if face or not , 1 for faces & 0 for nonfaces
fy=zeros(1);
%read positive images
for i=1 : trainingnum
 I = imread(strcat(num2str(i),'.png'));
 IS = imresize(I, [24 24]); %resize to 24x24
 IS = double(IS);
 II = IntegralImage(IS,24,24); % convert image to integral image
 tmp = Ihaarf(II,24,24,number_of_features);
  f(i,:)= tmp;
  fy(i) = 1;
   %initialize weights
  weight(i) = 1/2*pos_num;
end
%read negative images
for i=1 : trainingnum
  IN = imread(strcat(num2str(i),'N.jpg'));
 ISN = imresize(IN,[24 24]);
  ISN = double(ISN);
   IIN = IntegralImage(ISN,24,24);
   fN = Ihaarf(IIN,24,24,number_of_features);
   f(i+trainingnum,:)= fN;
  fy(i+trainingnum) = 0;
  
  %initialize weights
  weight(i+trainingnum) = 1/2*neg_num;
end

%normalize weights
s= sum(weight);
for i=1: trainingnum*2
       weight(i) = weight(i)/s; 
    end
sameFeature = zeros(1,trainingnum*2);
%choose threshold
for i=1 : number_of_features
    minError = trainingnum*2;
    for j=1 : trainingnum*2
        %get each same feature from all images and sort them to choose
        %threshold
        sameFeature(j) = f(j,i);
    end
%     sort features 
   % sameFeature=sort(sameFeature);

accuracy = zeros(1,trainingnum*2);
tempAccuracy = zeros(1,trainingnum*2);
    %choose threshold , start with minimum and calculate error
    for k = 1: trainingnum*2
        threshold = sameFeature(k);
        hy= zeros(1,trainingnum*2);
        %calculate the hypothesis
        for image = 1 : trainingnum*2
            %if feature value less than the threshold then it's a face,
            %else not face
            if sameFeature(image)<= threshold 
                hy(image)= 1;
               
            else
                hy(image)= 0;
            end
        end
        %calculate the error for the hypothesis
        tmpError = 0;
        for image = 1: trainingnum*2
            if hy(image) ~= fy(image)
%                 tmpError = tmpError +1;
                tempAccuracy(image)=1; %one for incorrect
            else
                tempAccuracy(image) = 0; %zero for correct
            end
        tmpError = tmpError + weight(image)*abs(hy(image)-fy(image));
            
        end
       if tmpError <= minError
           thresholds(i) = threshold;
           minError = tmpError;
           accuracy = tempAccuracy;
             beta =0.5* log( (1-minError) /minError);
            betas(i)=beta;
       end
       
    end
    %modify weight of images
%     minError= minError/trainingnum*2;
        beta =0.5* log( (1-minError) /minError);
   
    for image = 1 : trainingnum*2
%         00000000000000000000000000000000000000000001
        if weight(image)>0.00000000000000000000000000000000000000000000000000000001
            betas(image) = beta;
        if accuracy(image)== 0
%            weight(image) = weight(image)*(beta^(1-accuracy(image)));
            weight(image) = weight(image).*exp(-beta);
        else
            weight(image) = weight(image).*exp(beta);
        end
        end
    end
end

%testing phase

I = imread('10N.jpg');
IS = imresize(I, [24 24]); %resize to 24x24
IS = double(IS); %convert datatype from uint8 to double to accept numbers more than 255
II = IntegralImage(IS,24,24); % convert image to integral image
fo = Ihaarf(II,24,24,number_of_features); % extract features from integral image
accOut = zeros(1,number_of_features); 
iscount = 0; %to count how many features guessed right
%classify testImage
for i = 1: number_of_features
    if fo(i)<=thresholds(i) % compare each feature of the test image to the thresholds we chose during training
        accOut(i) = 1; %for correct
        iscount= iscount +1;
    else
        accOut(i) = 0; %for incorrect
    end

end
    
alphas = zeros(1,number_of_features);
total = 0;
for i =1 : number_of_features
    %calculate alpha
    alphas(i) = 1/betas(i);
    total = total +alphas(i)*accOut(i) ;
end

isImage = 0;
if total >= 0.5*sum(alphas)
    isImage = 1;
end