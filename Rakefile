# -*- ruby -*-
require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/test_*.rb']
end

task :validate_protos do
  res = system("./scripts/validate_protos.rb")
  if !res
    raise "Couldn't load all protos"
  end
end

def proto_files
  Dir["lib/google/ads/google_ads/v*/**/*.rb"]
end

def newest_of(files)
  files.map { |fn| File.mtime(fn) }.max
end

def newest_proto_file
  newest_of(proto_files)
end

def factory_files
  ["lib/google/ads/google_ads/factories.rb"] + Dir["lib/google/ads/google_ads/factories/**/*.rb"]
end

def newest_factory_file
  newest_of(factory_files)
end

def factories_are_recent?
  return false unless File.exist?(factory_files.first)
  newest_factory_file > newest_proto_file
end

task :codegen => [:copy_third_party_code] do |t|
  `./scripts/codegen.sh` unless factories_are_recent?
end

task :copy_third_party_code do |t|
  `cp third_party/rspec/caller_filter.rb lib/google/ads/google_ads/deprecation.rb`
end

task :build => [:codegen, :validate_protos]
task :test => [:copy_third_party_code, :codegen]
