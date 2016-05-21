function comparisonPlot(data, net, g, beta)
	hold off;
	plotting(data,".b");
	hold on;
	in = data(:,1:2);
	out = running_network(net, in, g, beta);
	plotting([in out],".r");
end
