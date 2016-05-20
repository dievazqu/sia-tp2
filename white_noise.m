function y = white_noise(x)
	if(abs(x)<0.000001)
		y = 0.1*sign(x);
	end
	y = x;
end