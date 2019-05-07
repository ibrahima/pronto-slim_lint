# -*- encoding: utf-8 -*-
#
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'pronto/slim_lint/version'
require 'English'

Gem::Specification.new do |s|
  s.name = 'pronto-slim_lint'
  s.version = Pronto::SlimLintVersion::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'Ibrahim Awwal'
  s.email = 'ibrahim.awwal@gmail.com'
  s.homepage = 'https://github.com/ibrahima/pronto-slim_lint'
  s.summary = <<-EOF
    Pronto runner for Slim-lint, linting utility for Slim templates
  EOF

  s.licenses = ['MIT']
  s.required_ruby_version = '>= 2.0.0'

  s.files = `git ls-files`.split($RS).reject do |file|
    file =~ %r{^(?:
    spec/.*
    |Gemfile
    |Rakefile
    |\.rspec
    |\.gitignore
    |\.rubocop.yml
    |\.travis.yml
    )$}x
  end
  s.test_files = []
  s.extra_rdoc_files = ['LICENSE', 'README.md']
  s.require_paths = ['lib']

  s.add_dependency('pronto', '~> 0.9.0')
  s.add_dependency('slim_lint', '~> 0.17.0')
  s.add_development_dependency('rake', '~> 11.0')
  s.add_development_dependency('rspec', '~> 3.4')
  s.add_development_dependency('rspec-its', '~> 1.2')
end
