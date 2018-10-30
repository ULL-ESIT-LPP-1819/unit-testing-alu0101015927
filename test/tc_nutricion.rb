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
    assert_equal(0.9, @persona1.relacion_cc)
    assert_equal("Alto -- 0.9 > 0.82", @persona1.rcc_tabla)

  end
end
