package ar.edu.futbol5

import ar.edu.futbol5.excepciones.BusinessException
import ar.edu.futbol5.ordenamiento.CriterioOrdenamiento
import ar.edu.futbol5.ordenamiento.OrdenamientoPorHandicap
import java.util.ArrayList
import java.util.List
import ar.edu.futbol5.distribucion.ModoDistribucion
import ar.edu.futbol5.distribucion.DistribucionParImpar

class Partido {

	@Property List<Jugador> inscriptos
	@Property ArrayList<Jugador> equipo1
	@Property ArrayList<Jugador> equipo2
	PartidoState estado
	@Property CriterioOrdenamiento criterioOrdenamiento
	@Property ModoDistribucion distribucionEquipos

	new() {
		inscriptos = new ArrayList<Jugador>
		estado = new PartidoAbierto_State()
		distribucionEquipos = new DistribucionParImpar() // par/impar
		criterioOrdenamiento = new OrdenamientoPorHandicap
	}

	def generarEquipos() {
		this.validarInscripcion()
		this.distribuirEquipos(this.ordenarEquipos)
		estado = new PartidoGenerado_State()
	}

	def validarInscripcion() {
		if (inscriptos.size < 10) throw new BusinessException("No hay suficientes jugadores inscriptos como para generar los equipos")
		if (!estado.permiteInscripciones()) throw new BusinessException("El partido no se encuentra en un estado que permita generar los equipos")
	}

	def distribuirEquipos(List<Jugador> jugadores) 
	{
		this.distribucionEquipos.distribuirJugadores(this, jugadores);
	}

	def List<Jugador> ordenarEquipos() {
		criterioOrdenamiento.ordenar(this)
	}

	def void inscribir(Jugador jugador) {
		if (inscriptos.size < 10) {
			this.inscriptos.add(jugador)
		} else {
			if (this.hayAlgunJugadorQueCedaLugar()) {
				this.inscriptos.remove(this.jugadorQueCedeLugar())
				this.inscriptos.add(jugador)
			} else {
				throw new BusinessException("No hay más lugar")
			}
		}
	}

	def boolean hayAlgunJugadorQueCedaLugar() {
		inscriptos.exists[jugador|jugador.dejaLugarAOtro]
	}

	def Jugador jugadorQueCedeLugar() {
		if (!hayAlgunJugadorQueCedaLugar()) {
			return null
		}
		return inscriptos.filter[jugador|jugador.dejaLugarAOtro].get(0)
	}

	def void cerrar() {
		estado = new PartidoCerrado_State()
	}
}
