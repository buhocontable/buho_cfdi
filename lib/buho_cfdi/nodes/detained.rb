module Nodes
  class Detained < ::BuhoCfdi::BaseNode
    attr_accessor(
      :tax,           # Impuesto    -   required
      :import         # Importe     -   required
    )

    validates_presence_of :tax, :import
  end
end