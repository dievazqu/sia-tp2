function divv = get_divisor(size2)
	divv = 1;
	index = 2;
	while(index*index<size2)
	 	if mod(size2,index)==0
	 		divv=index;
		end
	 	index++;
	end
end