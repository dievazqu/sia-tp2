function net = get_learned_network_incremental_tanh(in, out, hidden_layers, min_error, etha, beta, seed)
	net = get_learned_network_incremental(in, out, hidden_layers, min_error, etha, beta, seed, @tanh2, @dtanh2);
end
