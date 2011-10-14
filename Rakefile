require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "resumerb"
  gem.homepage = "http://github.com/mwylde/resume.rb"
  gem.license = "MIT"
  gem.summary = %Q{Generates resumes in HTML and PDF (via LaTeX)}
  gem.description = %Q{Resume provides a DSL for defining resume data, which can be rendered via various backends (currently LaTeX, plain text, Markdown and HTML).}
  gem.email = "micah@micahw.com"
  gem.authors = ["Micah Wylde"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency 'erubis', '> 2.6.5'
  gem.add_runtime_dependency 'redcarpet', '~> 2.0.0b5'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
