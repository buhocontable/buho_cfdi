module Nodes
  class Uuid < ::BuhoCfdi::BaseNode
    attr_accessor(
      :uuid,                    # UUID    -   required
      :reason,                  # string  -   required
      :replacement_uuid         # string  -   required
    )

    validates_presence_of :uuid
    validates_presence_of :reason
  end
end
