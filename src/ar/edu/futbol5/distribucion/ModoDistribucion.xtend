package ar.edu.futbol5.distribucion

import ar.edu.futbol5.Partido
import ar.edu.futbol5.Jugador
import java.util.List

interface ModoDistribucion 
{
	def void distribuirJugadores(Partido partido,  List<Jugador> jugadores);	
}