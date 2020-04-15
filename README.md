# BuhoCfdi

CFDI generator for 3.3 version.

[![Build Status](https://travis-ci.com/buhocontable/buho_cfdi.svg?token=pvfqse1g1Y1nVGRwY4DL&branch=master)](https://travis-ci.com/buhocontable/buho_cfdi) [![Coverage Status](https://coveralls.io/repos/github/buhocontable/buho_cfdi/badge.svg?branch=master)](https://coveralls.io/github/buhocontable/buho_cfdi?branch=master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'buho_cfdi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install buho_cfdi

## Usage

Create an instance of `BuhoCfdi::XmlProcessor` and pass to it the params.

```ruby
buho = BuhoCfdi::XmlProcessor.new(params)
```

Then process the xml with the params. `buho` var has all necesary info to create a xml schema. Execute the instance method `#process_xml` that will create a `#cfdi` instance method with all info needed about the cfdi and the xml.

```ruby

# => Execute the instance method
buho.process_xml

# => Access to cfdi object was created
buho.cfdi

```

To access to the XML string.

```ruby

# =>
buho.cfdi.to_xml

```

## Params Examples

Format:

```ruby
params = {
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
        },
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
    }
  }
}
```

## Development

To install this gem onto your local machine, run `bundle exec rake build` and `bundle exec rake install`. You can also run `irb` for an interactive prompt that will allow you to experiment.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug report or pull request are welcome. Make a pull request:

- Clone the repo
- Create a new feature branch
- Commit your changes
- Push the new branch
- Create new pull-request

Please write tests if necessary.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
