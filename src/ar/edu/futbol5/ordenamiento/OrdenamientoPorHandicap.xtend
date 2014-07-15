package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Partido

class OrdenamientoPorHandicap extends CriterioOrdenamiento {
	
	override ordenar(Partido partido) {
		partido.inscriptos.sortBy(calcularValor()).clone.reverse
	}
	
	override calcularValor() {
		[ jugador | jugador.calificacion ]
	}
	
}