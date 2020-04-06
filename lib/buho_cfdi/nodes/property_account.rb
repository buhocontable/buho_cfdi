module Nodes
  class PropertyAccount < ::BuhoCfdi::BaseNode
    attr_accessor(
      :number     # Numero - required
    )

    validates_presence_of :number
  end
end