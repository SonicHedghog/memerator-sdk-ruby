Gem::Specification.new do |s|
  s.name = 'memerator'
  s.version = '0.1.1'
  s.summary = 'The Memerator.me API Library wrapper in Ruby'
  s.description = 'The Memerator.me API Library wrapper in Ruby.'
  s.authors = ['Chew', 'Memerator Developers']
  s.email = 'help@memerator.me'
  s.files = Dir['lib/**/*.rb',  'README.md']
  s.homepage = 'https://github.com/Memerator/memerator-sdk-ruby'
  s.license = 'MIT'
  s.add_runtime_dependency 'json', '~> 2.3.0'
  s.add_runtime_dependency 'rest-client', '~> 2.1.0'
  s.required_ruby_version = '>= 2.2.4'

  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/Memerator/memerator-sdk-ruby/issues',
    'changelog_uri' => 'https://github.com/Memerator/memerator-sdk-ruby/releases',
    'documentation_uri' => 'https://rubydocs.chew.pro/docs/memerator',
    'homepage_uri' => 'https://github.com/Memerator/memerator-sdk-ruby',
    'source_code_uri' => 'https://github.com/Memerator/memerator-sdk-ruby',
    'wiki_uri' => 'https://github.com/Memerator/memerator-sdk-ruby/wiki'
  }
end
