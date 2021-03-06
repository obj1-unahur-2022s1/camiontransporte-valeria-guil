object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object bumblebee {
	var transformadoEnAuto = false
	method peso() = 800
	method transformarAAuto() {
		transformadoEnAuto = true
	}
	method estaTransformadoEnAuto() = transformadoEnAuto
	method nivelPeligrosidad() = if (self.estaTransformadoEnAuto()) {15} else {30}	
}

object paqueteLadrillos{ 
	var ladrillos  = 0
	method peso() = ladrillos * 2
	method nivelPeligrosidad() = 2
	method agregarLadrillos(cantidad) { ladrillos = cantidad}
}

object arena {
	var peso = 0
	method nivelPeligrosidad() = 1
	method peso() = peso
	method agregarPeso(agregarPeso) {peso = agregarPeso}
}

object bateriaAntiarea {
	var tieneMisiles = false
	method peso() = if (self.estaConMisiles()) {300} else {200}
	method nivelPeligrosidad() = if (self.estaConMisiles()) {100} else {0}
	method estaConMisiles() = tieneMisiles
	method cargarMisiles() {tieneMisiles = true}
}

object contenedor {
	const cosas = [] 
	method peso() = 100 + cosas.sum({c => c.peso()}) 
	method nivelPeligrosidad() = 
		if (cosas.isEmpty()) {0} else 
		   {cosas.map({c => c.nivelPeligrosidad()}).max()}
	method cargarCosas(cargarCosa) {cosas.addAll(cargarCosa)}
}

object residuosRadioactivos {
	var peso = 0
	method nivelPeligrosidad() = 200 
	method peso() = peso
	method agregarPesoResiduos(pesoResiduos) {peso = pesoResiduos}
}

object embalajeSeguridad {
	var cosaAdentro 
	method peso() = cosaAdentro.peso()
	method nivelPeligrosidad() = cosaAdentro.nivelPeligrosidad() / 2
	method envolverCosa(cosa) {cosaAdentro = cosa}
}




