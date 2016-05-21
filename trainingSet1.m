function data = trainingSet1(m)
	mm=sortrows(m);
	data = mm(1:2:end,:);
end
