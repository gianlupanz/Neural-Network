function net = newNet (m,n)
    d = 2;
    c = 1;
    if m == 0
       net.W{1} = rand (c,d);
       net.b{1} = rand (1,c);
       net.DW{1} = zeros (c,d);
       net.DB{1} = zeros (1,c);
       net.deltaW{1} = repmat (0.1,c,d);
       net.deltaB{1} = repmat (0.1,1,c);
    else
       net.W{1} = rand (n,d);
       net.b{1} = rand (1,n);
       net.DW{1} = zeros (n,d);
       net.DB{1} = zeros (1,n);
       net.deltaW{1} = repmat (0.1,n,d);
       net.deltaB{1} = repmat (0.1,1,n);
       for i = 2:m
           net.W{i} = rand (n,n);
           net.b{i} = rand (1,n);
           net.DW{i} = zeros (n,n);
           net.DB{i} = zeros (1,n);
           net.deltaW{i} = repmat (0.1,n,n);
           net.deltaB{i} = repmat (0.1,1,n);
       end
       net.W{m+1} = rand (c,n);
       net.b{m+1} = rand (1,c);
       net.DW{m+1} = zeros (c,n);
       net.DB{m+1} = zeros (1,c);
       net.deltaW{m+1} = repmat (0.1,c,n);
       net.deltaB{m+1} = repmat (0.1,1,c);
    end
end