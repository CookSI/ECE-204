%MATLAB
function [v] = iter_solve(A,b, N_max, esp_step)
Adiag = diag(diag(A)); % Find the diagonal of A
 Aoff = A -Adiag;       % Find the off diagonal of A
 v0 = Adiag\b;          % inital guess for v
Adbyo = Adiag\Aoff;     % Adiag^-1 * Aoff;


% I decided to do the first itteration of this loop out side to define next_v0
prev_v0 = v0;
next_v0 = v0 - Adbyo * prev_v0;

 next_v0 = v0 - Adbyo * prev_v0;
 
 for k = (1:N_max)
    prev_v0 = next_v0;
    next_v0 = v0 - Adbyo * prev_v0;
    
    if norm(next_v0 - prev_v0) < esp_step
        v = next_v0;
        break;
    end
 end
 if(k+1 >N_max ) %k+1 to acout for itteration before loop. Did the itterations go over N_max? if so return error
      error('the method did not converge');
 end
 
end  