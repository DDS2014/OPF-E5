package ar.edu.futbol5.ordenamiento



class OrdenamientoPorHandicap extends CriterioOrdenamiento {
	

	override calcularValor() {
		[ jugador | jugador.calificacion ]
	}
	
}