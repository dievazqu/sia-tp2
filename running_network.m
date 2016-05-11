% network: estructura con todas las matrices
% in: vector de entrada

% Nota: filas es de donde vengo y las columnas es a donde voy

function out = running_network(network, in, g, beta)
	M = size(network)(2);
	out=forward(network, in, g, beta){M};
end
