function net = RProp (net,DW,DB)
    ETAp = 1.1;
    ETAm = 0.5;
    DeltaMAX = 50;
    DeltaMIN = power(10,-6);
    dim = size(net.W,2);
    
    for i=1:dim

            if DW{i} .* net.DW{i} > 0
                net.deltaW{i} = min(ETAp .* net.deltaW{i},DeltaMAX);
                net.W{i} = net.W{i} - sign(DW{i}) .* net.deltaW{i};
            elseif DW{i} .* net.DW{i} < 0
                net.deltaW{i} = max(ETAm .* net.deltaW{i},DeltaMIN);
                net.W{i} = net.W{i} - net.deltaW{i};
                DW{i} = 0;
            else
                net.W{i} = net.W{i} - sign(DW{i}) .* net.deltaW{i};
            end

            if DB{i} .* net.DB{i} > 0
                net.deltaB{i} = min(ETAp .* net.deltaB{i},DeltaMAX);
                net.b{i} = net.b{i} - sign(DB{i}) .* net.deltaB{i};
            elseif DB{i} .* net.DB{i} < 0
                net.deltaB{i} = max(ETAm .* net.deltaB{i},DeltaMIN);
                net.b{i} = net.b{i} - net.deltaB{i};
                DB{i} = 0;
            else
                net.b{i} = net.b{i} - sign(DB{i}) .* net.deltaB{i};
            end
            net.DW{i} = DW{i};
            net.DB{i} = DB{i};   

    end
    
end