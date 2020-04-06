module Nodes
  class CfdiRelated < ::BuhoCfdi::BaseNode
    attr_accessor(
      :relationship_type    # TipoRelacion - required
    )

    validates_presence_of :relationship_type
  end
end