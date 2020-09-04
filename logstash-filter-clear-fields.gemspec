Gem::Specification.new do |s|
  s.name          = 'logstash-filter-clear-fields'
  s.version       = '0.1.0'
  s.licenses      = ['Apache-2.0']
  s.summary       = 'logstash filter, remove all fields from the event'
  s.description   = 'logstash filter, remove all fields from the event'
  s.homepage      = 'https://github.com/zoech/logstash-plugin-clear-fields'
  s.authors       = ['eee']
  s.email         = '19802021272@139.com'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 2.0"
  s.add_development_dependency 'logstash-devutils'
end
