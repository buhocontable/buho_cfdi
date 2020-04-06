module Nodes
  class Concept < ::BuhoCfdi::BaseNode
    attr_accessor(
      :prod_or_svc_key,         # ClaveProdServ     -   required
      :identification_number,   # NoIdentificacion  -   optional
      :quantity,                # Cantidad          -   required
      :unit_measure_key,        # ClaveUnidad       -   required
      :unit_measure,            # Unidad            -   optional
      :description,             # Descripcion       -   required
      :unit_value,              # ValorUnitario     -   required
      :amount,                  # Importe           -   required
      :discount                 # Descuento         -   optional
    )
 
    validates_presence_of(
      :prod_or_svc_key,
      :quantity,
      :unit_measure_key,
      :description,
      :unit_value,
      :amount
    )
  end
end