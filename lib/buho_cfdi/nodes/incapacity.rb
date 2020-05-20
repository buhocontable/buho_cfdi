module Nodes
  class Incapacity < ::BuhoCfdi::BaseNode
    attr_accessor(
      :days_disability,                      # DiasIncapacidad   -   required
      :incapacity_type,                      # TipoIncapacidad   -   required
      :monetary_amount                       # ImporteMonetario   -   required
    )

    validates_presence_of(
      :days_disability,
      :incapacity_type,
      :monetary_amount 
    )
  end
end