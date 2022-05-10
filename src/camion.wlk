import cosas.*

object camion {
	const cosas = []
	const tara = 1000
	
	method cargar(cosa)  {cosas.add(cosa)}
	method descargar(cosa) {cosas.remove(cosa)}
	method todoPesoPar() = cosas.all( { c => c.peso() % 2 == 0 } )
	method hayAlgunoQuePesa(peso) =  cosas.any({c => c.peso() == peso})
	method elDeNivel(nivel) = cosas.find({c => c.nivelPeligrosidad() == nivel})
	method pesoTotal() = tara + cosas.sum({ c => c.peso() })
	method excedidoDePeso() = self.pesoTotal() > 2500
	method objetosQueSuperanPeligrosidad(nivel) = 
		cosas.filter({c => c.nivelPeligrosidad() > nivel})	
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



