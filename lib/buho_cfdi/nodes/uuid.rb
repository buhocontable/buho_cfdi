module Nodes
  class Uuid < ::BuhoCfdi::BaseNode
    attr_accessor(
      :uuid,           # Fecha    -   required
    )

    validates_presence_of :uuid
  end
end