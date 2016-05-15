function ans = forward(network, in, g, beta)
	aux=in;
	M=size(network)(2);
	%% calcula los h, siendo h{m}(i,j)
	%% h es la suma pesadad de lo que le llega al nodo
	%% el valor que sale de la capa m, i es el numero del patron y j es el numero del nodo
	for i=1 : M
        aux = [ ones(size(aux)(1), 1)*-1 aux]; %%le agrego el umbral
        aux = g(aux*network{i}, beta); %%pasamos la h por la funcion de activacion
        v{i} = aux; %% g(h_i)
    end
	ans=v;
end