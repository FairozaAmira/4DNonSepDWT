function [Y A B C D E F G H I J K L M N O S] = Dwt97_Nsp4D(Y,Sw,Fs,Fc,T)
%
%DWT 9/7 4D Non-separable 
%   
q=2^Fs;
[N1 N2 N3 N4]=size(Y); M1=N1/2; M2=N2/2; M3=N3/2; M4=N4/2;

g=DwtCoef(1);% 0.5/3, 1.9/7
h=floor(g.*2^Fc)./2^Fc;

%========== analysis
if(Sw==+1)

f(1:2)=h(1:2); [Y A B C D E F G H I J K L M N O S]=Dwt97_Nsp4D_Prd(Y,Sw,Fs,f,T);
f(1:2)=h(3:4); [Y A B C D E F G H I J K L M N O S]=Dwt97_Nsp4D_Prd(Y,Sw,Fs,f,T);

%---------------------------
A=R(T,q,A*h(6)*h(6)*h(6)*h(6));
B=R(T,q,B*h(6)*h(6));
C=R(T,q,C*h(6)*h(6));
D=R(T,q,D);
E=R(T,q,E*h(6)*h(6));
F=R(T,q,F);
G=R(T,q,G);
H=R(T,q,H*h(5)*h(5));
I=R(T,q,I*h(6)*h(6));
J=R(T,q,J);
K=R(T,q,K);
L=R(T,q,L*h(5)*h(5));
M=R(T,q,M);
N=R(T,q,N*h(5)*h(5));
O=R(T,q,O*h(5)*h(5));
S=R(T,q,S*h(5)*h(5)*h(5)*h(5));

% ===================== RECONSTRUCTION
Z(   1:M1,    1:M2,    1:M3,    1:M4) = A;
Z(   1:M1,    1:M2,    1:M3, 1+M4:N4) = B;
Z(   1:M1,    1:M2, 1+M3:N3,    1:M4) = C;
Z(   1:M1,    1:M2, 1+M3:N3, 1+M4:N4) = D;
Z(   1:M1, 1+M2:N2,    1:M3,    1:M4) = E;
Z(   1:M1, 1+M2:N2,    1:M3, 1+M4:N4) = F;
Z(   1:M1, 1+M2:N2, 1+M3:N3,    1:M4) = G;
Z(   1:M1, 1+M2:N2, 1+M3:N3, 1+M4:N4) = H;
Z(1+M1:N1,    1:M2,    1:M3,    1:M4) = I;
Z(1+M1:N1,    1:M2,    1:M3, 1+M4:N4) = J;
Z(1+M1:N1,    1:M2, 1+M3:N3,    1:M4) = K;
Z(1+M1:N1,    1:M2, 1+M3:N3, 1+M4:N4) = L;
Z(1+M1:N1, 1+M2:N2,    1:M3,    1:M4) = M;
Z(1+M1:N1, 1+M2:N2,    1:M3, 1+M4:N4) = N;
Z(1+M1:N1, 1+M2:N2, 1+M3:N3,    1:M4) = O;
Z(1+M1:N1, 1+M2:N2, 1+M3:N3, 1+M4:N4) = S;

Y = Z;

end
%========== synthesis
if(Sw==-1)   

A=Y(   1:M1,    1:M2,    1:M3,    1:M4);
B=Y(   1:M1,    1:M2,    1:M3, 1+M4:N4);
C=Y(   1:M1,    1:M2, 1+M3:N3,    1:M4);
D=Y(   1:M1,    1:M2, 1+M3:N3, 1+M4:N4);
E=Y(   1:M1, 1+M2:N2,    1:M3,    1:M4);
F=Y(   1:M1, 1+M2:N2,    1:M3, 1+M4:N4);
G=Y(   1:M1, 1+M2:N2, 1+M3:N3,    1:M4);
H=Y(   1:M1, 1+M2:N2, 1+M3:N3, 1+M4:N4);
I=Y(1+M1:N1,    1:M2,    1:M3,    1:M4);
J=Y(1+M1:N1,    1:M2,    1:M3, 1+M4:N4);
K=Y(1+M1:N1,    1:M2, 1+M3:N3,    1:M4);
L=Y(1+M1:N1,    1:M2, 1+M3:N3, 1+M4:N4);
M=Y(1+M1:N1, 1+M2:N2,    1:M3,    1:M4);
N=Y(1+M1:N1, 1+M2:N2,    1:M3, 1+M4:N4);
O=Y(1+M1:N1, 1+M2:N2, 1+M3:N3,    1:M4);
S=Y(1+M1:N1, 1+M2:N2, 1+M3:N3, 1+M4:N4);
    
A=R(T,q,A*h(6)*h(6)*h(6)*h(6));
B=R(T,q,B*h(6)*h(6));
C=R(T,q,C*h(6)*h(6));
D=R(T,q,D);
E=R(T,q,E*h(6)*h(6));
F=R(T,q,F);
G=R(T,q,G);
H=R(T,q,H*h(5)*h(5));
I=R(T,q,I*h(6)*h(6));
J=R(T,q,J);
K=R(T,q,K);
L=R(T,q,L*h(5)*h(5));
M=R(T,q,M);
N=R(T,q,N*h(5)*h(5));
O=R(T,q,O*h(5)*h(5));
S=R(T,q,S*h(5)*h(5)*h(5)*h(5));

Y(   1:M1,    1:M2,    1:M3,    1:M4) = A;
Y(   1:M1,    1:M2,    1:M3, 1+M4:N4) = B;
Y(   1:M1,    1:M2, 1+M3:N3,    1:M4) = C;
Y(   1:M1,    1:M2, 1+M3:N3, 1+M4:N4) = D;
Y(   1:M1, 1+M2:N2,    1:M3,    1:M4) = E;
Y(   1:M1, 1+M2:N2,    1:M3, 1+M4:N4) = F;
Y(   1:M1, 1+M2:N2, 1+M3:N3,    1:M4) = G;
Y(   1:M1, 1+M2:N2, 1+M3:N3, 1+M4:N4) = H;
Y(1+M1:N1,    1:M2,    1:M3,    1:M4) = I;
Y(1+M1:N1,    1:M2,    1:M3, 1+M4:N4) = J;
Y(1+M1:N1,    1:M2, 1+M3:N3,    1:M4) = K;
Y(1+M1:N1,    1:M2, 1+M3:N3, 1+M4:N4) = L;
Y(1+M1:N1, 1+M2:N2,    1:M3,    1:M4) = M;
Y(1+M1:N1, 1+M2:N2,    1:M3, 1+M4:N4) = N;
Y(1+M1:N1, 1+M2:N2, 1+M3:N3,    1:M4) = O;
Y(1+M1:N1, 1+M2:N2, 1+M3:N3, 1+M4:N4) = S;

f(1:2)=h(1:2); [Y A B C D E F G H I J K L M N O S]=Dwt97_Nsp4D_Prd(Y,Sw,Fs,f,T);
f(1:2)=h(3:4); [Y A B C D E F G H I J K L M N O S]=Dwt97_Nsp4D_Prd(Y,Sw,Fs,f,T);

end

