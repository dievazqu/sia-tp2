function gbp = good_bad_points(m, percent, errorFactor)
	
	cant=round(size(m)(1));
	perm = randperm(cant-1);

	a=m(1,:);
	% tomo un porcentaje de los puntos del enunciado
	for i = perm
		a=[ a; m(i,:)];
	end
	out = ones(cant,1);
	cant=round(cant*percent);
	perm = randperm(cant-1);

	% genero puntos por encima de la superficie
	for i = perm
		% error en la coordenada 3
		xyz=m(i,:);
		znew =xyz(3) + xyz(3)*errorFactor;

		a=[ a; xyz(1) xyz(2) znew];
	end
	
	out = [out; zeros(cant-1,1)*-1];


	% genero puntos por debajo de la superficie
	for i = perm
		% error en la coordenada 3
		xyz=m(i,:);
		znew =xyz(3) - xyz(3)*errorFactor;

		a=[ a; xyz(1) xyz(2) znew];
	end
	
	out = [out; zeros(cant-1,1)*-1];

	gbp=[a  out];

end
