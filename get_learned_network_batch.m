function net = get_learned_network_batch(in, out, hidden_layers, min_error, etha, beta, alfa, a, b, k, seed, g, dg)
	net = initialize([size(in)(2) hidden_layers size(out)(2)], seed);
	err=min_error+1000000; %%Aseguramos que el error disminuye en el primer caso
	vec_err=[];	
	prevNet = net;
	decreaseEpochs=0;
	epochs=0;
	while(err>min_error)
		epochs++;
		for i=1:size(net)(2)
			prev{i}=net{i}-prevNet{i};
		end
		prevNet=net;
		prevErr=err;
		%%
		net = learning_network_momentum(net, etha, in, out, beta, g, dg, alfa, prev);
		err = err_calculus(net, in, out,g, beta);
		%%
		if(err<prevErr)
			decreaseEpochs++;
		else
			decreaseEpochs=0;
		end
		if(err>prevErr)
			net=prevNet;
			err=prevErr;
			etha -= b*etha;
		end
		if(decreaseEpochs>=k)
			etha+=a;
		end
		
		vec_err = [vec_err err];
		if mod(epochs, 1000) == 0
			printf("error en la epoca %d: %f\n", epochs, err);
			printf("el etha mame: %f\n", etha);
			fflush(stdout);
			plot(vec_err, ".")
			drawnow();
		end
	end
end
