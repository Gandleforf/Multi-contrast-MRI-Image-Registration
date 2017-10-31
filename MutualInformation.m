function [E] = MutualInformation(Ireg, Iref, N)
    % note that Iref and Ireg has already been masked at this point.
    Ireg = Ireg(:);              % cast to array
    Ireg = Ireg(Ireg ~= 0); % get rid of all zeros
    % do same for Iref
    Iref = Iref(:);
    Iref = Iref(Iref ~= 0);

    Pref = hist(Iref(:), N);
    Preg = hist(Ireg(:), N);
    Joint = hist3([Iref(:),Ireg(:)], [N,N]);
    E = 0;
    for n1=1:N
        for n2=1:N
            E = E + Joint(n1,n2) * log((Joint(n1,n2)/(Pref(n1)*Preg(n2))));
        end
    end
    