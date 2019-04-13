clear all; close all;

%% Data
% 
% X = round(rand(128, 128, 32, 16) * 20) + 50;
% load('4D.mat');
% X=X(1:56,1:64,1:32,1:16);
X=WT4D_ARmodel(256,256,32,16,0.9,1);
% X=im2double(X);
[Row, Col, Len, W]=size(X);
bpp_org = ceil(log2( max(abs( X(:) )) ));
%% Intialization
Fs=0;
Fc=64;
% Sw=+1;
%% Separable 4D DWT 5/3

% [Y A B C D E F G H I J K L M N O S] = Dwt53_Sep4D( X, +1, Fs, Fc, 0 ); %no rounding
[Y0 A0 B0 C0 D0 E0 F0 G0 H0 I0 J0 K0 L0 M0 N0 O0 S0] = Dwt53_Sep4D( X, +1, Fs, Fc, 1 ); %with rounding
% [Y1 A1 B1 C1 D1 E1 F1 G1 H1 I1 J1 K1 L1 M1 N1 O1 S1] = Dwt53_Sep4D( Y, -1, Fs, Fc, 1 );
% psnr_pixelSep = PSNR(Y1,X);
% % Error_Sep = sum(abs(Y1(:) - X(:)));
% % 
% Y1= A0(:,:,round(end/2),round(end/2));
% Y2= B0(:,:,round(end/2),round(end/2));
% Y3= C0(:,:,round(end/2),round(end/2));
% Y4= D0(:,:,round(end/2),round(end/2));
% Y5= E0(:,:,round(end/2),round(end/2));
% Y6= F0(:,:,round(end/2),round(end/2));
% Y7= G0(:,:,round(end/2),round(end/2));
% Y8= H0(:,:,round(end/2),round(end/2));
% Y9= I0(:,:,round(end/2),round(end/2));
% Y10= J0(:,:,round(end/2),round(end/2));
% Y11= K0(:,:,round(end/2),round(end/2));
% Y12= L0(:,:,round(end/2),round(end/2));
% Y13= M0(:,:,round(end/2),round(end/2));
% Y14= N0(:,:,round(end/2),round(end/2));
% Y15= O0(:,:,round(end/2),round(end/2));
% Y16= S0(:,:,round(end/2),round(end/2));
% 
% 
% Group = [Y1 Y2 Y3 Y4; ...
%          Y5 Y6 Y7 Y8; ...
%          Y9 Y10 Y11 Y12; ...
%          Y13 Y14 Y15 Y16];
% figure (1); imshow(Group);

%% Bpp all

