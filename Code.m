data = imread('parkinglot.jpg');
    diff_im = imsubtract(data(:,:,2), rgb2gray(data));
    %Use a median filter to filter out noise
    diff_im = medfilt2(diff_im, [3 3]);
    diff_im = im2bw(diff_im,0.18);
    
    diff_im = bwareaopen(diff_im,300);
    
    bw = bwlabel(diff_im, 8);
    
    stats = regionprops(bw, 'BoundingBox', 'Centroid');
    
    % Display the image
    imshow(data)
    
    hold on
 
    for object = 1:length(stats)
        bb = stats(object).BoundingBox;
        bc = stats(object).Centroid;
        rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
        plot(bc(1),bc(2), '-m+')
    end
    
a=1;
v=10;
q=2;
w=3;
x=1;
y=1;
z=3;
r4=0;
r5=1;
sg1=0;
sg2=0;
sg3=0;
sg4=0;
sg5=0;
s(1)=0;
s(2)=0;
s(3)=0;
s(4)=0;
s(5)=0;
while a==1
    ans=input('Press 1 for new entry and press 0 to exit.');
    if ans==1
        vname= input('Enter name of visitor: ', 's');
        pn = input('Enter visitor phone no.: ');
        car = input('Enter car plate number: ');
        person = input('Enter name of person to be visited: ', 's');
        flat = input('Enter flat details: ');
        slot = input('Enter parking slot required according to the layout shown:');
        block = input('Enter block number (1,2,3,4,5):');
        v=v+1;
    
        if block==1
            q=q+1;
        elseif block==2
            w=w+1;
        elseif block==3
            x=x+1;
        elseif block==4
            y=y+1;
        elseif block==5
            z=z+1;
        else
            disp('Wrong block entered.')
        end
    
    elseif ans==0
        d1= q/v;
        d2= w/v;
        d3= x/v;
        d4= y/v;
        d5= z/v;
        d=[d1 d2 d3 d4 d5]
       
        s=sort(sg,'descend')
        
        r4='0';r5='1';
        if (s(4)+s(5))>=s(1) 
        for i=1:3
        temp(i+1)=s(i);
        end
        temp(1)=(s(4)+s(5));
        for i=1:4
        s(i)=temp(i);
        end
        r2='0';r3='1';
        if (s(3)+s(4))>=s(1) 
        for i=1:2
        temp(i+1)=s(i);
        end
        temp(1)=(s(3)+s(4));
        for i=1:3
        s(i)=temp(i);
        end
        r1='1';r4='00';r5='01';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='01';r2='10';r3='11';r4='000';r5='001';
        else s(2)=(s(2)+s(3));
                r1='11';r2='00';r3='01';r4='100';r5='101';
        end
        
        elseif (s(3)+s(4))>=s(2) 
            temp(2)=s(2);s(2)=(s(3)+s(4));s(3)=temp(2);
        r1='1';r2='00';r3='01';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='01';r2='000';r3='001';r4='10';r5='11';
        else s(2)=(s(2)+s(3));
                r1='11';r2='100';r3='101';r4='00';r5='01';
        end
        else s(3)=(s(3)+s(4));
        r1='0';r2='10';r3='11';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='00';r2='010';r3='011';r4='10';r5='11';
        else s(2)=(s(2)+s(3));
                r1='10';r2='110';r3='111';r4='00';r5='01';
        end
        end
        elseif (s(4)+s(5))>=s(2) 
        for i=2:3
        temp(i+1)=s(i);
        end
        temp(2)=(s(4)+s(5));
        for i=3:4
        s(i)=temp(i);
        end
        r2='0';r3='1';
        if (s(3)+s(4))>=s(1)
        for i=1:2
        temp(i+1)=s(i);
        end
        temp(1)=(s(3)+s(4));
        for i=1:3
        s(i)=temp(i);
        end
        r1='0';r4='10';r5='11';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='00';r2='10';r3='11';r4='010';r5='011';
        else s(2)=(s(2)+s(3));
                r1='10';r2='00';r3='01';r4='110';r5='111';
        end
        
        elseif (s(3)+s(4))>=s(2) 
            temp(2)=s(2);s(2)=(s(3)+s(4));s(3)=temp(2);
        r1='1';r2='00';r3='01';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='01';r2='000';r3='001';r4='10';r5='11';
        else s(2)=(s(2)+s(3));
                r1='11';r2='100';r3='101';r4='00';r5='01';
        end
        else s(3)=(s(3)+s(4));
            r2='10';r3='11';r4='00';r5='01';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='1';r2='010';r3='011';r4='000';r5='001';
        else s(2)=(s(2)+s(3));
                r1='0';r2='110';r3='111';r4='100';r5='101';
        end
        end
        elseif (s(4)+s(5))>=s(3) 
            temp(3)=s(3);s(3)=(s(4)+s(5));s(4)=temp(3);
            r4='00';r5='01';r3='1';
        if (s(3)+s(4))>=s(1) 
        for i=1:2
        temp(i+1)=s(i);
        end
        temp(1)=(s(3)+s(4));
        for i=1:3
        s(i)=temp(i);
        end
        r1='0';r2='1';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='00';r2='01';r3='11';r4='100';r5='101';
        else s(2)=(s(2)+s(3));
                r1='10';r2='11';r3='01';r4='000';r5='001';
        end
        
        elseif (s(3)+s(4))>=s(2) 
            temp(2)=s(2);s(2)=(s(3)+s(4));s(3)=temp(2);
            r2='1';r3='01';r4='000';r5='001';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='1';r2='01';r3='001';r4='0000';r5='0001';
        else s(2)=(s(2)+s(3));
                r1='0';r2='11';r3='101';r4='1000';r5='1001';
        end
        else s(3)=(s(3)+s(4));
            r2='0';r3='11';r4='100';r5='101';
        if (s(2)+s(3))>=s(1)
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='1';r2='00';r3='011';r4='0100';r5='0101';
        else s(2)=(s(2)+s(3));
                r1='0';r2='10';r3='111';r4='1100';r5='1101';
        end
        end
        else s(4)=(s(4)+s(5));
        r3='0';r4='10';r5='11';
        if (s(3)+s(4))>=s(1)
        for i=1:2
        temp(i+1)=s(i);
        end
        temp(1)=(s(3)+s(4));
        for i=1:3
        s(i)=temp(i);
        end
        r1='0';r2='1';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='00';r2='01';r3='10';r4='110';r5='111';
        else s(2)=(s(2)+s(3));
                r1='10';r2='11';r3='00';r4='010';r5='011';
        end
        
        elseif (s(3)+s(4))>=s(2) 
            temp(2)=s(2);s(2)=(s(3)+s(4));s(3)=temp(2);
            r2='1';r3='00';r4='010';r5='011';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='1';r2='01';r3='000';r4='0010';r5='0011';
        else s(2)=(s(2)+s(3));
                r1='0';r2='11';r3='100';r4='1010';r5='1011';
        end
        else s(3)=(s(3)+s(4));
            r2='0';r3='10';r4='110';r5='111';
        if (s(2)+s(3))>=s(1) 
                temp(1)=s(1);s(1)=(s(2)+s(3));s(2)=temp(1);
                r1='1';r2='00';r3='010';r4='0110';r5='0111';
        else s(2)=(s(2)+s(3));
                r1='0';r2='10';r3='110';r4='1110';r5='1111';
        end
        end
        end

        disp('Program terminated.')
        disp('Total number of visitors:')
        disp(v)
        disp('Total number of visitors at block 1:')
        disp(q);
        disp('Total number of visitors at block 2:');
        disp(w);
        disp('Total number of visitors at block 3:');
        disp(x);
        disp('Total number of visitors at block 4:');
        disp(y);
        disp('Total number of visitors at block 5:');
        disp(z);
        disp('ENCODED CODE:');
        disp('Block 1:');
        disp(r1);
        disp('Block 2:');
        disp(r2);
        disp('Block 3:');
        disp(r3);
        disp('Block 4:');
        disp(r4);
        disp('Block 5:');
        disp(r5);
        break
    else 
        disp('Invalid input.')
    end       
end
