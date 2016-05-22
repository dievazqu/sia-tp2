function o = colNormalize(in, a, b)
	minn=min(in);
	maxx=max(in);
	for i=1:size(in)(1)
		o(i,:)=(in(i,:)-minn)./(maxx-minn);
	o = o * (b-a)+a;
end
