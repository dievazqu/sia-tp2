function net = learning_network_tanh(network, learning_rate, in, out, beta)
	g = @tanh;
	aux=in;
	M=size(network)(2);
	%% calcula los h, siendo h{m}(i,j)
	%% h es la suma pesadad de lo que le llega al nodo
	%% el valor que sale de la capa m, i es el numero del patron y j es el numero del nodo
	for i=1 : M
        aux = [ ones(size(aux)(1), 1)*-1 aux]; %%le agrego el umbral
		h{i} = aux*network{i}; %%hago pasar el patron, por la capa i
        aux = g(beta*h{i}); %%pasamos la h por la funcion de activacion
    end
	network_out = aux; 
	
	%%ACA ESTA LA PAPA 


	%% solo para g = tanh
	%%calculo los delta
	%%ultima capa:
	for i=1 : size(network{M})(2)
		delta{M}(:,i) = beta*(1-(tanh(beta*h{M}(:,i)).**2)).*(out(:,i)-network_out(:,i));
	end
	%%capas intermedias:
    for m=M : -1 : 2
		for i=1 : size(network{m-1})(2)
			delta{m-1}(:,i) = beta*(1-(tanh(beta*h{m-1}(:,i)).**2)).*(delta{m}*network{m}(i,:)');
		end
	end
	
	w=network;
	w{1} = w{1} + learning_rate*([ones(size(aux)(1), 1)*-1 g(beta*in)]'*delta{1});
	
	for m=2 : M
		w{m} = w{m} + learning_rate*([ones(size(in)(1), 1)*-1 g(beta*h{m-1})]'*delta{m});	
	end
	net = w;
end


%% {i} representa la capa i
%% las filas en las matrices reprentan los distintos patrones 
%% las columnas representan los nodos
