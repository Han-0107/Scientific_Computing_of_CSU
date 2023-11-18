# Scientific_Computing_of_CSU

中南大学-科学计算与程序应用课程代码（包括作业、上机实践、大作业）:rose:

## 实验结果

实验代码及运行截图请看各个目录下的PDF。

## MATLAB课程设计

### 为什么做这个主题？:thinking:

MATLAB全称是Matrix Laboratory，顾名思义，MATLAB擅长对矩阵、张量进行操作。而现如今，深度学习、强化学习等领域都需要通过矩阵的形式进行运算，因此MATLAB作为一门高级语言，越来越展现出蓬勃生机。同时，MATLAB集成了各个学科门类的工具箱，同时支持对硬件结构进行仿真。因此，用户可以借助MATLAB，从软件设计到硬件仿真进行全流程的工作，这也是为什么MATLAB逐渐“火爆”的重要原因之一。

在深度学习领域，同样需要用到大量的矩阵运算，本设计中的手写数字图片需要通过一个三维矩阵来描述：即一张图片的长、宽和每个像素点的明度信息。借助MATLAB对矩阵运算的强大支持，我选择了这一主题作为课程设计，并得到了满意的结果。

### MNIST数据集介绍

[MNIST数据集](http://yann.lecun.com/exdb/mnist/index.html)来自美国国家标准与技术研究所，这个数据集由250个不同人手写的数字构成, 其中50%来自高中生, 50%来自美国人口普查局(the Census Bureau) 的工作人员，每个图像都包含一个手写的数字，该数字的标签已被标记。整个数据集由三部分构成，训练集有55000条数据，验证集有5000条数据，测试集有10000条数据。虽然这个数据集听起来包含很多数据，但实际上在机器学习里，这个只是一个入门级的案例，它的数据集谈不上非常大，但是通过这样量级的数据集，可以帮助我们更快地理解一个神经网络。因此，它也常常被用来验证神经网络的有效性。

在本次课程设计中，我将用MATLAB编写一个用于识别手写数字的多层人工神经网络，通过MNIST手写数据集进行训练，并利用配套的测试集对该神经网络进行测试。测试结果显示，该神经网络对手写数字的识别准确度稳定在90%以上，最高可以达到92%左右。

### 介绍人工神经网络

为了让老师和同学们更好地了解我的设计，我将对人工神经网络的概念进行简单介绍。本质上，人工神经网络就是一组数学模型的集合：

1. 激活函数：实际上，神经网络就是对输入数据进行一系列的非线性变换，通过调节非线性变换的方式来得到不同的处理结果，而激活函数就是这种非线性变换的基本形式。那么为什么激活函数一定要是非线性的呢？我们知道，多层的线性变换最终可以化简为一次线性变换，因此，多层的线性变换是没有意义的，最终仍然是对数据进行一次线性变换。而线性变换很难得到人工神经网络预期的结果。通过选择合适的激活函数，可以达到更准确的计算结果、更快的运算速度。
2. 损失函数：在人工神经网络的训练过程中，神经网络将不断地尝试不同的参数来靠近真实结果。而神经网络定义自己的输出值与真实值之间的差距的函数就是损失函数。而计算这种差距的方式有很多，所以也就有了不同的损失函数。根据数据的分布情况、任务的类型，我们需要选择恰当的损失函数来优化模型。
3. 学习率：在神经网络认识到预测值与真实值之间的差距后，就需要神经网络通过梯度下降法寻找损失函数的最小值（也就是最佳的参数组合）。但是，由于模型的训练时间有限，不允许模型无休止的进行尝试。因此，我们定义了学习率作为模型寻找损失函数最小值的步长。通过这样的设计，用户可以根据实际情况来调节模型的训练情况，进而在模型精度和模型训练时间内寻找平衡。

这就是一个人工神经网络的主要内容，虽然原理很简单，但是在实际的实现过程中会有着种种棘手的问题，比如调参、预防过拟合等。经过无数次的参数调节，我最终找到了一组稳定的参数来训练这个神经网络，恰当的参数可以防止模型的过拟合现象，同时不会让训练时间过长。同时，我使用了Leaky ReLu函数作为模型的激活函数，可以有效地加速模型的训练。同时可以有效地防止Dead ReLu问题（模型在特定的区间内失效），提高了神经网络的稳定性；我选择了交叉熵损失函数，这是一种非常适用于多分类问题的函数。

### MATLAB代码运行结果

| 训练次数（epoch） | 识别精度（accuracy） |
| ----------------- | -------------------- |
| 100               | 80.47%               |
| 500               | 89.10%               |
| 1000              | 90.94%               |
| 2000              | 91.25%               |
| 4000              | 91.84%               |
| 10000             | 91.33%（过拟合）     |
| 20000             | 91.28%（过拟合）     |
| 40000             | 91.35%（过拟合）     |

从代码运行结果可以看出，在模型训练次数较少时，神经网络会因没有充分学习而导致识别精度较低。随着模型训练次数的增加，识别精度也将上升。但值得注意的是，当训练次数过大（超过数据集中的数据个数）时，会导致过拟合现象，即神经网络会由学习转为记忆，不利于模型性能的提升。经试验，模型在5000次左右的训练次数下能达到稳定的最高识别精度，约为92%。

### MATLAB代码介绍

介绍过了人工神经网络的基本概念，相信大家已经有点迷迷糊糊了。那么接下来让我结合MATLAB代码进行介绍，说明我在本次课程设计的成果吧！

简单来说，我通过MATLAB编写了能实现手写数字识别的人工神经网络。该神经网络的输入就是一张手写的数字图片，MNIST数据集把这种图片通过三维矩阵的形式进行表示。我的代码经过MNIST数据集的大量训练，可以以96%左右的准确率判断手写数字的数值。并且经过MNIST数据集的训练后，代码也支持我们向模型输入28*28的手写数字图片，并对我们的手写数字进行识别。

具体来说，代码主要由四部分组成：

1. 根据NYU（纽约大学）提供的MNIST数据集说明来确定函数指针应该指向的位置，从而在MNIST数据集中的正确位置获取数据集相关的信息和具体的手写数据图片矩阵。
2. 代码将把读取到的数据输入给人工神经网络进行学习，由于我选择了Leaky ReLu作为激活函数，整个学习的过程不会消耗太长的时间。在神经网络的学习过程中，代码会弹出窗口并给出20张手写数据集的图片样例和正确的判断结果。
3. 代码将随机选取20张图片并给出其判断结果，有助于用户直观地了解到神经网络的学习成果。
4. 代码对神经网络的准确性和训练程度进行评价，从而定量地表示神经网络对手写数字的识别精度和模型的训练成果。

现如今，世界上的顶尖团队已经可以设计出识别精度在99.7%以上的高级神经网络。尽管如此，本代码最高能达到的92%的识别精度放在20世纪末也是全球顶尖的存在了:smile:。为了视频中的展示需要，这里我选取了较为保守的参数，确保训练时间不会太长，同时保持较高的识别精度。

#### Part 1

首先，我们读入MNIST数据集，并根据官方给出的说明设定文件指针，分别读取数据集中的信息和真实的数据：

```matlab
clear;

% 读取MNIST数据集中的基本信息
fImg = fopen('train-images.idx3-ubyte'); 	% 打开MNIST训练集文件
offset = fseek(fImg,0,'bof');
magicNumber = swapbytes(uint32(fread(fImg,1,'uint32')));
dataNumber = swapbytes(uint32(fread(fImg,1,'uint32')));
rowN = swapbytes(uint32(fread(fImg,1,'uint32')));
colN = swapbytes(uint32(fread(fImg,1,'uint32')));

% 读取MNIST训练集
dataImg = double(swapbytes(uint8(fread(fImg,[rowN*colN,dataNumber],'uint8'))));
fclose(fImg); 	% 关闭MNIST训练集文件
fLab = fopen('train-labels.idx1-ubyte'); % 打开MNIST训练集标签文件
offset = fseek(fLab,8,'bof');
dataLab = swapbytes(uint8(fread(fLab,[dataNumber],'uint8')));
dataLabMat = zeros(10,dataNumber);
fclose(fLab);
for i=1:dataNumber
    dataLabMat(uint32(dataLab(i))+i*10-9) = 1; 	% 记录图片对应的标签
end
```

在这里，变量dataLab是一个数组，具有10个元素，我使用它来表示当前图片是某个数字的概率是多少。当然，对于训练过程，它是包含9个0和1个1，它将告诉神经网络当前的数字是多少。为了方便调用，我将每个数字的dataLab组合为了矩阵dataLabMat，其中的每一列即表示一个数字识别结果的概率。

#### Part 2

为了验证我们在第一部分的代码设计的正确性，在第二部分，我们将通过代码，根据MNIST数据集提供的图片规格以及图片中每个像素点的深度来显示一张图片。

这段代码的意义在于，能直观地让用户了解MNIST数据集中的一串串数字是如何表示图像并最终显示在屏幕上的。

![test](https://github.com/Han-0107/Graphs/blob/master/Graph_for_test.png)

```matlab
% 将MNIST数据集中的数字转化为图像
set(gcf,'unit','centimeters','position',[3 5 30 26]); 	% 设置图像的展示的位置

for i=1:20
    imagesc(reshape(dataImg(:,i),[rowN,colN]).')
    title(['This image is ',num2str(dataLab(i)),'    (',num2str(i),'/20)'],'FontSize',14)
    pause(1); 	% 暂停一秒，让用户有时间观察手写数字图片
end
```

#### Part 3

第三部分即真正地使用读取到的MNIST数据进行模型的训练了。这里我将淡化对神经网络专业知识的介绍，着重说明我们的神经网络是如何利用这些数据进行学习的：

```matlab
% 人工神经网络模型的随机初始化
layerN = [rowN*colN 64 16 10];

w1 = double((rand(layerN(1),layerN(2))-0.5)/512);
b1 = double((rand(layerN(2),1)-0.5)/512);

w2 = double((rand(layerN(2),layerN(3))-0.5)/4);
b2 = double((rand(layerN(3),1)-0.5)/4);

w3 = double((rand(layerN(3),layerN(4))-0.5)/16);
b3 = double((rand(layerN(4),1)-0.5)/16);
```

在神经网络的训练开始前，我需要确定各个网络层内部的参数，从而开始训练过程。在这里，我将一个28*28的矩阵逐步缩小，最终得到一个仅有10个元素的数组，这个数组表示的是当前图片可能是0-9数字的概率。

下面介绍具体的训练过程，实际上就是通过不同的计算层对输入数据进行不断地计算，并以反向传播的方式更新各个层的参数。最后，在每次计算结束后记录当前的损失（lost）和精度（accuracy），这样来对神经网络进行评价。同时，由于在不同参数下的训练时间差别较大，因此我设计了MATLAB代码的运行进度条，让用户清晰地知道代码运行进度。

```matlab
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
end
toc;
```

#### Part 4

我设定了1000次训练，在训练结束后，我将引入MNIST的测试集对模型进行测试。相比于训练集，测试集中的测试结果可能会略有差异，这是因为模型可能会学习训练集内部的一些规律从而导致轻微的过拟合。但在测试集中，模型将会面对全新的数据，因此这里将测得更加准确的结果：

```matlab
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

```

和前面的过程类似，这里也是读数据+测试+输出结果，但由于这部分代码不需要进行参数的反向传播的更新，因此代码量减少了一些。最终，我们计算模型在测试集中的真实表现，并将其输出出来。

### 展望

同时，该神经网络也可以用于类似的应用场景或其他多分类问题中，神经网络的基本结构和输入输出的相关设施已经搭建好，只需改变输入输出的格式，根据特定的数据选择特定的激活函数、损失函数即可实现在其他场景下的应用。

### 结语

结合老师的课程内容，我独立整理了[科学计算与程序应用课程资料](https://github.com/Han-0107/Scientific_Computing_of_CSU/tree/master)，希望能有助于老师未来的备课和同学们的学习。

相比于Python，MATLAB的许多功能集成度更高、运算速度更快，同时集成了诸多专业领域的工具箱，我相信MATLAB将会发展的越来越好。事实上，在本学期之前我对MATLAB几乎没有什么了解，但多亏老师的耐心指导和讲授，让我快速掌握了这门科学性极强的语言。在学习MATLAB后，我发现相较于另一门高级语言Python，两者互有长短，与应用场景有很大关系。

最后，感谢潘老师一个学期以来的悉心教导，您耐心和认真的讲授方式让我获益匪浅，再次感谢！
