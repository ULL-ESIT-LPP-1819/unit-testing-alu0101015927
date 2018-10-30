class Nutricion

	attr_reader :peso, :talla, :edad, :sexo, :ccintura, :ccadera
	
	def initialize(peso, talla, edad, sexo, ccintura, ccadera)
		@peso = peso
		@talla = talla
		@edad = edad
		@sexo = sexo
		@ccintura = ccintura
		@ccadera = ccadera	
	end

	def indice_masa_corporal
		peso / (talla * talla)
	end

	def porc_grasa
		1.2 * self.indice_masa_corporal + 0.23 * edad - 10.8 * sexo - 5.4
	end 

	def relacion_cc 
		ccintura / ccadera

	end
end


