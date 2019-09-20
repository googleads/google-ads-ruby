# -*- ruby -*-
require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/test_*.rb']
end

def apply_patches
  clean = system(<<~EOD)
  bash -c 'if [ -z "$(git status --porcelain)" ]; then exit 0; else exit 1; fi'
  EOD

  raise "Working directory is not clean" unless clean

  patches = Dir["patches/*.patch"]
  patches.each do |patch|
    puts "PATCH #{patch}"
    res = system("git apply #{patch}")
    if res
      `git add -u`
      `git commit -m 'Applying #{patch} for v#{Google::Ads::GoogleAds::CLIENT_LIB_VERSION} release'`
    else
      puts "FAIL #{patch}: may not be a big deal because already applied or no longer needed"
    end
  end
end

task :validate_protos do
  res = system("./scripts/validate_protos.rb")
  if !res
    raise "Couldn't load all protos"
  end
end

task :apply_patches do |t|
  apply_patches
end

def proto_files
  Dir["lib/google/ads/google_ads/v1/**/*.rb"]
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

task :codegen => [:apply_patches, :copy_third_party_code] do |t|
  `./scripts/codegen.sh` unless factories_are_recent?
end

task :copy_third_party_code do |t|
  `cp third_party/rspec/caller_filter.rb lib/google/ads/google_ads/deprecation.rb`
end

task :build => [:codegen, :validate_protos]
task :test => [:copy_third_party_code, :codegen]
