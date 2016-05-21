function o = symmetric(in)
	sizes = size(in)(2);
	o = ones(size(in)(1), 1);
	if(mod(sizes,2)==1)
		sizes--;
	end
	for i=1:(sizes/2)
		o&=(in(:,i)==in(:,(sizes-i+1)));
	end
end
