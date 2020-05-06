module Nodes
  class Uuid < ::BuhoCfdi::BaseNode
    attr_accessor(
      :uuid,           # UUID    -   required
    )

    validates_presence_of :uuid
  end
end