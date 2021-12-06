function animacionClases(datos_animacion,logaritmico)
global C m_max
    deltaDinero = m_max/C;
    etiquetas = "0";
    dt = 1/24;
    for ii = 1:C
        texto(ii) = string(ii) + ".- $" + etiquetas + "-" + "$" + string(ii*deltaDinero);
        etiquetas = string(ii*deltaDinero);
    end
    
    for ii = 1:size(datos_animacion,2)
        for jj = 1:C
            size_barras(jj) = sum(datos_animacion(:,ii) == jj);
        end
        eje_y(ii) = max(size_barras);
    end
    alto_histograma = max(eje_y)+1;
    
    for ii = 1:size(datos_animacion,2)
        clases = [datos_animacion(:,ii)];
        categorias = categorical(clases,1:C,convertStringsToChars(texto));
        histogram(categorias)
        ylim([0 alto_histograma]);
        if nargin == 2 && logaritmico == true
            set(gca,'YScale','log') % Reescalamiento logarítmico
        end
        title('Distribución a lo largo del tiempo')
        xlabel('Clases')
        ylabel('Frecuencia')
        pause(dt);
    end
end
