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

task :codegen do |t|
  `./scripts/codegen.sh`
end

task :copy_third_party_code do |t|
  `cp third_party/rspec/caller_filter.rb lib/google/ads/google_ads/deprecation.rb`
end

task :build => [:apply_patches, :copy_third_party_code, :codegen, :validate_protos]
task :test => [:copy_third_party_code, :codegen]
