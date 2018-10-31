class Nutricion

	attr_reader :peso, :talla, :edad, :sexo, :ccintura, :ccadera
	attr_writer :peso, :talla, :edad, :sexo, :ccintura, :ccadera

	def initialize(peso, talla, edad, sexo, ccintura, ccadera)
		@peso = Float(peso)
		@talla = Float(talla)
		@edad = edad
		@sexo = sexo
		@ccintura = Float(ccintura)
		@ccadera = Float(ccadera)
	end

	def indice_masa_corporal
		(peso / (talla * talla) * 10000).round(1)
	end


	def imc_tabla
		x = self.indice_masa_corporal


		if x < 18.5
			return "#{x} < 18.5 -- Bajo peso -- Delgado"
		elsif x >= 18.5 && x <= 24.9
			return "18.5 < #{x} < 24.9 -- Adecuado -- Aceptable"
		elsif x > 24.9 && x <= 29.9
			return "25.0 < #{x} < 29.9 -- Sobrepeso -- Sobrepeso"
		elsif x > 29.9 && x <= 39.9
			return "30.0 < #{x} < 39.9 -- Obesidad grado 1 -- Obesidad"
		elsif x > 39.9
			return " #{x} > 40 -- Obesidad grado 2 -- Obesidad"
		end

	end

	def porc_grasa
		(1.2 * self.indice_masa_corporal + 0.23 * edad - 10.8 * sexo - 5.4).round(1)
	end

	def relacion_cc
		(ccintura / ccadera).round(2)
	end


	def rcc_tabla
		x = self.relacion_cc

			if sexo == 1
					if x >= 0.83 && x < 0.88
						return "Bajo -- 0.83 < #{x} < 0.88"
					elsif x >= 0.88 && x < 0.95
						return "Moderado -- 0.88 < #{x} < 0.95"
					elsif x >= 0.95 && x < 1.01
						return "Alto -- 0.95 < #{x} < 1.01"
					elsif x >= 1.01
						return "Muy alto -- #{x} > 1.01"
					end
			end

			if sexo == 0
						if x >= 0.72 && x < 0.75
							return "Bajo -- 0.72 < #{x} < 0.75"
						elsif x >= 0.75 && x < 0.82
							return "Moderado -- 0.75 < #{x} < 0.82"
						elsif x >= 0.82
							return "Alto -- #{x} > 0.82"
						end
			end
	end

end
