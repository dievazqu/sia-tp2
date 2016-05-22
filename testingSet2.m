function data = testingSet2(m)
	mm=sortrows(m);
	data = [mm(2:3:end,:) ; mm(3:3:end,:)];
end
