function fh = simulationNetwork
    fh = localfunctions;
end

function y = computeSig(a)
    y = 1./(1+exp(-a));   
end

function y = computeTanH(a)
    y = (exp(a)-exp(-a)) ./ (exp(a)+exp(-a));
end

function y = computeIdentity(a)  
        y = a;     
end