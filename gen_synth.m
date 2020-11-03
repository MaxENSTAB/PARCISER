function sigc=gen_synth(map,f1,f2,nf,th1,th2,nth)
% sigc : matrice complexe freq*angle
% map : coordonnées (x,y) des pts brillants et amplitude 
% f1,f2,nf : freq min, max, nb d'échantillons
% th1,th2,nth : angle min, max, nb 'échantillons
nb_pb=size(map,1);    % calcul du nombre de points brillants
x=map(:,1);y=map(:,2);
amp=map(:,3);
th1=th1*pi/180;th2=th2*pi/180;   % conversion de th(degré °) en th(radian) 
df=(f2-f1)/(nf-1);       % pas de balayement en fréquence
dth=(th2-th1)/(nth-1);   % pas de balayement angulaire
amp_max=max(abs(amp));

sigc=zeros(nf,nth); % initialisation de la matrice de données
for k1=1:nth   
   thc=th1+(k1-1)*dth;  % k1-1 pour démarrer avec un indice 0 soit le premier angle th1
   for k2=1:nf
      fc=f1+(k2-1)*df;  
      for k3=1:nb_pb    
         ampc=amp(k3);
         sigc(k2,k1)=sigc(k2,k1)+ampc*exp(j*(4*pi*fc/3e8)*(x(k3)*cos(thc)+y(k3)*sin(thc)));  
      end
   end
end




