package ar.edu.futbol5.ordenamiento


import java.util.ArrayList
import java.util.List

class OrdenamientoMix extends CriterioOrdenamiento {
	
	List<CriterioOrdenamiento> criterios 
	
	new() {
		criterios = new ArrayList<CriterioOrdenamiento>
	}

	
	def addCriterio(CriterioOrdenamiento criterio) {
		criterios.add(criterio)
	}
	
	override calcularValor() {
		[ jugador | 
			criterios.fold(0d, [ acum, criterio | acum + criterio.calcularValor().apply(jugador) ]) / criterios.size
		]
	}
	
}