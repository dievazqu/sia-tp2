function o = generalize(data, net, g, beta, val)
	out = running_network(net, data(:,1:2), g, beta);
	diff = abs(out-data(:,3));
	o=sum(diff<val)./size(diff)(1);
end
