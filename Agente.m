classdef Agente
    properties
        dinero 
    end
    properties (Dependent)
        clase
    end
    methods
        function obj = Agente(dineroInicial) % Constructor de la clase
            obj.dinero = dineroInicial;
        end
        function clase = get.clase(obj) % Calculo de la clase
            global C m_max
            deltaDinero = m_max/C; % Cantidad de dinero entre una clase y otra
            clase = round(obj.dinero/deltaDinero) + 1; 
            if clase > C
                clase = C;
            end
        end
    end
end
