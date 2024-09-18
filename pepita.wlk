object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - 10 - distancia
	}

	method validarVolar(distancia) {
	  if (energia < (10 + distancia)){
		self.error("La distancia" + distancia + "es muy lejos para su energia")
	  }
	}
		
	method energia() {
		return energia
	}

}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia = energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia){
		self.validarVolar(distancia) 
		energia = energia - 20 - 2*distancia
	}

	method validarVolar(distancia) {
	  if( energia <  (20 + 2*distancia)){
		self.error("La distancia" + distancia + "es muy lejos para su energia")
	  }
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {
  const aves = #{}

	method ave(_ave) {
	  aves.add(_ave)
	}

	method aves() {
	  return aves
	}

	method movilizar(distancia) {
		self.validarVolar(distancia)
	  aves.forEach({ave => ave.volar(distancia)})
	}

	method validarVolar(distancia) {
	  if (not aves.all( ave => ave.volar(distancia))){
		self.error("No puede volar todas")
	  }
	}
}

