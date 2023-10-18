import aparatos.*

class Paciente{
	var edad 
	var nivelDeFortaleza
	var nivelDeDolor
	const aparatosAsignados = []
	
	method edad(){
		return edad
	}
	
	method nivelDeDolor(){
		return nivelDeDolor
	}
	
	method nivelDeFortaleza(){
		return nivelDeFortaleza
	}
	
	method puedeUsar(unAparato){
		return unAparato.puedeSerUsado(self)
	}
	
	method usarAparato(aparato){
		if(aparato.puedeSerUsado(self)){
			aparato.usar(self)
		}
		else{
			self.error("El paciente no puede usar este aparato")
		}
	}
	
	method disminuirDolor(unaCantidad){
		nivelDeDolor = 0.max(nivelDeDolor - unaCantidad)
	}
	
	method aumentarLaFortaleza(unaCantidad){
		nivelDeFortaleza = 0.max(nivelDeFortaleza + unaCantidad)
	}
	
	method puedeHacerLaRutina(){
		return aparatosAsignados.all({r => r.puedeSerUsado(self)})
	}
	
	method hacerSesionCompleta(){
		aparatosAsignados.forEach({r => self.usarAparato(r)})
	}
}

class PacienteResistente inherits Paciente{
	override method hacerSesionCompleta(){
		if(self.puedeHacerLaRutina())
			super()
			nivelDeFortaleza += aparatosAsignados.size()
	}
}

class PacienteCaprichoso inherits Paciente{
	method cumpleCondicionAdicional(){
		return aparatosAsignados.any({a => a.esDeColorRojo()})
	}
	
	override method hacerSesionCompleta(){
		if(self.cumpleCondicionAdicional())
			super()
			super()
	}
}

class PacienteDeRapidaRecuperacion inherits Paciente{
	override method hacerSesionCompleta(){
		super()	
		self.disminuirDolor(recuperacion.nivelDeRecuperacion())	
	}
}

object recuperacion{
	var property nivelDeRecuperacion = 3
}