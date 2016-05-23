function getting_feedback(vec_err, err, epochs, net)
	%%hold on
	%%plot(epochs,err, ".")
	plot(vec_err,".");
	drawnow();
	if mod(epochs-1, 100) == 0
		printf("error en la epoca %d: %f\n", epochs, err);
		save "aux.data" net;
		%%	outa = running_network(net, in, g, beta)
		fflush(stdout);
	end
end
