function net = get_learned_network_incremental_tanh(in, out, hidden_layers, min_error, etha, beta, seed)
	net = initialize([size(in)(2) hidden_layers size(out)(2)], seed);
	err=min_error+1;
	epochs = 0;
	while(err>min_error)
		epochs++;
		perm = randperm(size(in)(1));
		for i = perm
			net = learning_network_tanh(net, etha, in(i), out(i), beta);
		end
		err = err_calculus_tanh(net, in, out);
		if mod(epochs, 1000) == 0
			printf("%f\n", err);
			fflush(stdout);
		end
		
	end
end
