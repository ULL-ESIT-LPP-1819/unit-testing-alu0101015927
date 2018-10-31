require_relative '../lib/Nutricion'
require 'test/unit'

class TestNutricion < Test::Unit::TestCase

  def setup
    @persona1 = Nutricion.new(60, 167, 20, 0, 50, 53)
  end

  def test_persona

    assert_equal(60, @persona1.peso)
    assert_equal(167, @persona1.talla)
    assert_equal(20, @persona1.edad)
    assert_equal(0, @persona1.sexo)
    assert_equal(50, @persona1.ccintura)
    assert_equal(53, @persona1.ccadera)

  end

  def test_formulas

    assert_equal(21.5, @persona1.indice_masa_corporal)
    assert_equal("18.5 < 21.5 < 24.9 -- Adecuado -- Aceptable", @persona1.imc_tabla)
    assert_equal(25, @persona1.porc_grasa)
    assert_equal(0.94, @persona1.relacion_cc)
    assert_equal("Alto -- 0.94 > 0.82", @persona1.rcc_tabla)

  end

  def test_tabla_imc

    persona2 = Nutricion.new(50, 170, 20, 0, 53, 52)
    assert_equal(17.3, persona2.indice_masa_corporal)
    assert_equal("17.3 < 18.5 -- Bajo peso -- Delgado", persona2.imc_tabla)
          persona2.talla = 160
    assert_equal(19.5, persona2.indice_masa_corporal)
    assert_equal("18.5 < 19.5 < 24.9 -- Adecuado -- Aceptable", persona2.imc_tabla)
          persona2.peso = 71.0
    assert_equal(27.7, persona2.indice_masa_corporal)
    assert_equal("25.0 < 27.7 < 29.9 -- Sobrepeso -- Sobrepeso", persona2.imc_tabla)
          persona2.peso = 77.0
    assert_equal(30.1, persona2.indice_masa_corporal)
    assert_equal("30.0 < 30.1 < 39.9 -- Obesidad grado 1 -- Obesidad", persona2.imc_tabla)
          persona2.peso = 103.0
    assert_equal(40.2, persona2.indice_masa_corporal)
    assert_equal(" 40.2 > 40 -- Obesidad grado 2 -- Obesidad", persona2.imc_tabla)

  end

  def test_tabla_rcc

    persona3 = Nutricion.new(60, 170, 20, 0, 66, 90)
    assert_equal(0.73, persona3.relacion_cc)
    assert_equal("Bajo -- 0.72 < 0.73 < 0.75", persona3.rcc_tabla)
        persona3.ccintura = 70
    assert_equal(0.78, persona3.relacion_cc)
    assert_equal("Moderado -- 0.75 < 0.78 < 0.82", persona3.rcc_tabla)
        persona3.ccintura = 74
    assert_equal(0.82, persona3.relacion_cc)
    assert_equal("Alto -- 0.82 > 0.82", persona3.rcc_tabla)

    persona3.sexo = 1
    persona3.ccintura = 68.0
    persona3.ccadera = 80.0
    assert_equal(0.85, persona3.relacion_cc)
    assert_equal( "Bajo -- 0.83 < 0.85 < 0.88", persona3.rcc_tabla)
        persona3.ccintura =  73.0
    assert_equal(0.91, persona3.relacion_cc)
    assert_equal("Moderado -- 0.88 < 0.91 < 0.95", persona3.rcc_tabla)
        persona3.ccintura = 77.0
    assert_equal(0.96, persona3.relacion_cc)
    assert_equal("Alto -- 0.95 < 0.96 < 1.01", persona3.rcc_tabla)
        persona3.ccintura = 85.0
    assert_equal(1.06, persona3.relacion_cc)
    assert_equal("Muy alto -- 1.06 > 1.01", persona3.rcc_tabla)


  end
end
