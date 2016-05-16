function y = exp2(h, beta)
	a = -2 * (beta.*h);
	y = 1 ./ (1 + exp(a));
	%fflush(stdout);
end
