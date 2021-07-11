function [q,ea,iter]=romberg_1505041(func,trval,a,b,es,maxit)
n = 1;
I(1,1) = trap_1505041(func,a,b,n);
iter = 0;
trueval=trval;
while iter<maxit
    iter = iter+1;
    n = 2^iter;
    I(iter+1,1) = trap_1505041(func,a,b,n);
    for k = 2:iter+1
        j = 2+iter-k;
        I(j,k) = (4^(k-1)*I(j+1,k-1)-I(j,k-1))/(4^(k-1)-1);
    end
    %ea = abs((I(1,iter+1)-I(2,iter))/I(1,iter+1))*100;
    ea = abs((trueval-I(1,iter+1))/trueval)*100;
    if ea<=es||k>=8
        break;
    end
end
q = I(1,iter+1);