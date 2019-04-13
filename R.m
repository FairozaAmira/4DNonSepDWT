function Result=R(T,q,X)

%with rounding
if T==1
Result=floor(1/2+ X*q)/q;
% Result=round(X);
end
%no rounding
if T==0
Result=X;
end

end



