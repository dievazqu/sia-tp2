function net = learning_network_tanh(network, learning_rate, in, out, beta)
	g = @tanh;
	aux=in;
	in = [ ones(size(in), 1)*-1 in];
	for i=1 : size(network)(2)
                aux = [ ones(size(aux), 1)*-1 aux];
		h{i} = aux*network{i};
                aux = g(h{i});
        end
	h;
	
	network_out = aux;
	w = network;
	M=size(network)(2);
	%% solo para g = tanh
	for i=1 : size(network{M}(2))
		delta{M}(:,i) = beta*((1-(tanh(h{M}(:,i)).**2)).*(out(:,i)-network_out(:,i)));
	end
        for m=size(network)(2) : -1 : 2
		for i=1 : size(network{M}(2))
			delta{m-1}(:,i) = beta*(1-(tanh(h{m-1}(:,i)).**2))* (w{m}(:,i)'*delta{m});
		end
	end
	w{1} = w{1} + learning_rate.*(tanh(in)'*delta{1});
	for m=2 : size(network{M}(2))
		w{m} = w{m} + learning_rate*(tanh(h{m-1}'*delta{m}));	
	end
	net = w;
end


%% {i} representa la capa i
%% las filas en las matrices reprentan los distintos patrones 
%% las columnas representan los nodos
