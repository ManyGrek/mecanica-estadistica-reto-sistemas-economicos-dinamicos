function resultado = O(datos_clases_iteracion,datos_dinero_iteracion,func,a)
    global C
    o = zeros(1,C);
    if func == 'a'
        f = @(M) a*M;
    elseif func == 'b'
        f = @(M) 1 - exp(-a*M);
    end
    
    for ii = 1:C
        o(ii) = sum([datos_clases_iteracion == ii]) * f(sum(datos_dinero_iteracion([datos_clases_iteracion == ii])));
    end
    resultado = sum(o);
end