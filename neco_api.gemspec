# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{neco_api}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tyler Hunt"]
  s.date = %q{2009-08-31}
  s.email = %q{thunt@neco.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/neco_api.rb",
    "spec/neco_api_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/neco/neco_api}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{An API for accessing the NECO web services.}
  s.test_files = [
    "spec/neco_api_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<relax>, ["~> 0.1.3"])
      s.add_development_dependency(%q<jeweler>, ["~> 0.11.0"])
      s.add_development_dependency(%q<rspec>, ["~> 1.2.2"])
    else
      s.add_dependency(%q<relax>, ["~> 0.1.3"])
      s.add_dependency(%q<jeweler>, ["~> 0.11.0"])
      s.add_dependency(%q<rspec>, ["~> 1.2.2"])
    end
  else
    s.add_dependency(%q<relax>, ["~> 0.1.3"])
    s.add_dependency(%q<jeweler>, ["~> 0.11.0"])
    s.add_dependency(%q<rspec>, ["~> 1.2.2"])
  end
end