% Qua = floor(log2(max(abs(Y0(:)))));
% Bit = myEZWIP_4D_enc(Y0,Qua,Qua);
% bpp_Sep = length(Bit)/(Row*Col*Len*W);
% 
%%  Rounding Error
% AA = A0-A;      EE = E0-E;      II = I0-I;      MM = M0-M;
% BB = B0-B;      FF = F0-F;      JJ = J0-J;      NN = N0-N;
% CC = C0-C;      GG = G0-G;      KK = K0-K;      OO = O0-O;
% DD = D0-D;      HH = H0-H;      LL = L0-L;      SS = S0-S;
% Er_A1 = std(AA(:));     Er_I1 = std(II(:));
% Er_B1 = std(BB(:));     Er_J1 = std(JJ(:));
% Er_C1 = std(CC(:));     Er_K1 = std(KK(:));
% Er_D1 = std(DD(:));     Er_L1 = std(LL(:));
% Er_E1 = std(EE(:));     Er_M1 = std(MM(:));
% Er_F1 = std(FF(:));     Er_N1 = std(NN(:));
% Er_G1 = std(GG(:));     Er_O1 = std(OO(:));
% Er_H1 = std(HH(:));     Er_S1 = std(SS(:));
% 
% YY= Y0-Y;
% Ave_Er_Sep = std(YY(:));
% psnr_freSep = 10 * log10( 255^2 / Ave_Er_Sep);
% 
%% Entropy Rate
% Ent_A1 = EntFst(A0(:)); 
% Ent_B1 = EntFst(B0(:));   
% Ent_C1 = EntFst(C0(:));  
% Ent_D1 = EntFst(D0(:));  
% Ent_E1 = EntFst(E0(:));   
% Ent_F1 = EntFst(F0(:)); 
% Ent_G1 = EntFst(G0(:)); 
% Ent_H1 = EntFst(H0(:));  
% Ent_I1 = EntFst(I0(:));       
% Ent_J1 = EntFst(J0(:));  
% Ent_K1 = EntFst(K0(:));  
% Ent_L1 = EntFst(L0(:));  
% Ent_M1 = EntFst(M0(:));  
% Ent_N1 = EntFst(N0(:));   
% Ent_O1 = EntFst(O0(:));   
% Ent_S1 = EntFst(S0(:));  
%% Bpp
% % 
% A1 = Y0(:,:,:,1);   E1 = Y0(:,:,:,5);   I1 = Y0(:,:,:,9);    M1 = Y0(:,:,:,13);
% B1 = Y0(:,:,:,2);   F1 = Y0(:,:,:,6);   J1 = Y0(:,:,:,10);   N1 = Y0(:,:,:,14);
% C1 = Y0(:,:,:,3);   G1 = Y0(:,:,:,7);   K1 = Y0(:,:,:,11);   O1 = Y0(:,:,:,15);
% D1 = Y0(:,:,:,4);   H1 = Y0(:,:,:,8);   L1 = Y0(:,:,:,12);   S1 = Y0(:,:,:,16);
% % 
% % 
% Qua_A = floor(log2(max(abs(A1(:))))); 
% Bit_A = myEZWIP_3D_enc(A1,Qua_A,Qua_A);bpp_Sep1 = length(Bit_A)/(Row*Col*Len);
% Qua_B = floor(log2(max(abs(B1(:)))));
% Bit_B = myEZWIP_3D_enc(B1,Qua_B,Qua_B);bpp_Sep2 = length(Bit_B)/(Row*Col*Len);
% Qua_C = floor(log2(max(abs(C1(:)))));
% Bit_C = myEZWIP_3D_enc(C1,Qua_C,Qua_C);bpp_Sep3 = length(Bit_C)/(Row*Col*Len);
% Qua_D = floor(log2(max(abs(D1(:)))));
% Bit_D = myEZWIP_3D_enc(D1,Qua_D,Qua_D);bpp_Sep4 = length(Bit_D)/(Row*Col*Len);
% Qua_E = floor(log2(max(abs(E1(:)))));
% Bit_E = myEZWIP_3D_enc(E1,Qua_E,Qua_E);bpp_Sep5 = length(Bit_E)/(Row*Col*Len);
% Qua_F = floor(log2(max(abs(F1(:))))); 
% Bit_F = myEZWIP_3D_enc(F1,Qua_F,Qua_F);bpp_Sep6 = length(Bit_F)/(Row*Col*Len);
% Qua_G = floor(log2(max(abs(G1(:))))); 
% Bit_G = myEZWIP_3D_enc(G1,Qua_G,Qua_G);bpp_Sep7 = length(Bit_G)/(Row*Col*Len);
% Qua_H = floor(log2(max(abs(H1(:)))));
% Bit_H = myEZWIP_3D_enc(H1,Qua_H,Qua_H);bpp_Sep8 = length(Bit_H)/(Row*Col*Len);
% Qua_I = floor(log2(max(abs(I1(:)))));
% Bit_I = myEZWIP_3D_enc(I1,Qua_I,Qua_I);bpp_Sep9 = length(Bit_I)/(Row*Col*Len);
% Qua_J = floor(log2(max(abs(J1(:)))));
% Bit_J = myEZWIP_3D_enc(J1,Qua_J,Qua_J);bpp_Sep10 = length(Bit_J)/(Row*Col*Len);
% Qua_K = floor(log2(max(abs(K1(:)))));
% Bit_K = myEZWIP_3D_enc(K1,Qua_K,Qua_K);bpp_Sep11 = length(Bit_K)/(Row*Col*Len);
% Qua_L = floor(log2(max(abs(L1(:))))); 
% Bit_L = myEZWIP_3D_enc(L1,Qua_L,Qua_L);bpp_Sep12 = length(Bit_L)/(Row*Col*Len);
% Qua_M = floor(log2(max(abs(M1(:)))));
% Bit_M = myEZWIP_3D_enc(M1,Qua_M,Qua_M);bpp_Sep13 = length(Bit_M)/(Row*Col*Len);
% Qua_N = floor(log2(max(abs(N1(:)))));
% Bit_N = myEZWIP_3D_enc(N1,Qua_N,Qua_N);bpp_Sep14 = length(Bit_N)/(Row*Col*Len);
% Qua_O = floor(log2(max(abs(O1(:)))));
% Bit_O = myEZWIP_3D_enc(O1,Qua_O,Qua_O);bpp_Sep15 = length(Bit_O)/(Row*Col*Len);
% Qua_S = floor(log2(max(abs(S1(:))))); 
% Bit_S = myEZWIP_3D_enc(S1,Qua_S,Qua_S);bpp_Sep16 = length(Bit_S)/(Row*Col*Len);
% 
% BPP=[bpp_Sep1, bpp_Sep2, bpp_Sep3, bpp_Sep4, bpp_Sep5, bpp_Sep6, bpp_Sep7, bpp_Sep8, bpp_Sep9, bpp_Sep10, bpp_Sep11, bpp_Sep12, bpp_Sep13, bpp_Sep14, bpp_Sep15, bpp_Sep16];
% bpp_Sep = mean (BPP); 
% 
% Z_A=myEZWIP_3D_dec(Bit_A);      Z_I=myEZWIP_3D_dec(Bit_I);
% Z_B=myEZWIP_3D_dec(Bit_B);      Z_J=myEZWIP_3D_dec(Bit_J); 
% Z_C=myEZWIP_3D_dec(Bit_C);      Z_K=myEZWIP_3D_dec(Bit_K);
% Z_D=myEZWIP_3D_dec(Bit_D);      Z_L=myEZWIP_3D_dec(Bit_L);
% Z_E=myEZWIP_3D_dec(Bit_E);      Z_M=myEZWIP_3D_dec(Bit_M);
% Z_F=myEZWIP_3D_dec(Bit_F);      Z_N=myEZWIP_3D_dec(Bit_N);
% Z_G=myEZWIP_3D_dec(Bit_G);      Z_O=myEZWIP_3D_dec(Bit_O);
% Z_H=myEZWIP_3D_dec(Bit_H);      Z_S=myEZWIP_3D_dec(Bit_S);
% Z= cat(4, Z_A, Z_B, Z_C, Z_D, Z_E, Z_F, Z_G, Z_H, Z_I, Z_J, Z_K, Z_L, Z_M, Z_N, Z_O, Z_S);
% %Inverse Transform
% [ZZ AA BB CC DD EE FF GG HH II JJ KK LL MM NN OO SS] = Dwt53_Sep4D( Z, -1, Fs, Fc, 1 ); 
% %psnr
% psnr_Sep = PSNR(ZZ,X);
% Error_Sep = sum(abs(ZZ(:) - X(:))); 


