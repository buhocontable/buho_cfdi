module Nodes
  class Related < ::BuhoCfdi::BaseNode
    attr_accessor(
      :uuid           # UUID - required
    )

    validates_presence_of :uuid
  end
end