function in = bits_combination(n)
	max = 2**n;
	for i=0:max-1
		in(i+1,:) = bitget(i, n:-1:1);
	end
end
