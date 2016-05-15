function err = err_calculus(net, in, out,g, beta)
	my_out = running_network(net, in, g, beta);
        err = sum((my_out-out).**2) /2;
end
