function h=DwtCoef(Dw)

if(Dw==0);
  h( 1)=-1/2;
  h( 2)= 1/4;
  h(3:4)=0;
  h(5:6)=1;
end;
if(Dw==1);
  h( 1)=-1.586134342059924;
  h( 2)=-0.052980118572961;
  h( 3)= 0.882911075530934;
  h( 4)= 0.443506852043971;
  h( 5)= 1.230174104914001;
  h( 6)= 1/h(5);
end;  

  
  
   
  