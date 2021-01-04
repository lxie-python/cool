function theta=hilbert_phase(x,cuttail,x0,y0,fig)
%computes phase via the Hilbert transform
%x=time series
%x0,y0=origin (x0=0,y0=0,by default)
%fig=1 plot 
%cuttail the number of points you want to cut of at the ends to avoid boundary effects

if nargin<5, fig=0; end
if nargin<4,disp('WARNING: define both coordinates of the origin!');return;end
if nargin<3, x0=0;y0=0; end

ht=hilbert(x);
ht=ht(cuttail+1:end-cuttail);
ht=ht-mean(ht);
if fig==1 %plot
    plot(ht);hold on;plot(x0,y0,'ro');hold off;
    xlabel('signal');ylabel('HT（signal）');axis square;
end
ht=ht-x0-1i*y0;
theta=angle(ht);
theta=mod(theta,2*pi);
theta=theta(:);
end
   
