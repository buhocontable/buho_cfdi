module CfdiParamsHelper

  def cfdi_params
    {
      "receipt": {
        "version": "3.3",
        "serie": "shuhsuhsuhsw",
        "folio_number": "74777e8e8e",
        "date": "sjsjjsjs",
        "stamp": "jsjsjsjjs",
        "payment_method": "ikskskskis",
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
            "social_security_number": "59774652040",
            "start_date_employment_relationship": "1994-05-05",
            "antiquity": "P1347W",
            "contract_type": "01",
            "unionized": "No",
            "workday_type": "01",
            "regimen_type": "02",
            "employee_number": "5",
            "department": "PRODUCTO",
            "job": "AUXILIAR",
            "risk_position": "2",
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

end