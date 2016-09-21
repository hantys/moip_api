Gem::Specification.new do |spec|
	spec.name          = "moip-sandbox"
	spec.version       = "0.0.1"
	spec.authors       = ["Renato Filho"]
	spec.email         = ["renatosousafilho@gmail.com"]
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
end