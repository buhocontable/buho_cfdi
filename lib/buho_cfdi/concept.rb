module BuhoCfdi
  class Concept < BaseNode
    attr_accessor(
      :quantity,
      :code,
      :name,
      :code_prod_serv,
      :code_measure_unit,
      :price,
      :import,
      :taxes,
    )
 

    validates_presence_of(
      :quantity,
      :code,
      :name,
      :code_prod_serv,
      :code_measure_unit,
      :price,
      :import
    )

    def initialize(params = {})
      super
      @taxes = Taxes.new
    end
 
    def taxes=(data) 
        data.is_a?(Taxes) ? data : Taxes.new(data)
        @taxes = data
    end

    def to_x
      {
        ClaveProdServ: @code_prod_serv,
        Cantidad: @quantity,
        ClaveUnidad: @code_measure_unit, 
        Descripcion: @name, 
        ValorUnitario: @price,
        Importe: @import
      }
    end

  end
end