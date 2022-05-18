/*
 * Muy Bien
 */
import cosas.*

object camion {
	const cosas = []
	const tara = 1000
	
	method cargar(cosa)  {cosas.add(cosa)}
	method descargar(cosa) {cosas.remove(cosa)}
	/* Podes usar even() sobre un número pasar saber si es para */
	method todoPesoPar() = cosas.all( { c => c.peso().even() } )
	method hayAlgunoQuePesa(peso) =  cosas.any({c => c.peso() == peso})
	method elDeNivel(nivel) = cosas.find({c => c.nivelPeligrosidad() == nivel})
	method pesoTotal() = tara + cosas.sum({ c => c.peso() })
	method excedidoDePeso() = self.pesoTotal() > 2500
	method objetosQueSuperanPeligrosidad(nivel) = 
		cosas.filter({c => c.nivelPeligrosidad() > nivel})	
	/* Muy bien que te diste cuenta que podias reutilizar */
	method objetosMasPeligrososQue(cosa) = 
		 self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad()) 
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) =
		not self.excedidoDePeso() and self.noHayObjetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad) 
	method noHayObjetosQueSuperanPeligrosidad(nivel) =
		self.objetosQueSuperanPeligrosidad(nivel).isEmpty()
	method tieneAlgoQuePesaEntre(min, max) =
		cosas.any({ c => c.peso().between(min, max)})
	method cosaMasPesada() = 
		cosas.max({c => c.peso()}) 
	method pesos() = 
		cosas.map ({c=> c.peso()})
		
}	 



