module Nodes
  class Part < ::BuhoCfdi::BaseNode
    attr_accessor(
      :prod_or_svc_key,         # ClaveProdServ     -   required
      :identification_number,   # NoIdentificacion  -   optional
      :quantity,                # Cantidad          -   required
      :unit_measure,            # Unidad            -   optional
      :description,             # Descripcion       -   required
      :unit_value,              # ValorUnitario     -   optional
      :amount                   # Importe           -   optional
    )
 
    validates_presence_of(
      :prod_or_svc_key,
      :quantity,
      :description
    )
  end
end