class Jugador
	attr_reader :ficha

    def initialize (ficha)
        @ficha = ficha    
    end

    def haGanado?(mapa, fila, columna)
       #return false
       (
       	(mapa[fila][0] == @ficha) && (mapa[fila][1] == @ficha) && 
       	(mapa[fila][2] == @ficha)
       ) ||
       (
       	(mapa[0][columna] == @ficha) &&	(mapa[1][columna] == @ficha) && 
       	(mapa[2][columna] == @ficha)
       	) || 
       (
       	(fila == columna) && (mapa[0][0] == @ficha) && (mapa[1][1] == @ficha) && 
       	(mapa[2][2] == @ficha)
       	) || 
       (
       	(fila + columna == 2) && (mapa[0][2] == @ficha) && (mapa[1][1] == @ficha) && 
       	(mapa[2][0] == @ficha)
       	)

    end   

end