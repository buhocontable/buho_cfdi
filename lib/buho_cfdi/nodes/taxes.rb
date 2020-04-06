module Nodes
  class Taxes < ::BuhoCfdi::BaseNode
    attr_accessor(
      :total_taxes_transferred,         # ClaveProdServ     -   optional
      :total_taxes_detained             # NoIdentificacion  -   optional
    )
  end
end