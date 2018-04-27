function fh = derivativeFunction
    fh = localfunctions;
end

function y = dSig(x)
    f = simulationNetwork;
    y = f{1}(x) .* f{1}(1-x);   
end

function y = dTanh(x)
    f = simulationNetwork;
    y = 1 - (f{2}(x) .^ 2);
end

function y = dIdentity(x)  
        y = ones(size(x));    
end