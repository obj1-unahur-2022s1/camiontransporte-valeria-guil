/*
 * Revisar los comentarios sobre el objetos
 */
object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method cantidadDeBultos() = 1
	method sufrirCambios() {}
}

object bumblebee {
	/*NO quedo ningun método que lo vuelva a auto :-( */
	var transformadoEnRobot = false
	method peso() = 800
	method transformarARobot() {
		transformadoEnRobot = true
	}
	method estaTransformadoEnRobot() = transformadoEnRobot
	method nivelPeligrosidad() = if (self.estaTransformadoEnRobot()) {30} else {15}	
	method cantidadDeBultos() = 2
	method sufrirCambios() {
		self.transformarARobot()
	}
}

object paqueteLadrillos{
	var ladrillos  = 0
	method peso() = ladrillos * 2
	method nivelPeligrosidad() = 2
	method agregarLadrillos(cantidad) { ladrillos = cantidad}
	method cantidadDeBultos() = 
		if(ladrillos <= 100) {1} 
		else if (ladrillos.between(101, 300)) {2}
		else {3}
 	method sufrirCambios() {
 		self.agregarLadrillos(12)
 	}
}

object arena {
	var peso = 0
	method nivelPeligrosidad() = 1
	method peso() = peso
	method agregarPeso(agregarPeso) {peso = agregarPeso}
	method cantidadDeBultos() = 1
	method sufrirCambios() {
 		self.agregarPeso(20)
 	}
}

object bateriaAntiarea {
	/*NO quedo ningun método para descargar los misiles :-( */
	var tieneMisiles = false
	method peso() = if (self.estaConMisiles()) {300} else {200}
	method nivelPeligrosidad() = if (self.estaConMisiles()) {100} else {0}
	method estaConMisiles() = tieneMisiles
	method cargarMisiles() {tieneMisiles = true}
	method cantidadDeBultos() = if(self.estaConMisiles()) {2} else {1}
	method sufrirCambios() {
 		self.cargarMisiles()
 	}
}

object contenedor {
	const cosas = [] 
	method peso() = 100 + cosas.sum({c => c.peso()}) 
	method nivelPeligrosidad() = 
		if (cosas.isEmpty()) {0} else 
		   /* podias usar max sin el map */	
		   //{cosas.map({c => c.nivelPeligrosidad()}).max()}
		   {cosas.max({c => c.nivelPeligrosidad()}).nivelPeligrosidad()}
	method cargarCosas(cargarCosa) {cosas.addAll(cargarCosa)}
	method cantidadDeBultos() = 1 + cosas.sum({c => c.cantidadDeBultos()})
	method sufrirCambios() {
		/* esto es un forEach */
 		//cosas.map({c => c.sufrirCambios()})
 		cosas.forEach({c => c.sufrirCambios()})
 	}
}

object residuosRadioactivos {
	var peso = 0
	method nivelPeligrosidad() = 200 
	method peso() = peso
	method agregarPesoResiduos(pesoResiduos) {peso = pesoResiduos}
	method cantidadDeBultos() = 1
	method sufrirCambios() {
 		self.agregarPesoResiduos(15)
 	}
}

object embalajeSeguridad {
	var cosaAdentro 
	method peso() = cosaAdentro.peso()
	method nivelPeligrosidad() = cosaAdentro.nivelPeligrosidad() / 2
	method envolverCosa(cosa) {cosaAdentro = cosa}
	method cantidadDeBultos() = 2
	method sufrirCambios() {}
}