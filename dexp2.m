function y = dexp2(g_x, beta)
	y = 2*beta.*g_x.*(1 - g_x);
	y = white_noise(y);
end
