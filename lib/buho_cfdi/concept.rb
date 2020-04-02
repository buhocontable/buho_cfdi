module BuhoCfdi
  class Concept < BaseNode
    attr_accessor(
      :quantity,
      :code,
      :name,
      :code_prod_serv,
      :code_measure_unit,
      :price,
      :import
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
 

  end
end