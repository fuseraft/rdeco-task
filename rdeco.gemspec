# rdeco-task.gemspec
Gem::Specification.new do |spec|
  spec.name = "rdeco-task"
  spec.version = "0.1.0"
  spec.authors = ["Scott Stauffer"]
  spec.email = ["scott@fuseraft.com"]
  spec.summary = "A RubyGem for the Rdeco::Task module"
  spec.description = "A RubyGem that provides metaprogramming attributes for task execution in a specified order."
  spec.license = "MIT"
  spec.homepage = "https://github.com/fuseraft/rdeco-task"
  spec.metadata["source_code_uri"] = "https://github.com/fuseraft/rdeco-task"
  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.7"
  spec.add_development_dependency "rspec", ">= 3.0"
  spec.test_files = Dir["spec/**/*"]
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = "https://github.com/fuseraft/rdeco-task"
end
