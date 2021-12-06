function [datos_clases,datos_dinero] = simularSistema(agentes, dm, n_iteraciones, porcentaje_impuestos, periodo_impuestos)
    global N
    switch nargin
        case 3 % Sistema anarquico de mercado
            for jj = 1:n_iteraciones
                for ii = 1:N
                    l = randi(N);
                    s = randi(2);
                    s = s - 3 * (s==2);
                    if ~(agentes(ii).dinero + s * dm < 0 || agentes(l).dinero - s * dm < 0)
                        agentes(ii).dinero = agentes(ii).dinero + s * dm;
                        agentes(l).dinero = agentes(l).dinero - s * dm;
                    end
                end
                datos_clases(:,jj) = [agentes.clase];
                datos_dinero(:,jj) = [agentes.dinero];
            end
        case 5 % Sistema de mercado con impuestos por transaccion
            recaudado = 0;
            for jj = 1:n_iteraciones
                dm_bruto = dm;
                dm_recaudado = dm_bruto * porcentaje_impuestos;
                dm_neto = dm_bruto - dm_recaudado;
                
                for ii = 1:N
                    l = randi(N);
                    s = randi(2);
                    s = s - 3 * (s==2);
                    if ~(agentes(ii).dinero + s * dm_bruto < 0 || agentes(l).dinero - s * dm_bruto < 0)
                        agentes(ii).dinero = agentes(ii).dinero + s * dm_bruto - dm_recaudado/2;
                        agentes(l).dinero = agentes(l).dinero - s * dm_bruto - dm_recaudado/2;
                        recaudado = recaudado + dm_recaudado;
                    end
                end
                
                if mod(jj,periodo_impuestos) == 0
                    m_repartida =  recaudado/N;
                    recaudado = 0;
                    for ii = 1:N
                        agentes(ii).dinero = agentes(ii).dinero + m_repartida;
                    end
                end
                
                datos_clases(:,jj) = [agentes.clase];
                datos_dinero(jj) = sum([agentes.dinero]);
            end
end