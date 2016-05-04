function net = learning_network_tanh(network, learning_rate, in, out, beta)
	g = @tanh;
	aux=in;
	for i=1 : size(network)(2)
                aux = [ ones(size(aux)(1), 1)*-1 aux];
		h{i} = aux*network{i};
                aux = g(beta*h{i});
        end
	h;
	network_out = aux;
	M=size(network)(2);
	%% solo para g = tanh
	for i=1 : size(network{M})(2)
		delta{M}(:,i) = beta*((1-(tanh(beta*h{M}(:,i)).**2)).*(out(:,i)-network_out(:,i)));
	end
    for m=M : -1 : 2
		for i=1 : size(network{m-1})(2)
			delta{m-1}(:,i) = beta*(1-(tanh(beta*h{m-1}(:,i)).**2)).*(delta{m}*network{m}(i,:)');
		end
	end
	
	w=network;
	w{1} = w{1} + learning_rate*(g([ones(size(aux)(1), 1)*-1 beta*in])'*delta{1});
	for t=2 : size(network{M})(2)
		w{m} = w{m} + learning_rate*(g([ones(size(in)(1), 1)*-1 beta*h{m-1}])'*delta{m});	
	end
	net = w;
end


%% {i} representa la capa i
%% las filas en las matrices reprentan los distintos patrones 
%% las columnas representan los nodos
