module Nodes
  class Taxes < ::BuhoCfdi::BaseNode
    attr_accessor(
      :total_taxes_transferred,         # TotalImpuestosTrasladados     -   optional
      :total_taxes_detained             # TotalImpuestosRetenidos       -   optional
    )
  end
end