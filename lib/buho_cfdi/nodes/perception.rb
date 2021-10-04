module Nodes
  class Perception < ::BuhoCfdi::BaseNode
    attr_accessor(
      :perception_type,                      # TipoPercepcion                   -   required
      :perception_key,                       # Clave                            -   required
      :concept,                              # Concepto                         -   required
      :amount_taxed,                         # ImporteGravado                   -   required
      :amount_exempt                         # ImporteExento                    -   required
    )

    validates_presence_of(
      :perception_type, 
      :perception_key,
      :concept,
      :amount_taxed,
      :amount_exempt
    )
  end
end