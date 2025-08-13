module CfdiParamsHelper

  def cfdi_params
    {
      "receipt": {
        "version": "3.3",
        "serie": "shuhsuhsuhsw",
        "folio_number": "74777e8e8e",
        "date": "sjsjjsjs",
        "stamp": "jsjsjsjjs",
        "certificate_number": "osiskksj",
        "certificate": "jsjsjsjjsjs",
        "payment_conditions": "kjsksisosos",
        "subtotal": "jiksksksks",
        "discount": "jjjsjsjsjsj",
        "currency": "jsjksjdhdhd",
        "exchange_rate": "jsjsjdhdfhd",
        "total": "isjsxjdjf",
        "type_of_receipt": "jjsjsjjfd",
        "payment_method": "jjsjsjsjsd",
        "expedition_place": "jsjsjsjjs",
        "confirmation": "jjsjsjsjsjdjd",
        "cfdi_related_attributes": {
          "relationship_type": "jhususjujsujdius",
          "related_attributes": [
            {
              "uuid": "ijisjisjisjisjisj"
            }
          ]
        },
        "issuer_attributes": {
          "rfc": "hudshududhs",
          "name": "jdsjidjsijdi",
          "fiscal_regime": "jdisjdisjid"
        },
        "receiver_attributes": {
          "rfc": "jdisjdisj",
          "name": "jdsjdijsijds",
          "tax_residency": "udisjdisjidjisjd",
          "tax_identity_registration_number": "djisjdisjidjsidjis",
          "cfdi_usage": "disjdisidisdjs"
        },
        "concepts_attributes": [
          {
            "prod_or_svc_key": "",
            "identification_number": "",
            "quantity": "",
            "unit_measure_key": "",
            "unit_measure": "",
            "description": "",
            "unit_value": "",
            "amount": "",
            "discount": "",
            "transferred_attributes": [
              {
                "base": "yysysy",
                "tax": "uususuus",
                "factor_type": "sjisjijis",
                "rate_or_fee": "jsisjijsijs",
                "import": "jsijsijsij"
              }
            ],
            "detained_attributes": [
              {
                "base": "sjisjijsijs",
                "tax": "sjisjijsijsi",
                "factor_type": "sjijsijsijsi",
                "rate_or_fee": "ssijisjisj",
                "import": "sjijsisijisj"
              }
            ],
            "customs_information_attributes": {
              "requirement_number": ""
            },
            "property_account_attributes": {
              "number": ""
            },
            "part_attributes": {
              "prod_or_svc_key": "",
              "identification_number": "",
              "quantity": "",
              "unit_measure": "",
              "description": "",
              "unit_value": "",
              "amount": ""
            }
          }
        ],
        "taxes_attributes": {
          "total_taxes_transferred": "",
          "total_taxes_detained": "",
          "transferred_attributes": [
            {
              "tax": "",
              "factor_type": "",
              "rate_or_fee": "",
              "import": ""
            }
          ],
          "detained_attributes": [
            {
              "tax": "",
              "import": ""
            }
          ]
        }
      }
    }
  end

  def cancellation_params
    {
      "cancellation": {
        "date": "",
        "rfc": "",
        "uuid_attributes": [
          { "uuid": "" },
          { "uuid": "" },
          { "uuid": "" }
        ]
      }
    }
  end

  def payroll_params
    {
      "receipt": {
        "version": "3.3",
        "date": "2020-05-12T18:12:27",
        "payment_way": "01",
        "subtotal": "10000.00",
        "currency": "MXN",
        "total": "11600.00",
        "type_of_receipt": "I",
        "payment_method": "PUE",
        "expedition_place": "63700",
        "issuer_attributes": {
          "rfc": "EKU9003173C9",
          "name": "Escuela Kemper Urgate",
          "fiscal_regime": "601"
        },
        "receiver_attributes": {
          "rfc": "TIP180917FI0",
          "name": "Cliente Prueba SA de CV",
          "cfdi_usage": "G01"
        },
        "concepts_attributes": [
          {
            "prod_or_svc_key": "50151604",
            "identification_number": 5,
            "quantity": "1",
            "unit_measure_key": "KGM",
            "unit_measure": "Kilogramo",
            "description": "Producto prueba",
            "unit_value": "10000",
            "amount": "10000.00"
          }
        ],
        "payroll_attributes": {
          "version": "1.2",
          "payroll_type": "O",
          "payment_date": "2020-02-29",
          "payment_start_date": "2020-02-23",
          "payment_end_date": "2020-02-29",
          "number_days_paid": "7.600",
          "total_perceptions": "15988.00",
          "total_deductions": "3182.87",
          "total_other_payments": "286.85",
          "issuer_attributes": {
            "employer_registration": "Y7021761106"
          },
          "receiver_attributes": {
            "curp": "GAGE780522HCSLRD01",
            "imss": "59774652040",
            "start_date_employment_relationship": "1994-05-05",
            "antiquity": "P1347W",
            "contract_type": "01",
            "unionized": "No",
            "workday_shift": "01",
            "regime_type": "02",
            "employee_number": "5",
            "department": "PRODUCTO",
            "job": "AUXILIAR",
            "risk_class": "2",
            "payment_frequency": "02",
            "base_salary_contribution": "as",
            "integrated_daily_wage": "137.10",
            "federal_entity_key": "CAM"
          },
          "perceptions_attributes":{
            "total_salaries": "15988",
            "total_taxed": "15988",
            "total_exempt": "0",
            "perception_attributes": [
              {
                "perception_type": "001",
                "perception_key": "P001",
                "concept": "SUELDO",
                "amount_taxed": "988.00",
                "amount_exempt": "0.00"
              },
              {
                "perception_type": "028",
                "perception_key": "P002",
                "concept": "COMISIONES",
                "amount_taxed": "15000.00",
                "amount_exempt": "0.00"
              }
            ]
          },
          "deductions_attributes":{
            "total_other_deductions": "15988",
            "total_taxes_detained": "15988",
            "deduction_attributes": [
              {
                "deduction_type": "001",
                "deduction_key": "P001",
                "concept": "SUELDO",
                "amount": "988.00"
              },
              {
                "deduction_type": "001",
                "deduction_key": "P001",
                "concept": "SUELDO",
                "amount": "988.00"
              }
            ]
          },
          "other_payment_attributes": [
            {
              "other_payment_type": "001",
              "other_payment_key": "P001",
              "concept": "SUELDO",
              "amount": "988.00"
            },
            {
              "other_payment_type": "001",
              "other_payment_key": "P001",
              "concept": "SUELDO",
              "amount": "988.00"
            }
          ],
        }
      }
    }
  end

  def payment_complement_params
    {
      "receipt": {
        "version": "4.0",
        "folio_number": "2230",
        "date": "2024-09-18T16:22:13",
        "stamp": "test_stamp",
        "certificate_number": "00001000000700298879",
        "certificate": "test_certificate",
        "subtotal": "0",
        "currency": "XXX",
        "total": "0",
        "type_of_receipt": "P",
        "expedition_place": "72190",
        "export_code": "01",
        "issuer_attributes": {
          "rfc": "EKU9003173C9",
          "name": "MIGUEL ANGEL GUTIERREZ ROSALES",
          "fiscal_regime": "626"
        },
        "receiver_attributes": {
          "rfc": "CVA910402GI5",
          "name": "CASANOVA VALLEJO",
          "zip_code": "02300",
          "fiscal_regime": "601",
          "cfdi_usage": "CP01"
        },
        "concepts_attributes": [
          {
            "prod_or_svc_key": "84111506",
            "quantity": "1",
            "unit_measure_key": "ACT",
            "description": "Pago",
            "unit_value": "0",
            "amount": "0",
            "taxable_code": "01"
          }
        ],
        "payment_attributes": {
          "payment_date": "2024-09-18T16:26:18",
          "payment_form": "03",
          "currency": "MXN",
          "exchange_rate": "1",
          "amount": "23046.39",
          "totals": {
            "total_retained_isr": "251.05",
            "total_transferred_base_iva_16": "20084.00",
            "total_transferred_tax_iva_16": "3213.44",
            "total_payment_amount": "23046.39"
          },
          "related_docs": [
            {
              "uuid": "CE01CED3-EAE2-4C41-89D2-855758938DA8",
              "folio": "2155",
              "currency": "MXN",
              "exchange_rate": "1",
              "payment_number": "1",
              "previous_debt": "23046.39",
              "paid_amount": "23046.39",
              "new_debt": "0",
              "taxable_code": "02",
              "taxes": {
                "retentions": [
                  {
                    "base": "20084.000000",
                    "tax": "001",
                    "factor_type": "Tasa",
                    "rate_or_fee": "0.012500",
                    "import": "251.050000"
                  }
                ],
                "transfers": [
                  {
                    "base": "20084.000000",
                    "tax": "002",
                    "factor_type": "Tasa",
                    "rate_or_fee": "0.160000",
                    "import": "3213.440000"
                  }
                ]
              }
            }
          ],
          "taxes": {
            "retentions": [
              {
                "tax": "001",
                "import": "251.050000"
              }
            ],
            "transfers": [
              {
                "base": "20084.000000",
                "tax": "002",
                "factor_type": "Tasa",
                "rate_or_fee": "0.160000",
                "import": "3213.440000"
              }
            ]
          }
        }
      }
    }
  end

  def multiple_payment_retentions_params
    {
      "receipt": {
        "version": "4.0",
        "folio_number": "2230",
        "date": "2024-09-18T16:22:13",
        "stamp": "test_stamp",
        "certificate_number": "00001000000700298879",
        "certificate": "test_certificate",
        "subtotal": "0",
        "currency": "XXX",
        "total": "0",
        "type_of_receipt": "P",
        "expedition_place": "72190",
        "export_code": "01",
        "issuer_attributes": {
          "rfc": "EKU9003173C9",
          "name": "MIGUEL ANGEL GUTIERREZ ROSALES",
          "fiscal_regime": "626"
        },
        "receiver_attributes": {
          "rfc": "CVA910402GI5",
          "name": "CASANOVA VALLEJO",
          "zip_code": "02300",
          "fiscal_regime": "601",
          "cfdi_usage": "CP01"
        },
        "concepts_attributes": [
          {
            "prod_or_svc_key": "84111506",
            "quantity": "1",
            "unit_measure_key": "ACT",
            "description": "Pago",
            "unit_value": "0",
            "amount": "0",
            "taxable_code": "01"
          }
        ],
        "payment_attributes": {
          "payment_date": "2024-09-18T16:26:18",
          "payment_form": "03",
          "currency": "MXN",
          "exchange_rate": "1",
          "amount": "23046.39",
          "totals": {
            "total_retained_isr": "451.05",
            "total_retained_iva": "200.00",
            "total_transferred_base_iva_16": "20084.00",
            "total_transferred_tax_iva_16": "3213.44",
            "total_payment_amount": "23046.39"
          },
          "related_docs": [
            {
              "uuid": "CE01CED3-EAE2-4C41-89D2-855758938DA8",
              "folio": "2155",
              "currency": "MXN",
              "exchange_rate": "1",
              "payment_number": "1",
              "previous_debt": "23046.39",
              "paid_amount": "23046.39",
              "new_debt": "0",
              "taxable_code": "02",
              "taxes": {
                "retentions": [
                  {
                    "base": "20084.000000",
                    "tax": "001",
                    "factor_type": "Tasa",
                    "rate_or_fee": "0.012500",
                    "import": "251.050000"
                  }
                ],
                "transfers": [
                  {
                    "base": "20084.000000",
                    "tax": "002",
                    "factor_type": "Tasa",
                    "rate_or_fee": "0.160000",
                    "import": "3213.440000"
                  }
                ]
              }
            }
          ],
          "taxes": {
            "retentions": [
              {
                "tax": "001",
                "import": "251.050000"
              },
              {
                "tax": "002",
                "import": "200.000000"
              }
            ],
            "transfers": [
              {
                "base": "20084.000000",
                "tax": "002",
                "factor_type": "Tasa",
                "rate_or_fee": "0.160000",
                "import": "3213.440000"
              }
            ]
          }
        }
      }
    }
  end
end
