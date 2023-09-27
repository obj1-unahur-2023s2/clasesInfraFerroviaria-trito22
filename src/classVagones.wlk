class VagonDePasajero {
	const property ancho
	const property largo
	const property tieneBanio
	var property estaOrdenado = true
	
	method cantidadDePasajeros(){
		const pasajero = if(ancho <= 3){largo*8}else{largo*10}
		return if(not estaOrdenado){0.max(pasajero - 15)}else{pasajero}
	}
	
	method maximoCarga() = if(tieneBanio){300}else{800}
	method pesoMaximo() = 2000 + 80 * self.cantidadDePasajeros() + self.maximoCarga()
	method esPopular() = self.cantidadDePasajeros() > 50
	method esCarguero() = self.maximoCarga() >= 1000
	method recibirMantenimiento(){
		estaOrdenado = true
	}
}

class VagonDeCarga{
	var property maderaSuelta
	const cargaMaximaIdeal
	
	method cantidadDePasajeros() = 0
	method maximoCarga()= 0.max(cargaMaximaIdeal - 400 * maderaSuelta)
	method pesoMaximo() = 1500 + self.maximoCarga()
	method tieneBanio()=false
	method esPopular() = false
	method esCarguero() = self.maximoCarga() >= 1000
	method recibirMantemiento(){
		maderaSuelta = 0.max(maderaSuelta - 2)
	}
}

class VagonDeDormitorio{
	const property cantidadCompartimientos
	var property camasPorCompartimiento
	
	method cantidadDePasajeros()=cantidadCompartimientos * camasPorCompartimiento
	method pesoMaximo() = 4000 + 80*self.cantidadDePasajeros() + self.maximoCarga()
	method maximoCarga() = 1200
	method tieneBanio() = true
	method esPopular() = self.cantidadDePasajeros() > 50
	method esCarguero() = self.maximoCarga() >= 1000
	method recibirMantemiento()
}