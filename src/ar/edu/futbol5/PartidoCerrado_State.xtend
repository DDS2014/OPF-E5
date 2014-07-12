package ar.edu.futbol5

class PartidoCerrado_State extends PartidoState 
{
	override permiteInscripciones()
	{
		return true;
	}
}