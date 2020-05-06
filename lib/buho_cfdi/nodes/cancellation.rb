module Nodes
  class Cancellation < ::BuhoCfdi::BaseNode
    attr_accessor(
      :date,           # Fecha    -   required
      :rfc             # Rfc emisor    -   required
    )

    validates_presence_of :date, :rfc
  end
end