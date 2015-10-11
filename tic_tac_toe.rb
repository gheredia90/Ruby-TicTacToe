require './jugador.rb'

class TicTacToe
	attr_reader :tablero, :jugador1, :jugador2, :jugando
    CIRCULO = 1
    ASPA = 2    

    def initialize ()
    	@tablero =  [[0, 0, 0],[0, 0, 0],[0, 0, 0]]
    	for i in 0..2
    		@tablero[i] = []
    		for j in 0..2    
    			@tablero[i][j] = 0
    		end	
    	end
        @jugador1 = Jugador.new(CIRCULO)
        @jugador2 = Jugador.new(ASPA)
        @jugando = true
    end

    def imprimirTablero()
    	puts "\n----------"      
    	for i in 0..2
    		#@tablero[i] = []
    		for j in 0..2    			
    		  if @tablero[i][j] == CIRCULO
    			  print " O "
    		  elsif @tablero[i][j] == ASPA
    			  print " X "
    		  else
    		      print " - "	
    		  end
    		end    		
    		puts "\n"   		  
    	end
    	puts ""
    end			

    def comprobarPosicion?(fila, columna, ficha)
    	if fila.between?(0,2) && columna.between?(0,2) && @tablero[fila][columna] == ficha   			
    		return true    		
    	end
    	false
    end	 

    def ponerFicha(filaDestino, columnaDestino, ficha)
    	fila = filaDestino
    	columna = columnaDestino
    	while !comprobarPosicion?(fila, columna, 0)
    		puts "Por favor introduzca valores adecuados"
    		puts "Introduzca la fila de destino"
    		fila = gets.chomp.to_i
    		puts "Introduzca la columna de destino"
    		columna = gets.chomp.to_i
    	end	
    	@tablero[fila][columna] = ficha  
    	
    end	

    def moverFicha(filaOrigen, columnaOrigen, filaDestino, columnaDestino, ficha)
    	fila1 = filaOrigen
    	columna1 = columnaOrigen
    	while !comprobarPosicion?(fila1, columna1, ficha)
    		puts "Por favor introduzca valores adecuados"
    		puts "Introduzca la fila de origen"
    		fila1 = gets.chomp.to_i
    		puts "Introduzca la columna de origen"
    		columna1 = gets.chomp.to_i
    	end	

    	fila2 = filaDestino
    	columna2 = columnaDestino
    	while !comprobarPosicion?(fila2, columna2, 0)
    		puts "Por favor introduzca valores adecuados"
    		puts "Introduzca la fila de destino"
    		fila2 = gets.chomp.to_i
    		puts "Introduzca la columna de destino"
    		columna2 = gets.chomp.to_i
    	end

    	@tablero[fila2][columna2] = ficha
    	@tablero[fila1][columna1] = 0	
    end	

    def iniciarPartida()
    	jugador_actual = @jugador1
    	num_movimientos = 0

    	while (@jugando && (num_movimientos < 6))
    		puts "Introduzca la fila de destino"
    		filaDestino = gets.chomp.to_i
    		puts "Introduzca la columna de destino"
    		columnaDestino = gets.chomp.to_i

            ponerFicha(filaDestino, columnaDestino, jugador_actual.ficha)
            imprimirTablero()

            @jugando = !(jugador_actual.haGanado?(@tablero, filaDestino, columnaDestino))
            num_movimientos += 1
    		jugador_actual = (jugador_actual == @jugador1) ? @jugador2 : @jugador1

    	end	
    	puts "Todas las fichas sobre el tablero"
    end	


    def jugarPartida()  

    	iniciarPartida()

    	jugador_actual = @jugador1  	
    	while (@jugando)

    		puts "Turno" + jugador_actual.ficha.to_s

    		puts "Introduzca la fila de origen"
    		filaOrigen = gets.chomp.to_i
    		puts "Introduzca la columna de origen"
    		columnaOrigen = gets.chomp.to_i
    		puts "Introduzca la fila de destino"
    		filaDestino = gets.chomp.to_i
    		puts "Introduzca la columna de destino"
    		columnaDestino = gets.chomp.to_i

            moverFicha(filaOrigen,columnaOrigen, filaDestino, columnaDestino, jugador_actual.ficha)
            imprimirTablero()
            @jugando = !(jugador_actual.haGanado?(@tablero, filaDestino, columnaDestino))
    		jugador_actual = (jugador_actual == @jugador1) ? @jugador2 : @jugador1

    	end	
    end
    
end

t = TicTacToe.new()
#t.imprimirTablero()
t.jugarPartida()
