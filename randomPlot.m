function randomPlot(data, net, g, beta)
	hold off;
	plotting(data,".b");
	hold on;
	in = rand(10000, 2);
	out = running_network(net, in, g, beta);
	plotting([in out],".g");
end
