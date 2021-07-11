function I = trap_1505041(func,a,b,n)
x = a; 
h = (b - a)/n; 
I=func(a); 
for i = 1 : n-1 
    x = x + h; 
    I = I + 2*func(x); 
end
I = I + func(b); 
I = (b - a) * I/(2*n);