function y = dtanh2(g_x, b)
	x = b*(1-g_x.**2);
	y = white_noise(x);
end