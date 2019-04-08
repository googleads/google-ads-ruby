# -*- ruby -*-
require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/test_*.rb']
end

def apply_patches
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

task :apply_patches do |t|
  apply_patches
end

task :build => :apply_patches
