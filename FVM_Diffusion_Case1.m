clear all
close all
clc
l=0.02;     
Ta=100;     
Tb=200;     
k=0.5;      
S=1000000;   
prompt= ”Number of equally spaced grid points N=  ";
n=input(prompt)   
dx=l/n;     
x=(dx/2):dx:(l-(dx/2)); 
A=1;        
C=zeros(n);
for j=1:+1:n
    if j==1
        a=0;
        b=((k*A)/dx);
        c=((-2*k*A)/dx);
        d=a+b-c;
        C(j,j)=d;                           
        C(j,j+1)=((-1)*b);                  
        B(j)=(((S*A*dx)+((2*k*A*Ta)/dx)));  
    else if (j>=2)&&(j<=n-1)
        a=((k*A)/dx);
        b=((k*A)/dx);
        c=0;
        d=a+b-c;
        C(j,j-1)=((-1)*a);                  
        C(j,j)=d;                           
        C(j,j+1)=((-1)*b);                  
        B(j)=((S*A*dx));
    else
        d=((k*A)/dx);
        e=0;
        f=((-2*k*A)/dx);
        g=d+e-f;
        C(j,j)=g;                           
        C(j,j-1)=((-1)*d);                  
        B(j)=(((S*A*dx)+((2*k*A*Tb)/dx)));
    end
    end
end
D=B/C;            
for h=1:+1:n
    T(h)= ((((Tb-Ta)/l)+((S/(2*k))*(l-x(h))))*x(h))+Ta;  
end
for i=1:+1:n
    error(i)=((D(i)-T(i))/(T(i)))*100;
end
figure(1);
plot(x,D);
title('Temperature Distribution with respect to grid points');
xlabel('x');
ylabel('Temperature distribution');
hold on
plot(x,T);
hold off
figure(2);
plot(x,error);
