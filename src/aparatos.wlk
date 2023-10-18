import pacientes.*

class Aparato{
	var property colorDelAparato = "blanco"
	
	method puedeSerUsado(unPaciente)
	
	method usar(unPaciente)
	
	method esDeColorRojo(){
		return colorDelAparato == "rojo"
	}
}

class Magneto inherits Aparato{
	
	override method puedeSerUsado(unPaciente){
		return true 
	}
	
	override method usar(unPaciente){
		unPaciente.disminuirDolor(unPaciente.nivelDeDolor() * 0.1)
	}
}

class Bicicleta inherits Aparato{
	
	override method puedeSerUsado(unPaciente){
		return unPaciente.edad() > 8
	}
	
	override method usar(unPaciente){
		unPaciente.disminuirDolor(4)
		unPaciente.aumentarLaFortaleza(3)
	}
}

class Minitramp inherits Aparato{
	override method puedeSerUsado(unPaciente){
		return unPaciente.nivelDeDolor() < 20
	}
	
	override method usar(unPaciente){
		unPaciente.aumentarLaFortaleza(unPaciente.edad() * 0.1)
	}
}