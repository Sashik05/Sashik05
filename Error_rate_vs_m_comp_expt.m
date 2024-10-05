%%%% Error rate with m from reaction evolution with time
m = [0.00000001,0.0000001,0.00000025,0.0000004,0.0000006,0.0000008,0.0000009,0.000002,0.0001,0.1,1,5,10,100,1000];
for i = 1:length(m)
f = Temp_evo(m(i));
Err_rate(i)=f(end);
end


figure
plot(log(m),log(Err_rate))





