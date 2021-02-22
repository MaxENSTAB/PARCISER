clear all
close all


%% Mesure drone
vide_hor_VV=((chargementVV('vide_hor')));
vide_hor_HH=((chargementHH('vide_hor')));
drone1_VV=chargementVV('drone_hori_av')-(vide_hor_VV*ones(1,362));
drone1_HH=chargementHH('drone_hori_av')-(vide_hor_HH*ones(1,362));
drone2_VV=chargementVV('drone_hori_ar')-(vide_hor_VV*ones(1,362));
drone2_HH=chargementHH('drone_hori_ar')-(vide_hor_HH*ones(1,362));

drone_VV=[drone1_VV drone2_VV];
drone_HH=[drone1_HH drone2_HH];
