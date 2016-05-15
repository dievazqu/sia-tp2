function net = initialize(dimensions, seed)
	rand("seed", seed);
	a=dimensions(1);
	i=1;
	while(i<size(dimensions)(2))
		b=dimensions(i+1);
		net{i}=rand(a+1, b)-0.5; %%+1 por el umbral
		%net{i} = getInitialNetwork(a + 1,b) - 0.5;
		a=b;
		i=i+1;
	end
end
	
