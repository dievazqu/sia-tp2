function net = learning_network(network, learning_rate, in, out, beta, g, dg)
	
	M=size(network)(2);
	v=forward(network, in, g, beta);
	network_out = v{M};


	%% solo para g = tanh
	%%calculo los delta
	%%ultima capa:
	delta{M} = dg(v{M},beta).*(out-network_out);
	%%capas intermedias:
    for m=M : -1 : 2
		delta{m-1} = dg(v{m-1},beta).*(delta{m}*network{m}(2:end,:)'); %%preguntar a Cristina
	end
	
	network{1} = network{1} + learning_rate*([ones(size(in)(1), 1)*-1 in]'*delta{1});
	for m=2 : M
		network{m} = network{m} + learning_rate*([ones(size(in)(1), 1)*-1 v{m-1}]'*delta{m});	
	end
	net = network;
end


%% {i} representa la capa i
%% las filas en las matrices reprentan los distintos patrones 
%% las columnas representan los nodos
