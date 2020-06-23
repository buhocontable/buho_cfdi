module Nodes
  class PayrollExtraHours < ::BuhoCfdi::BaseNode
    attr_accessor(
      :days,               # Dias          -   required
      :hours_type,         # TipoHoras     -   required
      :extra_hour,         # HorasExtra    -   required
      :amount_paid         # ImportePagado -   required
    )

    validates_presence_of :days, :hours_type, :extra_hour, :amount_paid
  end
end