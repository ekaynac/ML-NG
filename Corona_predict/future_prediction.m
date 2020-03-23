function future = future_prediction(lenght,m,theta)
%FUTURE_PREDÝCTÝON predicts future case numbers starting from m+1
%   Detailed explanation goes here



for i=1:lenght
    future(i) = [1,m+1,(m+1)^2,(m+1)^3]*theta;
    m = m+1;
end
end

