import aparatos.*
import pacientes.*

object centroDeKinesiologia {
	var aparatos = []
	var pacientes = []
	
	method aparatos(){
		return aparatos
	}
	
	method pacientes(){
		return pacientes
	}
	
	method agregarAparato(aparato){
		aparatos.add(aparato)
	}
	
	method agregarPaciente(unPaciente){
		pacientes.add(unPaciente)
	}
	
	method coloresDeLosAparatos(){
		return aparatos.map({aparato => aparato.colorDelAparato()}).asSet()
	}
	
	method pacientesMenoresDe8Anios(){
		return pacientes.filter({paciente => paciente.edad() < 8})
	}
	
	method cantidadDePacientesQueNoPuedenCumplirLaSesion(){
		return pacientes.count({paciente => not paciente.puedeHacerLaRutina()})
	}
	
	method estaEnOptimasCondiciones(){
		return aparatos.all({aparato => not aparato.necesitaMantenimiento()})
	}
	
	method cantidadDeAparatosQueEstanComplicados(){
		return aparatos.count({aparato => aparato.necesitaMantenimiento()})
	}
	
	method estaComplicado(){
		return self.cantidadDeAparatosQueEstanComplicados() >= aparatos.size()
	}
	
	method visitarDelTecnico(){
		aparatos.forEach({aparato => aparato.hacerMantenimiento()})
	}
}