%% Non Separable 4D DWT

% [Y A B C D E F G H I J K L M N O S] = Dwt53_Nsp4D( X, +1, Fs, Fc, 0 ); %no rounding
[Y0 A0 B0 C0 D0 E0 F0 G0 H0 I0 J0 K0 L0 M0 N0 O0 S0] = Dwt53_Nsp4D( X, +1, Fs, Fc, 1 ); %with rounding
% [Y1 A1 B1 C1 D1 E1 F1 G1 H1 I1 J1 K1 L1 M1 N1 O1 S1] = Dwt53_Nsp4D( Y, -1, Fs, Fc, 1 );
% psnr_pixelNsp = PSNR(Y1,X);
% Error_Nsp = sum(abs(Y1(:) - X(:)));

% Y1= A0(:,:,round(end/2),round(end/2)); X1=imresize(Y1,2); figure(1);imshow(Nrm(X1,1));
% Y2= B0(:,:,round(end/2),round(end/2)); X2=imresize(Y2,2); figure(2);imshow(Nrm(X2,1)); 
% Y3= C0(:,:,round(end/2),round(end/2)); X3=imresize(Y3,2); figure(3);imshow(Nrm(X3,1)); 
% Y4= D0(:,:,round(end/2),round(end/2)); X4=imresize(Y4,2); figure(4);imshow(Nrm(X4,1));
% Y5= E0(:,:,round(end/2),round(end/2)); X5=imresize(Y5,2); figure(5);imshow(Nrm(X5,1));
% Y6= F0(:,:,round(end/2),round(end/2)); X6=imresize(Y6,2); figure(6);imshow(Nrm(X6,1));
% Y7= G0(:,:,round(end/2),round(end/2)); X7=imresize(Y7,2); figure(7);imshow(Nrm(X7,1));
% Y8= H0(:,:,round(end/2),round(end/2)); X8=imresize(Y8,2); figure(8);imshow(Nrm(X8,1));
% Y9= I0(:,:,round(end/2),round(end/2)); X9=imresize(Y9,2); figure(9);imshow(Nrm(X9,1)); 
% Y10= J0(:,:,round(end/2),round(end/2)); X10=imresize(Y10,2); figure(10);imshow(Nrm(X10,1)); 
% Y11= K0(:,:,round(end/2),round(end/2)); X11=imresize(Y11,2); figure(11);imshow(Nrm(X11,1));
% Y12= L0(:,:,round(end/2),round(end/2)); X12=imresize(Y12,2); figure(12);imshow(Nrm(X12,1));
% Y13= M0(:,:,round(end/2),round(end/2)); X13=imresize(Y13,2); figure(13);imshow(Nrm(X13,1));
% Y14= N0(:,:,round(end/2),round(end/2)); X14=imresize(Y14,2); figure(14);imshow(Nrm(X14,1));
% Y15= O0(:,:,round(end/2),round(end/2)); X15=imresize(Y15,2); figure(15);imshow(Nrm(X15,1));
% Y16= S0(:,:,round(end/2),round(end/2)); X16=imresize(Y16,2); figure(16);imshow(Nrm(X16,1));

