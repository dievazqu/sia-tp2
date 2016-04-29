function err = err_calculus_tanh(net, in, out)
	my_out = running_network(net, in, @tanh);
        err = sum((my_out-out).**2) /2;
end
