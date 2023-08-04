%% Functions
function [X,Y]=inner_average(dff_traces,ori,stt,ent)
    oriuni = unique(ori);
    X=[];
    Y=[];
    for isti=1:length(oriuni)
        for ibin=1:length(ori(ori==oriuni(isti)))
            temp = find(ori ==oriuni(isti)); stti = stt(temp); enti = ent(temp);
            X_raw_win=dff_traces(:,stti(ibin):enti(ibin));
            X_raw_win_norm=normalize(X_raw_win,1);
            X(:,end+1)=mean(X_raw_win_norm,2);
            Y(end+1) = oriuni(isti);
        end
    end
end


