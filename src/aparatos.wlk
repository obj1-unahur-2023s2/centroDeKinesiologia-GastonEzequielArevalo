import pacientes.*

class Aparato{
	var property colorDelAparato = "blanco"
	
	method puedeSerUsado(unPaciente)
	
	method usar(unPaciente)
	
	method esDeColorRojo(){
		return colorDelAparato == "rojo"
	}
	
	method colorDelAparato(){
		return colorDelAparato
	}
	
	method necesitaMantenimiento()
	
	method hacerMantenimiento()
}

class Magneto inherits Aparato{
	
	var puntosDeInmantacion 
	
	method puntosDeInmantacion(){
		return puntosDeInmantacion
	}
	
	override method puedeSerUsado(unPaciente){
		return true 
	}
	
	override method usar(unPaciente){
		unPaciente.disminuirDolor(unPaciente.nivelDeDolor() * 0.1)
		0.max(puntosDeInmantacion - 1)
	}
	
	override method necesitaMantenimiento(){
		return self.puntosDeInmantacion() < 100
	}
	
	override method hacerMantenimiento(){
		puntosDeInmantacion += 800.min(puntosDeInmantacion + 500)
	}
}

class Bicicleta inherits Aparato{
	
	var cantDeVecesQueSeLeDesajustanLoTornillos = 0
	
	var cantDeVecesQuePierdeAceite = 0
	
	override method puedeSerUsado(unPaciente){
		return unPaciente.edad() > 8
	}
	
	override method usar(unPaciente){
		if(unPaciente.nivelDeDolor() > 30 and unPaciente.edad().between(30,50)){
			cantDeVecesQueSeLeDesajustanLoTornillos += 1
			cantDeVecesQuePierdeAceite += 1
		}
		else if(unPaciente.nivelDeDolor() > 30){
			cantDeVecesQueSeLeDesajustanLoTornillos += 1
		}
		unPaciente.disminuirDolor(4)
		unPaciente.aumentarLaFortaleza(3)
	}
	
	override method necesitaMantenimiento(){
		return cantDeVecesQueSeLeDesajustanLoTornillos >= 10 or cantDeVecesQuePierdeAceite >= 5
	}
	
	override method hacerMantenimiento(){
		cantDeVecesQueSeLeDesajustanLoTornillos = 0
		cantDeVecesQuePierdeAceite = 0
	}
}

class Minitramp inherits Aparato{
	override method puedeSerUsado(unPaciente){
		return unPaciente.nivelDeDolor() < 20
	}
	
	override method usar(unPaciente){
		unPaciente.aumentarLaFortaleza(unPaciente.edad() * 0.1)
	}
	
	override method necesitaMantenimiento(){
	}
	
	override method hacerMantenimiento(){
	}
}