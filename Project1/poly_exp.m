%MatLab
function  [y] = poly_exp(x)
% coeff
        a = 1.000000000000000; 
        b = 0.998849709207536;
        c=   0.509628545650239;
        d = 0.140424901339539;
        f = 0.069378672261732;

     if  x <= 1 && x >= 0
         y =(a + x*(b + x*(c + x*(d +f*(x))))); %base case 0 <= x <=1
        return;
     elseif x < 0 && abs(x) <= 1 
         y =(a + x*(b + x*(c + x*(d +f*(x)))))^-1; % 0 <=|x| <=1 => e^x = (poly_exp(x))^-1
     else
        y = poly_exp(x/2) * poly_exp(x/2); % recusively find (e^x/2)^2
      end
 end
 
 
