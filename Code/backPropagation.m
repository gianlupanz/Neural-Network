function [DW,DB] = backPropagation (net,input,target,fun)
    dim = size(net.W,2);
    f = derivativeFunction;
    
    [y,a] = feedForward(net,input,fun);
    
    delta_output = (y{dim} - target) .* f{fun}(a{dim});
    delta = delta_output;
    if dim > 1
        DW{dim} = delta_output' * y{dim-1};
    else
        DW{dim} = delta_output' * input;
    end
    DB{dim} = sum(delta_output);
    
    for i=dim-1:-1:1
        delta_hidden = (delta * net.W{i+1}) .* f{fun}(a{i});
        delta = delta_hidden;
        DB{i} = sum(delta);
        if i > 1
           DW{i} = delta_hidden' * y{i-1}; 
        else
           DW{i} = delta_hidden' * input;
        end
    end
    
end