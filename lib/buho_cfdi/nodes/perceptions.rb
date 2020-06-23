module Nodes
  class Perceptions < ::BuhoCfdi::BaseNode
    attr_accessor(
      :total_salaries,                      # TotalSueldos                     -   required
      :total_separation_compensation,       # TotalSeparacionIndemnizacion     -   optional
      :total_retirement_pension,            # TotalJubilacionPensionRetiro     -   optional
      :total_taxed,                         # TotalGravado                     -   required
      :total_exempt                         # TotalExento                      -   required
    )

    validates_presence_of(
      :total_salaries,
      :total_taxed,
      :total_exempt
    )
  end
end