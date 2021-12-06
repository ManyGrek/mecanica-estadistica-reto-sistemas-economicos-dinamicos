function plotClases(agentes,logaritmico)
global C m_max
    clases = [agentes.clase];
    deltaDinero = m_max/C;
    etiquetas = "0";
    for ii = 1:C
        texto(ii) = string(ii) + ".- $" + etiquetas + "-" + "$" + string(ii*deltaDinero);
        etiquetas = string(ii*deltaDinero);
    end
    categorias = categorical(clases,1:C,convertStringsToChars(texto));
    histogram(categorias)
    if nargin == 2 && logaritmico == true
        set(gca,'YScale','log') % Reescalamiento logarítmico
    end
end