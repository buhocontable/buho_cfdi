module Nodes
  class PayrollReceiver < ::BuhoCfdi::BaseNode
    attr_accessor(
      :curp,                                # Curp                   -   required
      :imss,                                # NumSeguridadSocial     -   optional
      :start_date_employment_relationship,  # FechaInicioRelLaboral  -   optional
      :antiquity,                           # Antigüedad             -   required
      :contract_type,                       # TipoContrato           -   required
      :unionized,                           # Sindicalizado          -   required
      :workday_shift,                       # TipoJornada            -   required
      :regime_type,                         # TipoRegimen            -   required
      :employee_number,                     # NumEmpleado            -   required
      :department,                          # Departamento           -   required
      :job,                                 # Puesto                 -   required
      :risk_class,                          # RiesgoPuesto           -   required
      :payment_frequency,                   # PeriodicidadPago       -   required
      :bank,                                # Banco                  -   optional
      :bank_account,                        # CuentaBancaria         -   optional
      :base_salary_contribution,            # SalarioBaseCotApor     -   required
      :integrated_daily_wage,               # SalarioDiarioIntegrado -   required
      :federal_entity_key,                  # ClaveEntFed            -   required
    )

    validates_presence_of(
      :curp, 
      :imss,
      :start_date_employment_relationship,
      :antiquity,
      :contract_type,
      :unionized,
      :workday_shift,
      :regime_type,
      :employee_number,
      :job,
      :risk_class,
      :payment_frequency,
      :base_salary_contribution,
      :integrated_daily_wage,
      :federal_entity_key,
    )
  end
end