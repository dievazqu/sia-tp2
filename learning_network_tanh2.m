function net = learning_network_tanh(network, learning_rate, in, out, beta)
        g = @tanh;
        for i=1 : size(network)(2)
                in = [ ones(size(in), 1)*-1 in];
                h(:,:,i) = in*network{i};
                in = g(h(:,:,i));
        end
        network_out = in;
        w = network;
        M=size(network)(2);
        %% solo para g = tanh
        for i=1 : size(network{M}(2))
                delta(:,i,M) = beta*((1-tanh(h(:,i,M)).**2).*(out(:,i)-network_out(:,i)));
        end
        for m=size(network)(2) : -1 : 2
                for i=1 : size(network{M}(2))
                        delta(:,i,m-1) = beta*(1-tanh(h(:,i,m-1)).**2)* (w(:,i,m)'*delta(:,:,m));
                end
        end
        for m=1 : size(network{M}(2))
                w{m} = w{m} + learning_rate*(delta(:,:,m)'*tanh(h(:,:,m)));
        end
        net = w;
end

