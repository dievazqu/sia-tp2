function ans = solve_network()
  % Cargar archivo
  m = load("terrain9.txt");
  % me quedo con 3 particiones del conjunto de puntos total: 
  % un grupo del conjunto total (el 50% de los puntos), 
  % otro de la superficie por encima (el 25% de los puntos)
  % y otro de la superficie por debajo (el 25% de los puntos)
  % agregando o restando al eje z un determinado porcentaje 
  % de su valor original
  #gbp=good_bad_points(m, 0.05, 1000);
  #gbp;
  #m=[gbp(:,1) gbp(:,2) gbp(:, 3)];
  % Normalizar valores por columna
  norm = [];
  for i = [1 : size(m)(2)]
    col = m(:,i);
    maxCol = max(col);
    minCol = min(col);
    
    col = ((col - minCol) / (maxCol - minCol)) * 2 - 1;
    
    norm = [norm, col];
  end
  
  mNorm = norm;
  
  % Elegir valores
  
  #total = length(gbp(:,1));
  
  % Crear vector entrenamiento con el total de filas en 1
  #result = ones(total, 1);  
  
  % Agregar valores falsos, tantos como elegidos
  % Usar planos invalidos (z = 1, y > 0, x = rand; z = -1, y < 0, x = rand)
  #add = ceil(total * 0.5);
  %invalid = [];
  %invalid = [invalid; rand(add, 1) * 2 - 1, rand(add, 1) * -1, ones(add, 1)];
  %invalid = [invalid; rand(add, 1) * 2 - 1, rand(add, 1), ones(add, 1) * -1];
  
  %result = [result; ones(add * 2, 1) * -1];
  %norm = [norm; invalid];
  #result=gbp(:,4);	
  m=mNorm;
 
  in = m(:, 1:2);
  out = m(:,3);
  
  %plot3(m(:,1)'([1:1:floor(size(m)/2)])', m(:,2)'([1:1:floor(size(m)/2)])', m(:,3)'([1:1:floor(size(m)/2)])', "ob");
  %hold on;

 
  %plot3(m(:,1)'([floor(size(m)/2):1:floor(size(m))])', m(:,2)'([floor(size(m)/2):1:floor(size(m))])', m(:,3)'([floor(size(m)/2):1:floor(size(m))])', "xr");
  
  % Entrenar red neuronal
  % hidden_layers = 40: > 2000 epochs para terminar
  % hidden_layers = [10 20 5]: < 20 epochs para terminar
  % hidden_layers = [20 5]: < 20 epochs para terminar
  % hidden_layers = 100: > 2000 epochs para terminar
  hidden_layers = [20 5]; %2n + 1
  min_error = 0.01;
  etha = 0.02;
  beta = 0.2;
  alfa = 0;
  seed = 17804;
  a=0;
  b=0;
  k=0;
  
  net = get_learned_network_batch(in, out, hidden_layers, min_error, etha, beta, alfa,a,b,k, seed, @tanh2, @dtanh2);
  #net = get_learned_network_incremental_tanh(norm, result, hidden_layers, min_error, etha, beta, seed);
  
  % Generar valores aleatorios entre -1 y 1
 # test = rand(add * 2, 3) * 2 - 1;
  ans = net;
end
