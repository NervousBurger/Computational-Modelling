% Xinyu Ma
% 28652703
function [x,y,z,t] = RK2_RPS(s,r,x0,y0,z0,h,max_T)

t=[0:h:max_T]'; 
N=length(t)-1; 

fx=@(vx,vy,vz) vx*(r*vy+s*vz-(r+s)*(vx*(vy+vz)+vy*vz));
fy=@(vx,vy,vz) vy*(s*vx+r*vz-(r+s)*(vx*(vy+vz)+vy*vz));
fz=@(vx,vy,vz) vz*(r*vx+s*vy-(r+s)*(vx*(vy+vz)+vy*vz));

x=[x0;zeros(N,1)];
y=[y0;zeros(N,1)];
z=[z0;zeros(N,1)];

for i=1:N
    X1=fx(x(i),y(i),z(i));
    Y1=fy(x(i),y(i),z(i));
    Z1=fz(x(i),y(i),z(i));
    X2=fx(x(i)+X1*h,y(i)+Y1*h,z(i)+Z1*h);
    Y2=fy(x(i)+X1*h,y(i)+Y1*h,z(i)+Z1*h);
    Z2=fz(x(i)+X1*h,y(i)+Y1*h,z(i)+Z1*h);
    x(i+1)=x(i)+h*(X1+X2)/2;
    y(i+1)=y(i)+h*(Y1+Y2)/2;
    z(i+1)=z(i)+h*(Z1+Z2)/2;
end

