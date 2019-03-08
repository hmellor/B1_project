%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% func_tapered
% DWM 30/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function v = func_tapered(tstart,tstop,tstep,taperfraction,omega)
  tapertime = taperfraction*(tstop-tstart);
  v=[];
  for t=tstart:tstep:tstop
    a = func(t,omega);
 
    if (tapertime>0)
      if (t<tstart+tapertime)
        a = ((t-tstart)/tapertime)*a;
      else
        if (t>tstop-tapertime)
          a = ((tstop-t)/tapertime)*a;
        end
      end
    end
    v=[v, a];
  end
