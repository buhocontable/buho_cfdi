module Nodes
  class PaymentRetention < ::BuhoCfdi::BaseNode
    attr_accessor(
      :tax,               # ImpuestoP     -   required
      :import,            # ImporteP      -   required
    )

    validates_presence_of :tax, :import
  end
end
