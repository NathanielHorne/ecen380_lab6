%%NOTE: WE WILL BE USING THE HAMMING WINDOW. USE
% THE HAMMING WINDOW YOU FOOL
% THE HAMMING WINDOW IS YOUR FRIEND.


N = 40;
n = (-N:N)'; % Make this a column vector to make hideal
% a column vector because MATLAB's window
% functions produce a column vector.
hideal = sinc(n/pi); % This is your function to compute hideal.
% The equation for hideal was derived
% in the previous step.
% Remember that MATLAB and the textbook use
% different definitions of the function sinc(x).
L = 2*N + 1;
% Hamming
w0 = hamming(L);
% Flat top 
w1 = flattopwin(L);
% Cheb
w2 = chebwin(L);
% Blackman-Harris
w3 = blackmanharris(L);
h0 = hideal .* w0; % a simple rectangular window
h1 = hideal .* w1;
h2 = hideal .* w2;
h3 = hideal .* w3;
F = 0:0.001:0.5; % frequency axis for frequency response plot.
E = exp(1i*2*pi*F); % see comments below
H0 = polyval(h0,E);
H1 = polyval(h1,E);
H2 = polyval(h2,E);
H3 = polyval(h3,E);
figure(1);
sgtitle("Fourier Responses of Selected Window Functions");
subplot(221); stem(n,h0); grid on; ylabel('hideal[n]');
title("Hamming");
subplot(222); stem(n,h1); grid on; ylabel('h1[n]');
title("Flat Top");
subplot(223); stem(n,h2); grid on; ylabel('h2[n]');
title("Cheb");
subplot(224); stem(n,h3); grid on; ylabel('h3[n]');
title("Blackman-Harris");
figure(2);
plot(F,20*log10(abs(H0)),...
F,20*log10(abs(H1)),...
F,20*log10(abs(H2)),...
F,20*log10(abs(H3)));
grid on;
xlabel('frequency (cycles/sample)'); ylabel('magnitude (dB)');
legend('H0(\Omega): Hamming','H1(\Omega): Flat top ','H2(\Omega): Cheb','H3(\Omega): Blackman-Harris');
title("Freq. Response for Selected Window Functions");