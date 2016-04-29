% network: estructura con todas las matrices
% in: vector de entrada

% Nota: filas es de donde vengo y las columnas es a donde voy

function out = running_network(network, in, g)
	for i=1 : size(network)(2)
		in = [ ones(size(in), 1)*-1 in];
		in = g(in*network{i});
	end
	out=in;
end
