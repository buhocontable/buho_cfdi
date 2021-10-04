module Nodes
  class Payroll < ::BuhoCfdi::BaseNode
    attr_accessor(
      :version,                 # Version            -   required
      :payroll_type,            # TipoNomina         -   required
      :payment_date,            # FechaPago          -   required
      :payment_start_date,      # FechaInicialPago   -   required
      :payment_end_date,        # FechaFinalPago     -   required
      :number_days_paid,        # NumDiasPagados     -   required
      :total_perceptions,       # TotalPercepciones  -   optional
      :total_deductions,        # TotalDeducciones   -   optional
      :total_other_payments     # TotalOtrosPagos    -   optional
    )
 
    validates_presence_of(
      :version,
      :payroll_type,
      :payment_date,
      :payment_start_date,
      :payment_end_date,
      :number_days_paid, 
    )
  end
end