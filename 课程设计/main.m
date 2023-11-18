clear;
% data read
fImg = fopen('train-images.idx3-ubyte');
offset = fseek(fImg,0,'bof');
magicNumber = swapbytes(uint32(fread(fImg,1,'uint32')));
dataNumber = swapbytes(uint32(fread(fImg,1,'uint32')));
rowN = swapbytes(uint32(fread(fImg,1,'uint32')));
colN = swapbytes(uint32(fread(fImg,1,'uint32')));
%%
% get all train data
dataImg = double(swapbytes(uint8(fread(fImg,[rowN*colN,dataNumber],'uint8'))));
fclose(fImg);
fLab = fopen('train-labels.idx1-ubyte');
offset = fseek(fLab,8,'bof');
dataLab = swapbytes(uint8(fread(fLab,[dataNumber],'uint8')));
dataLabMat = zeros(10,dataNumber);
fclose(fLab);
for i=1:dataNumber
    dataLabMat(uint32(dataLab(i))+i*10-9) = 1;
end
%%
% show MNIST handwriting image
set(gcf,'unit','centimeters','position',[3 5 30 26]);

for i=1:20
    imagesc(reshape(dataImg(:,i),[rowN,colN]).')
    title(['This image is ',num2str(dataLab(i)),'    (',num2str(i),'/20)'],'FontSize',14)
    pause(1);
end
%%
% NeuralNets modeling 1 -random initialize
% layerN is the modle definition, which tells you homany units per layer
layerN = [rowN*colN 64 16 10];

w1 = double((rand(layerN(1),layerN(2))-0.5)/512);
b1 = double((rand(layerN(2),1)-0.5)/512);

w2 = double((rand(layerN(2),layerN(3))-0.5)/4);
b2 = double((rand(layerN(3),1)-0.5)/4);

w3 = double((rand(layerN(3),layerN(4))-0.5)/16);
b3 = double((rand(layerN(4),1)-0.5)/16);

%%
% learning loop
lRate = 0.0005; % acts very bad when it is lager than 0.0004
epoch = 4000; % too lagert may over-trained or have NaN/Inf in model, less than 4k is safe
epochSize = 500; % this can smooth the training process but SLOW it down
los = [];
accuracy = [];

title('Training start!')
pause(0);
h = waitbar(0, '人工神经网络训练中……');
tic;
for i=1:epoch
    % data select
    randomSelect = randi(dataNumber,1,epochSize);
    epochImg = dataImg(:,randomSelect);
    epochLab = dataLabMat(:,randomSelect);

    % model calculate

    z1 = double(w1.'*epochImg + b1);
    a1 = double(max(z1,0.01*z1));% Leaky ReLU：加速模型的训练

    z2 = double(w2.'*z1 + b2);
    a2 = double(max(z2,0.01*z2));

    z3 = double(w3.'*z2 + b3);
    a30 = double(min(exp(z3),10e300));
    a3 = double(a30./sum(a30));

    % grident calculate

    dz3 = double(a3-epochLab); % 交叉熵损失函数
    dw3 = double(a2*(dz3.')/epochSize);
    db3 = double(sum(dz3.').'/epochSize);

    da2 = double(w3*dz3);
    dg2 = double(z2);

    dg2(find(z2>=0)) = double(1);
    dg2(find(z2<2)) = double(0.01);

    dz2 = double(da2.*dg2);

    dw2 = double(a1*(dz2.')/epochSize);
    db2 = double(sum( dz2.' ).'/epochSize);

    da1 = double(w2*dz2);
    dg1 = double(z1);

    dg1(find(z1>= 0)) = double(1);
    dg1(find(z1<0)) = double(0.01);

    dz1 = double(da1.*dg1);

    dw1 = double(epochImg*(dz1.')/epochSize);
    db1 = double(sum( dz1.').'/epochSize);

    % gradent decent
    w1 = w1-dw1*lRate;
    b1 = b1-db1*lRate;
    w2 = w2-dw2*lRate;
    b2 = b2-db2*lRate;
    w3 = w3-dw3*lRate;
    b3 = b3-db3*lRate;

    % los & accuracy calculate
    los(i) = mean(sum(-log(a3).*epochLab-log(1-a3).*(1-epochLab)));
    [m,p] = max(a3);
    modelAns = zeros(10,epochSize);
    for j=1:epochSize
       modelAns(p(j)+j*10-10) = 1;
    end
    accuracy(i) = mean(sum(modelAns.*epochLab));

    % gradualy slow down mode
    lRate = lRate*(1-0.0005);

    waitbar(i/epoch, h);
end
toc;
delete(h);
%%
% Show the result of trainning
for i=20:40
    % imshow(show)
    imagesc(reshape(dataImg(:,i),[rowN,colN]).')
    title(['Test Result: This image is ',num2str(dataLab(i)),'    (',num2str(i-20),'/20)'],'FontSize',14,'Color','r')
    pause(1);
end

subplot(2,1,1)
plot(1:epoch,los)
title('Los per epoch')
subplot(2,1,2)
plot(1:epoch,accuracy)
title('Accuracy per epoch')
%%
% test set
% data read
fImg = fopen('t10k-images.idx3-ubyte');
offset = fseek(fImg,0,'bof');
magicNumber = swapbytes(uint32(fread(fImg,1,'uint32')));
testNumber = swapbytes(uint32(fread(fImg,1,'uint32')));
rowN = swapbytes(uint32(fread(fImg,1,'uint32')));
colN = swapbytes(uint32(fread(fImg,1,'uint32')));

testImg = double(swapbytes(uint8(fread(fImg,[rowN*colN,testNumber],'uint8'))));
fclose(fImg);
fLab = fopen('t10k-labels.idx1-ubyte');
offset = fseek(fLab,8,'bof');
testLab = swapbytes(uint8(fread(fLab,[testNumber],'uint8')));
testLabMat = zeros(10,testNumber);
fclose(fLab);
for i=1:testNumber
    testLabMat(uint32(testLab(i))+i*10-9) = 1;
end

%%
% testing
z1 = double(w1.'*testImg + b1);
a1 = double(max(z1,0.01*z1));

z2 = double(w2.'*z1 + b2);
a2 = double(max(z2,0.01*z2));

z3 = double(w3.'*z2 + b3);
a30 = double(min(exp(z3),10e300));
a3 = double(a30./sum(a30));

%%
% accuracy
[m,p] = max(a3);
modelAns = zeros(10,testNumber);
for j=1:testNumber
   modelAns(p(j)+j*10-10) = 1;
end
testAccu = mean(sum(modelAns.*testLabMat));
disp(['该人工神经网络对MNIST手写数字的识别精度为 ' num2str(testAccu)]);
