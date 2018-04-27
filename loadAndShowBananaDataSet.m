function [bananaInput bananaTarget]=loadAndShowBananaDataSet(bananaInputFile,bananaTargetFile)
%function [bananaInput bananaTarget]=loadAndShowBananaDataSet(bananaInputFile,bananaTargetFile)

    input=load(bananaInputFile);
    bananaInput=input.bananaInput;
    target=load(bananaTargetFile);
    bananaTarget=target.bananaTarget;
    
    figure;
    hold on;
    for i=1:size(bananaInput,1)
        if bananaTarget(i)==-1
            bananaTarget(i)=0;
            plot(bananaInput(i,1),bananaInput(i,2),'r*');
        else
            plot(bananaInput(i,1),bananaInput(i,2),'b*');
        end
    end
    title('Total Banana dataset: blue points class 1');
end