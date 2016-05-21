function net = get_learned_network_incremental(in, out, hidden_layers, min_error, etha, beta, alfa, a, b, k, seed, g, dg)
	net = initialize([size(in)(2) hidden_layers size(out)(2)], seed);
	err=min_error+1000000; %%Aseguramos que el error disminuye en el primer caso
	epochs = 0;
	vec_err = [];
	decreaseEpochs=0;
	prevNet = net;
	prevErr=err;
	size2 = size(in)(1);
	divv = get_divisor(size2);
		
	while(err>min_error)
		epochs++;
		%%
		j = 0;
		perm = randperm(size2);
		for i = perm
			net = learning_network(net, etha, in(i,:), out(i,:), beta, g, dg);
			if mod(j, divv) == 0
				err = err_calculus(net, in, out, g, beta);
				params = get_adaptive_etha(etha, prevErr, err, prevNet, net, decreaseEpochs, a, b, k, alfaConst, alfa);
				%% Levantando los valores modificados por la función
				%% FORMA LINDA DE HACER ESTO?? %% TODO: arreglar
				etha = params{1};
				err = params{2};
				net = params{3};
				decreaseEpochs = params{4};
				alfa = params{5};
				%%
				prevNet=net;
				prevErr=err;
			end
			
		end
		%%
		err = err_calculus(net, in, out, g, beta); %% No me convence como se está calculando esto
		vec_err = [vec_err err];
		getting_feedback(vec_err, err, epochs);
		
	end
	printf("error en la epoca %d: %f\n", epochs, err);
end
