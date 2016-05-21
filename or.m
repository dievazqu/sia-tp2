function o = or(in)
	o = zeros(size(in)(1),1);
	for i = 1:size(in)(2)
		o|=in(:, i);
	end
end
