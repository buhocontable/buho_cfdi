module Nodes
  class GlobalInfo < ::BuhoCfdi::BaseNode
    attr_accessor(
      :periodicity,   # Periodicidad   -   required
      :months,        # Meses          -   required
      :year           # Año            -   required
    )

    validates_presence_of :periodicity, :months:, :year
  end
end