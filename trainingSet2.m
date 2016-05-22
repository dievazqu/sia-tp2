function data = trainingSet2(m)
	mm=sortrows(m);
	data = mm(1:3:end,:);
end
