function o = normalize(in, a, b)
	minn=min(min(in));
	maxx=max(max(in));
	o = (in-minn)/(maxx-minn);
	o = o * (b-a)+a;
end
