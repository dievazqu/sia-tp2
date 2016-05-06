function net = get_learned_network_tanh(in, out, hidden_layers, min_error)
	a=size(in)(2);
	i=1;
	while(i<=size(hidden_layers))
		b=hidden_layers(i);
		net{i}=rand(a+1, b)-0.5; %%+1 por el umbral
		%net{i} = getInitialNetwork(a + 1,b) - 0.5;
		a=b;
		i=i+1;
	end
	b=size(out)(2);
	net{i} = rand(a+1, b)-0.5;
	err=min_error+1;
	cont = 0;
	while(err>min_error)
		cont++;
		net = learning_network_tanh(net, 0.5, in, out, 1);
		err = err_calculus_tanh(net, in, out);
		err;
		if mod(cont, 1000) == 0
			printf("%f\n", err);
			fflush(stdout);
		end
		
	end
end
