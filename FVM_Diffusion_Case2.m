close all
clear all
clc
l=1;        
Ta=0;     
Tb=100;   
Ti=20;    
k=1;       
ns=25;
nps=5;
prompt="Number of equally spaced grid points N=  ";
n=input(prompt);   
dx=l/n;     
x=(dx/2):dx:(l-(dx/2)); 
A=1;      
C=zeros(n);
for j=1:+1:n
    if j==1
        a=0;
        b=(1/dx);
        c=(((-1)*ns*dx)-(2/dx));
        d=a+b-c;
        C(j,j)=d;                          
        C(j,j+1)=((-1)*b);                 
        B(j)=((ns*dx*Ti)+((2*Tb)/dx));  
    else if (j>=2)&&(j<=n-1)
        a=(1/dx);
        b=(1/dx);
        c=((-1)*ns*dx);
        d=a+b-c;
        C(j,j-1)=((-1)*a);                  
        C(j,j)=d;                          
        C(j,j+1)=((-1)*b);                 
        B(j)=((ns*Ti*dx));
    else
        a=(1/dx);
        b=0;
        c=((-1)*ns*dx);
        d=a+b-c;
        C(j,j)=d;                          
        C(j,j-1)=((-1)*d);                 
        B(j)=(ns*dx*Ti);
    end
    end
end
D=B/C;             
for e=1:+1:n
    T(e)= ((((cosh(nps*(l-x(e))))*(Tb-Ti))/(cosh(nps*l)))+Ti);  
end
for i=1:+1:n
    error(i)=((D(i)-T(i))/(T(i)))*100;
end
figure(1);
plot(x,D);
title('Steady State Temperature Distribution with respect to grid points');
xlabel('x');
ylabel('Steady State Temperature distribution');
hold on
plot(x,T);
hold off
figure(2);
plot(x,abs(error));
