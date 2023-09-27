import classVagones.*
//esDePasajeros && puedeTransportar cambiar
class Formacion {
	const vagones = new List()
	
	method agregarVagon(unVagon){
		vagones.add(unVagon)
	}
	
	method cuantosPasajerosPuedeLlevar(){
		return vagones.sum({vagon => vagon.cantidadDePasajeros()})
	}
	
	method cantidadVagonesPopulares(){
		return vagones.count({vagon => vagon.esPopular()})
	}
	
	method cantidadVagonesCargueros(){
		return vagones.all({vagon => vagon.puedeTransportar(1000)})
	}
	
	method dispersionDePesos(){
		const maximo = vagones.max{vagon => vagon.pesoMaximo()}
		const minimo = vagones.min{vagon => vagon.pesoMaximo()}
		return maximo.pesoMaximo() - minimo.pesoMaximo()
	}
	
	method cantidadDeBanios(){
		return vagones.count({vagon => vagon.tieneBanio()})
	}
	
	method estaEquilibrada(){
		const pasajeros = self.vagonesSoloDePasajeros()
		const maximo = pasajeros.max{vagon => vagon.cantidadDePasajeros()}
		const minimo = pasajeros.min{vagon => vagon.cantidadDePasajeros()}
		return maximo.cantidadDePasajeros()-minimo.cantidadDePasajeros() <= 2
	}
	
	
	method vagonesSoloDePasajeros(){
		return vagones.filter{vagon => vagon.esDePasajeros()}	
	}
	
	method estaOrganizada(){
		return not(1..vagones.size()-1).any{
			idx => not vagones.get(idx-1).esDePasajeros() and vagones(idx).esDePasajeros()
		}
	}
}
