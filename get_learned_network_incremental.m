function net = get_learned_network_incremental(in, out, hidden_layers, min_error, etha, beta, seed, g, dg)
	net = initialize([size(in)(2) hidden_layers size(out)(2)], seed);
	err=min_error+1;
	epochs = 0;
	vec_err = [];
	while(err>min_error)
		epochs++;
		perm = randperm(size(in)(1));
		for i = perm
			net = learning_network(net, etha, in(i,:), out(i,:), beta, g, dg);
		end
		err = err_calculus(net, in, out, g, beta);
		vec_err = [vec_err err];
		if mod(epochs, 1000) == 0
			plot(vec_err, ".")
			drawnow();
		end
		
	end
end