%% Bpp all

% Qua = floor(log2(max(abs(Y0(:)))));
% Bit = myEZWIP_4D_enc(Y0,Qua,Qua);
% bpp_Nsp = length(Bit)/(Row*Col*Len*W);
%% Rounding Error
% AA = A0-A;      EE = E0-E;      II = I0-I;      MM = M0-M;
% BB = B0-B;      FF = F0-F;      JJ = J0-J;      NN = N0-N;
% CC = C0-C;      GG = G0-G;      KK = K0-K;      OO = O0-O;
% DD = D0-D;      HH = H0-H;      LL = L0-L;      SS = S0-S;
% Er_A2 = std(AA(:));     Er_I2 = std(II(:));
% Er_B2 = std(BB(:));     Er_J2 = std(JJ(:));
% Er_C2 = std(CC(:));     Er_K2 = std(KK(:));
% Er_D2 = std(DD(:));     Er_L2 = std(LL(:));
% Er_E2 = std(EE(:));     Er_M2 = std(MM(:));
% Er_F2 = std(FF(:));     Er_N2 = std(NN(:));
% Er_G2 = std(GG(:));     Er_O2 = std(OO(:));
% Er_H2 = std(HH(:));     Er_S2 = std(SS(:));
% 
% YY= Y0-Y;
% Ave_Er_Nsp = std(YY(:));
% psnr_freNsp = 10 * log10( 255^2 / Ave_Er_Nsp);
% 
%% Entropy Rate
% Ent_A2 = EntFst(A0(:)); 
% Ent_B2 = EntFst(B0(:)); 
% Ent_C2 = EntFst(C0(:));  
% Ent_D2 = EntFst(D0(:));  
% Ent_E2 = EntFst(E0(:)); 
% Ent_F2 = EntFst(F0(:));  
% Ent_G2 = EntFst(G0(:));  
% Ent_H2 = EntFst(H0(:)); 
% Ent_I2 = EntFst(I0(:));     
% Ent_J2 = EntFst(J0(:)); 
% Ent_K2 = EntFst(K0(:));  
% Ent_L2 = EntFst(L0(:));   
% Ent_M2 = EntFst(M0(:));   
% Ent_N2 = EntFst(N0(:)); 
% Ent_O2 = EntFst(O0(:));  
% Ent_S2 = EntFst(S0(:)); 
% % 
%% Bpp
% 
% A1 = Y0(:,:,:,1);   E1 = Y0(:,:,:,5);   I1 = Y0(:,:,:,9);   M1 = Y0(:,:,:,13);
% B1 = Y0(:,:,:,2);   F1 = Y0(:,:,:,6);   J1 = Y0(:,:,:,10);   N1 = Y0(:,:,:,14);
% C1 = Y0(:,:,:,3);   G1 = Y0(:,:,:,7);   K1 = Y0(:,:,:,11);   O1 = Y0(:,:,:,15);
% D1 = Y0(:,:,:,4);   H1 = Y0(:,:,:,8);   L1 = Y0(:,:,:,12);   S1 = Y0(:,:,:,16);
% 
% Qua_A = floor(log2(max(abs(A1(:))))); Bit_A = myEZWIP_3D_enc(A1,Qua_A,Qua_A);bpp_Nsp1 = length(Bit_A)/(Row*Col*Len);
% Qua_B = floor(log2(max(abs(B1(:))))); Bit_B = myEZWIP_3D_enc(B1,Qua_B,Qua_B);bpp_Nsp2 = length(Bit_B)/(Row*Col*Len);
% Qua_C = floor(log2(max(abs(C1(:))))); Bit_C = myEZWIP_3D_enc(C1,Qua_C,Qua_C);bpp_Nsp3 = length(Bit_C)/(Row*Col*Len);
% Qua_D = floor(log2(max(abs(D1(:))))); Bit_D = myEZWIP_3D_enc(D1,Qua_D,Qua_D);bpp_Nsp4 = length(Bit_D)/(Row*Col*Len);
% Qua_E = floor(log2(max(abs(E1(:))))); Bit_E = myEZWIP_3D_enc(E1,Qua_E,Qua_E);bpp_Nsp5 = length(Bit_E)/(Row*Col*Len);
% Qua_F = floor(log2(max(abs(F1(:))))); Bit_F = myEZWIP_3D_enc(F1,Qua_F,Qua_F);bpp_Nsp6 = length(Bit_F)/(Row*Col*Len);
% Qua_G = floor(log2(max(abs(G1(:))))); Bit_G = myEZWIP_3D_enc(G1,Qua_G,Qua_G);bpp_Nsp7 = length(Bit_G)/(Row*Col*Len);
% Qua_H = floor(log2(max(abs(H1(:))))); Bit_H = myEZWIP_3D_enc(H1,Qua_H,Qua_H);bpp_Nsp8 = length(Bit_H)/(Row*Col*Len);
% Qua_I = floor(log2(max(abs(I1(:))))); Bit_I = myEZWIP_3D_enc(I1,Qua_I,Qua_I);bpp_Nsp9 = length(Bit_I)/(Row*Col*Len);
% Qua_J = floor(log2(max(abs(J1(:))))); Bit_J = myEZWIP_3D_enc(J1,Qua_J,Qua_J);bpp_Nsp10 = length(Bit_J)/(Row*Col*Len);
% Qua_K = floor(log2(max(abs(K1(:))))); Bit_K = myEZWIP_3D_enc(K1,Qua_K,Qua_K);bpp_Nsp11 = length(Bit_K)/(Row*Col*Len);
% Qua_L = floor(log2(max(abs(L1(:))))); Bit_L = myEZWIP_3D_enc(L1,Qua_L,Qua_L);bpp_Nsp12 = length(Bit_L)/(Row*Col*Len);
% Qua_M = floor(log2(max(abs(M1(:))))); Bit_M = myEZWIP_3D_enc(M1,Qua_M,Qua_M);bpp_Nsp13 = length(Bit_M)/(Row*Col*Len);
% Qua_N = floor(log2(max(abs(N1(:))))); Bit_N = myEZWIP_3D_enc(N1,Qua_N,Qua_N);bpp_Nsp14 = length(Bit_N)/(Row*Col*Len);
% Qua_O = floor(log2(max(abs(O1(:))))); Bit_O = myEZWIP_3D_enc(O1,Qua_O,Qua_O);bpp_Nsp15 = length(Bit_O)/(Row*Col*Len);
% Qua_S = floor(log2(max(abs(S1(:))))); Bit_S = myEZWIP_3D_enc(S1,Qua_S,Qua_S);bpp_Nsp16 = length(Bit_S)/(Row*Col*Len);
% 
% BPP1=[bpp_Nsp1, bpp_Nsp2, bpp_Nsp3, bpp_Nsp4, bpp_Nsp5, bpp_Nsp6, bpp_Nsp7, bpp_Nsp8, bpp_Nsp9, bpp_Nsp10, bpp_Nsp11, bpp_Nsp12, bpp_Nsp13, bpp_Nsp14, bpp_Nsp15, bpp_Nsp16];
% bpp_Nsp = mean (BPP1); 
% % 
% Z_A=myEZWIP_3D_dec(Bit_A);      Z_I=myEZWIP_3D_dec(Bit_I);
% Z_B=myEZWIP_3D_dec(Bit_B);      Z_J=myEZWIP_3D_dec(Bit_J); 
% Z_C=myEZWIP_3D_dec(Bit_C);      Z_K=myEZWIP_3D_dec(Bit_K);
% Z_D=myEZWIP_3D_dec(Bit_D);      Z_L=myEZWIP_3D_dec(Bit_L);
% Z_E=myEZWIP_3D_dec(Bit_E);      Z_M=myEZWIP_3D_dec(Bit_M);
% Z_F=myEZWIP_3D_dec(Bit_F);      Z_N=myEZWIP_3D_dec(Bit_N);
% Z_G=myEZWIP_3D_dec(Bit_G);      Z_O=myEZWIP_3D_dec(Bit_O);
% Z_H=myEZWIP_3D_dec(Bit_H);      Z_S=myEZWIP_3D_dec(Bit_S);
% Z= cat(4, Z_A, Z_B, Z_C, Z_D, Z_E, Z_F, Z_G, Z_H, Z_I, Z_J, Z_K, Z_L, Z_M, Z_N, Z_O, Z_S);
% %Inverse Transform
% [ZZ AA BB CC DD EE FF GG HH II JJ KK LL MM NN OO SS] = Dwt53_Sep4D( Z, -1, Fs, Fc, 1 ); 
% %psnr
% psnr_Nsp = PSNR(ZZ,X);
% Error_Nsp = sum(abs(ZZ(:) - X(:))); 
