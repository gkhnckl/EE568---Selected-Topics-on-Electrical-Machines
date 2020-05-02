vol_cu_f = 114*150*24e-9;  %m3
vol_mag_f = 405*100*4e-9; %m3
vol_core_f = 9205 * 100e-9; %m3

vol_cu_n = 66*150*24e-9; %m3
vol_mag_n = 156*100*4e-9; %m3
vol_core_n = 14313*100e-9; %m3

sp_cost_cu = 15;  % €/kg, specific cost of the flat wire material
sp_cost_mag_n = 60;  % €/kg, specific cost of the magnets
sp_cost_mag_f = 16 ;  % €/kg, specific cost of the magnets
sp_cost_core = 2;  % €/kg, specific cost of the back iron


dens_cu = 8.96e3;     %kg/m3, density of the conductor
dens_mag_n = 7.5e3;     %kg/m3, density of magnets
dens_mag_f = 5e3;     %kg/m3, density of magnets
dens_core = 7.8e3;  %kg/m3, density of core material


m_cu_f = dens_cu * vol_cu_f;
m_cu_n = dens_cu * vol_cu_n;

m_mag_f = dens_mag_f * vol_mag_f;
m_mag_n = dens_mag_n * vol_mag_n;

m_core_f = dens_core * vol_core_f;
m_core_n = dens_core * vol_core_n;


cost_cu_f = m_cu_f * sp_cost_cu;
cost_cu_n = m_cu_n * sp_cost_cu;

cost_mag_f = m_mag_f * sp_cost_mag_f;
cost_mag_n = m_mag_n * sp_cost_mag_n;

cost_core_f = m_core_f * sp_cost_core;
cost_core_n = m_core_n * sp_cost_core;


mass_f = m_cu_f + m_mag_f + m_core_f;
mass_n = m_cu_n + m_mag_n + m_core_n;


cost_f = cost_cu_f + cost_mag_f + cost_core_f;
cost_n = cost_cu_n + cost_mag_n + cost_core_n;

as=1



