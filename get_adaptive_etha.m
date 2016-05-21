function params = get_adaptive_etha(etha, prevErr, err, prevNet, net, decreaseEpochs, a, b, k, alfaConst, alfa)
	if(err<prevErr)
		decreaseEpochs++;
		alfa=alfaConst;
	else
		decreaseEpochs=0;
	end
	if(err>prevErr)
		oldEtha = etha;
		etha -= b*etha;
		if (etha != oldEtha) %% sirve en el caso de que no se quiera usar el etha adaptativo
			net=prevNet;
			err=prevErr;
			alfa=0;
		end
	end
	if(decreaseEpochs>=k)
		etha+=a;
	end
	params = {etha err net decreaseEpochs alfa};
end