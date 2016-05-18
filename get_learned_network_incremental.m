function net = get_learned_network_incremental(in, out, hidden_layers, min_error, etha, beta, alfa, a, b, k, seed, g, dg)
	net = initialize([size(in)(2) hidden_layers size(out)(2)], seed);
	err=min_error+1000000; %%Aseguramos que el error disminuye en el primer caso
	epochs = 0;
	vec_err = [];
	decreaseEpochs=0;
	prevNet = net;
	prevErr=err;
	size2 = size(in)(1);
	divv = 1;
	index = 2;
	while(index*index<size2)
	 	if mod(size2,index)==0
	 		divv=index;
		end
	 	index++;
	end
		
	while(err>min_error)
		epochs++;
		%%
		j = 0;
		perm = randperm(size2);
		for i = perm
			net = learning_network(net, etha, in(i,:), out(i,:), beta, g, dg);
			if mod(j, divv) == 0
				err = err_calculus(net, in, out, g, beta);
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
				prevNet=net;
				prevErr=err;
			end
			
		end
		%%
		
		if mod(epochs, 1000) == 0
			err = err_calculus(net, in, out, g, beta);
			vec_err = [vec_err err];
			printf("error en la epoca %d: %f\n", epochs, err);
			fflush(stdout);
			plot(vec_err, ".")
			drawnow();
		end
		
	end
end
