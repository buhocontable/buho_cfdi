lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "buho_cfdi/version"

Gem::Specification.new do |spec|
  spec.name          = "buho_cfdi"
  spec.version       = BuhoCfdi::VERSION
  spec.authors       = ["Armando Alejandre", "Pablo Icaza", "Oscar Cocom"]
  spec.email         = ["armando1339@gmail.com", "pablo@buhocontable.com", "oscar@buhocontable.com"]

  spec.summary       = %q{CFDI generator for 3.3 version.}
  spec.description   = %q{CFDI generator for 3.3 version.}
  spec.homepage      = "https://buhocontable.com/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/buhocontable/buho_cfdi"
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", "~> 6.1.4.1"
  spec.add_dependency "nokogiri", "~> 1.6", ">= 1.6.8"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "shoulda-matchers", "~> 4.3"
  spec.add_development_dependency "pry", "~> 0.13.0"
end
