DIR = File.dirname(__FILE__)
GEM_ROOT = File.expand_path("..", DIR)
$: << DIR

require 'src/rendering'

library_version = ARGV[0]
all_api_versions = ARGV[1].split(",")
default_api_version = ARGV[2]

puts library_version
puts all_api_versions
puts default_api_version

gads_dir = File.join(GEM_ROOT, "lib", "google", "ads", "google_ads")
render_template(
  File.join(DIR, "templates", "version.rb.erb"),
  File.join(gads_dir, "version.rb"),
  {library_version: library_version}
)

render_template(
  File.join(DIR, "templates", "api_versions.rb.erb"),
  File.join(gads_dir, "api_versions.rb"),
  {
    all_api_versions: all_api_versions.map {|v| ":V#{v}"}.join(", "),
    default_api_version: ":V#{default_api_version}",
  }
)

utils_dir = File.join(gads_dir, "utils")
all_api_versions.each do |version|
  path_util_dir = File.join(utils_dir, "v#{version}")
  render_template(
    File.join(DIR, "templates", "path_lookup_util.rb.erb"),
    File.join(path_util_dir, "path_lookup_util.rb"),
    { version: "V#{version}" }
  )
end
