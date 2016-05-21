function y = dtanh2(g_x, b)
	y = b*(1-g_x.**2);
	y = white_noise(y);
end
