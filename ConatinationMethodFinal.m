
clear all;close all;clc;
%%
v = VideoReader('viewVideo.mp4');
%numberOfFrame=get(v,'numberOfFrames');
video = read(v);
[rows ,column ,dimention ,numberOfFrame] = size(video);

%% Search the pixels differents

Frame1 = read(v,1);
Frame2 = read(v,2);

ax(1) = subplot(2,1,1);imshow(Frame1);title('first frame');
ax(2) = subplot(2,1,2);;imshow(Frame2);title('second frame');
linkaxes(ax,'xy');

nomberOfOverlappingPixels=7;

%%

% first initiation
video = read(v,1);
PanoramicPicture=video;

Hop=column+1;
LeftStripIndex=column-7;  %concatenation of the last right 7 Pixels
RightStripIndex=column;

for ii=2:numberOfFrame
   
    video = read(v,ii);
    R=uint8(video(:,LeftStripIndex:RightStripIndex,1));
    G=uint8(video(:,LeftStripIndex:RightStripIndex,2));
    B=uint8(video(:,LeftStripIndex:RightStripIndex,3));
    
    PanoramicPicture(:,Hop:Hop+(RightStripIndex-LeftStripIndex),1)=R;
    PanoramicPicture(:,Hop:Hop+(RightStripIndex-LeftStripIndex),2)=G;
    PanoramicPicture(:,Hop:Hop+(RightStripIndex-LeftStripIndex),3)=B;
    
    Hop=Hop+nomberOfOverlappingPixels+1;
    
end


figure;imshow(PanoramicPicture);title('Panoramic picture');
