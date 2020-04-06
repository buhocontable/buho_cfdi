module Nodes
  class CustomsInformation < ::BuhoCfdi::BaseNode
    attr_accessor(
      :requirement_number   # NumeroPedimento - required
    )

    validates_presence_of :requirement_number
  end
end