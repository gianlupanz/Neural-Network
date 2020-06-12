function [y,a] = feedForward(net,x,fun)
    dim = size(net.W,2);
    N = size(x,1);
    f = simulationNetwork;
    
    a{1} = net.W{1} * x';
    a{1} = a{1}'+repmat(net.b{1},N,1);
    y{1} = f{fun}(a{1});
    
    for i=2:dim
       a{i} = net.W{i} * y{i-1}';
       a{i} = a{i}' + repmat(net.b{i},N,1);
       y{i} = f{fun}(a{i});
    end
    
end