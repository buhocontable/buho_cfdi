begin
  require "i18n"
rescue LoadError => e
  puts "The i18n gem is not available. Please add it to your Gemfile and run bundle install"
  raise e
end

I18n.load_path << File.expand_path("locale/es.yml", __dir__)
I18n.locale = :es