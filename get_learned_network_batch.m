function net = get_learned_network_batch(in, out, hidden_layers, min_error, etha, beta, alfaConst, a, b, k, seed, g, dg)
	net = initialize([size(in)(2) hidden_layers size(out)(2)], seed);
	err=min_error+1000000; %%Aseguramos que el error disminuye en el primer caso
	vec_err=[];	
	prevNet = net;
	decreaseEpochs=0;
	epochs=0;
	alfa=alfaConst;
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
		params = get_adaptive_etha(etha, prevErr, err, prevNet, net, decreaseEpochs, a, b, k, alfaConst, alfa);
		%% Levantando los valores modificados por la función
		%% FORMA LINDA DE HACER ESTO?? %% TODO: arreglar
		etha = params{1};
		err = params{2};
		net = params{3};
		decreaseEpochs = params{4};
		alfa = params{5};
		%%
		vec_err = [vec_err err];
		getting_feedback(vec_err, err, epochs);
	end
	printf("error en la epoca %d: %f\n", epochs, err);
end
