package ar.edu.futbol5.distribucion

import ar.edu.futbol5.Partido
import java.util.List
import ar.edu.futbol5.Jugador

class Distribucion14589 implements ModoDistribucion //...a falta de mejor nombre supongo
{
	
	override distribuirJugadores(Partido partido, List<Jugador> jugadores) 
	{
		partido.equipo1 = newArrayList(jugadores.get(0), jugadores.get(3), jugadores.get(4), jugadores.get(7),
				jugadores.get(8))
		partido.equipo2 = newArrayList(jugadores.get(1), jugadores.get(2), jugadores.get(5), jugadores.get(6),
				jugadores.get(9))
	}
	
}