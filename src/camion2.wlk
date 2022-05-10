import cosas2.*

object camion {
	const cosas = []
	
	method cargar(cosa)  {
		cosas.add(cosa)
		cosa.sufrirCambios()
	}
	method descargar(cosa) {cosas.remove(cosa)}
	method totalBultos() =
		cosas.sum({c=> c.cantidadDeBultos()})
}	 
