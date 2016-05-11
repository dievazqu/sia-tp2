function net = get_learned_network_batch(in, out, hidden_layers, min_error, etha, beta, seed, g, dg)
	net = initialize([size(in)(2) hidden_layers size(out)(2)], seed);
	err=min_error+1;
	epochs = 0;
	while(err>min_error)
		epochs++;
		net = learning_network(net, etha, in, out, beta, g, dg);
		err = err_calculus(net, in, out,g, beta);
		err;
		if mod(epochs, 1000) == 0
			printf("%f\n", err);
			fflush(stdout);
		end
		
	end
end
