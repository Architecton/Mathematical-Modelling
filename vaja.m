L=@(x) (x(1)^2+x(2)^2)^2-2*(x(1)^2-x(2)^2);%defining function of the lemniscate
gradL=@(x) [4*x(1)*(x(1)^2+x(2)^2)-4*x(1),4*x(2)*(x(1)^2+x(2)^2)+4*x(2)];%gradient of L

K=krivulja(L,gradL,[0.01;0.01],0.02,400);%computing 400 points on the lemniscate
figure(1)
plot(K(1,:),K(2,:),'.;lemnsicate;','markersize',1)
axis equal

C = @(x) (x(1)^2+x(2)^2)^2+4*x(1)*(x(1)^2+x(2)^2)-4*x(2)^2;%defining function of 
%the cardioid
gradC = @(x) [4*(x(1)^2+x(2)^2)*x(1)+12*x(1)^2+4*x(2)^2,4*(x(1)^2+x(2)^2)*x(2)+8*x(1)*x(2)-8*x(2)];%gradient of C

K=krivulja(C,gradC,[0.01;0.01],0.02,800);%computing 800 points on the cardioid
figure(2)
plot(K(1,:),K(2,:),'.;cardioid;','markersize',1)
axis equal

