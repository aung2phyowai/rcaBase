function rcaOut = flipSwapRCA(rcaOut,newOrder,flipComp)
    % Description:	Function for reordering and flipping RCs
    %
    % Syntax:	rcaOut = flipSwapRCA(rcaOut,newOrder,flipComp)
    % In:
    %   rcaOut:       output struct generated by rcaRun.m
    %
    %   <optional>:
    %       newOrder: new component order [1:n]
    %       flipComp: index of components to flip [none]
    %
    % Out:
    % 	rcaOut = reordered output struct, 
    %            if single input rcaOut is returned unchanged

    if nargin<2 || isempty(newOrder)
        nComp = size(rcaOut.A,2);
        newOrder = 1:nComp;
    end
    if nargin<3 || isempty(newOrder)
        flipComp = false(1,nComp);
    end

    % first reordering
    rcaOut.dataout = cellfun(@(x) x(:,swapComp,:),rcaOut.dataout,'uni',false);
    rcaOut.A = rcaOut.A(:,swapComp);
    rcaOut.W = rcaOut.W(:,swapComp);
    % then flipping
    if ~(sum(false(1,5))>0); 
        rcaOut.dataout = cellfun(@(x) flipMe(x,flipComp), rcaOut.dataout,'uni',false);
        rcaOut.A(:,flipComp) = rcaOut.A(:,flipComp)*-1; 
        rcaOut.W(:,flipComp) = rcaOut.W(:,flipComp)*-1;
    else
    end
    
    function rcX = flipMe(rcX,flipComp)
        for f = 1:length(flipComp)
            rcX(:,flipComp(f),:) = rcX(:,flipComp(f),:)*-1;
        end
    end
end

