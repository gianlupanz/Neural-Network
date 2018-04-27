function plotDataDS(X,Y)
    N=size(X,1);
    labels=unique(Y);
    figure;
    hold on;
    for i=1:N
        if Y(i)==labels(1)
            plot(X(i,1),X(i,2),'r*');
        else
            plot(X(i,1),X(i,2),'bo');
        end
    end
return