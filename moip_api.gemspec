lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
	spec.name          = "moip_api"
	spec.version       = Moip::VERSION
	spec.authors       = ["Renato Filho", "Pedro Fausto"]
	spec.email         = ["renatosousafilho@gmail.com", "pedro.fausto@hotmail.com"]
	spec.summary       = %q{Cliente ruby para api v1 moip}
	spec.description   = %q{Cliente ruby para api v1 moip}
	spec.homepage      = ""
	spec.license       = "MIT"

	spec.files         = `git ls-files`.split($/)
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})


	spec.require_paths = ["lib"]

	spec.add_dependency "httparty"
	spec.add_dependency "active_data"
	spec.add_dependency "recursive-open-struct"

	spec.add_development_dependency "bundler"
	spec.add_development_dependency "rake"
	spec.add_development_dependency "rspec"
	spec.add_development_dependency "pry"


end
