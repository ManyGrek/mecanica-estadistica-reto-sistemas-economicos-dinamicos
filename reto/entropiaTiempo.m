function S = entropiaTiempo(datos_clases)
    global C N
        n_iteraciones = size(datos_clases,2);
        S = zeros(1,n_iteraciones);
        for ii = 1:n_iteraciones
            suma = 0;
            for jj = 1:C
                n_agentes = sum(datos_clases(:,ii) == jj);
                if n_agentes ~= 0
                    suma = suma + n_agentes * log(n_agentes);
                end
            end

            S(ii) = N * log(N) - suma;    
        end
end