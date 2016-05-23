function randomPlot(data, net, g, beta)
	hold off;
	plotting(data,".b");
	hold on;
	maxx=max(max(data));
	minn=min(min(data));
	in = rand(20000, 2)*(maxx-minn)+minn;
	out = running_network(net, in, g, beta);
	plotting([in out],".r");
end
