function y = dexp2(g_x, beta)
	x = 2*beta.*g_x.*(1 - g_x);
	y = white_noise(x);
end