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
    `git apply #{patch}`
    `git add -u`
    `git commit -m 'Applying #{patch} for v#{Google::Ads::GoogleAds::VERSION} release'`
  end
end

task :apply_patches do |t|
  apply_patches
end

task :build => :apply_patches
