function [r]=  pearsonCorrelation(Xp,Y_data,L)
xsum = sum(Xp);
ysum = sum(Y_data);
yconj_sum=sum(conj(Y_data));
num = L*(sum(Xp.*Y_data))-(xsum)*(ysum);
denum = sqrt((L*sum(Xp.^2)-(xsum^2))*(L*sum(Y_data.*conj(Y_data))-(ysum*yconj_sum)));
r=num/denum;
end