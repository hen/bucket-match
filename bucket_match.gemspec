Gem::Specification.new do |s|

  s.name = %q{bucket_match}
  s.version = "0.0.1"
  s.authors     = ["Hen"]
  s.summary = %q{Match two groups of words together based on most commonly shared characters}
  s.files = [
    "lib/bucket_match.rb"
  ]

  s.add_runtime_dependency 'text', '~> 1.3'
  s.licenses    = ['MPL-2.0']
  s.homepage    = 'https://github.com/hen/bucket-match'

end
