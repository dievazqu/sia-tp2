function net = solve_network(m)
  in = m(:, 1:2);
  out = m(:,3);
  hidden_layers = [20 5];
  min_error = 0.0003;
  etha = 0.02;
  beta = 0.2;
  alfa = 0.9;
  seed = 17804;
  a=0.001;
  b=0.1;
  k=10;
  g=@tanh2;
  dg=@dtanh2;
  hold off;
  net = get_learned_network_batch(in, out, hidden_layers, min_error, etha, beta, alfa,a,b,k, seed, g, dg);
end
