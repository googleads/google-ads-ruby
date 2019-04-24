require "active_support"
require "active_support/core_ext"
require "erb"

def render_template(template, target, variables)
  rendered = ERB.new(File.read(template)).result_with_hash(variables)
  File.open(target, "w") do |fp|
    fp.write(rendered)
  end
  nil
end
