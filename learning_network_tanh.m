function net = learning_network_tanh(network, learning_rate, in, out, beta)
	g = @tanh;
	aux=in;
	M=size(network)(2);
	%% calcula los h, siendo h{m}(i,j)
	%% h es la suma pesadad de lo que le llega al nodo
	%% el valor que sale de la capa m, i es el numero del patron y j es el numero del nodo
	for i=1 : M
        aux = [ ones(size(aux)(1), 1)*-1 aux]; %%le agrego el umbral
		h{i} = aux*network{i}; %%hago pasar el patron por la capa i
        aux = g(beta*h{i}); %%pasamos la h por la funcion de activacion
        v{i} = aux; %% g(h_i)
    end
	network_out = aux; 

	%% solo para g = tanh
	%%calculo los delta
	%%ultima capa:
	delta{M} = beta*(1-v{M}.**2).*(out-network_out);
	%%capas intermedias:
    for m=M : -1 : 2
		delta{m-1} = beta*(1-v{m-1}.**2).*(delta{m}*network{m}(2:end,:)'); %%preguntar a Cristina
	end
	
	network{1} = network{1} + learning_rate*([ones(size(aux)(1), 1)*-1 in]'*delta{1});
	for m=2 : M
		network{m} = network{m} + learning_rate*([ones(size(in)(1), 1)*-1 v{m-1}]'*delta{m});	
	end
	net = network;
end


%% {i} representa la capa i
%% las filas en las matrices reprentan los distintos patrones 
%% las columnas representan los nodos
