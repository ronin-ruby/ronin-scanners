# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './tasks/spec.rb'
require './lib/ronin/scanners/version.rb'

Hoe.spec('ronin-scanners') do |p|
  p.rubyforge_name = 'ronin'
  p.developer('Postmodern', 'postmodern.mod3@gmail.com')
  p.remote_rdoc_dir = 'docs/ronin-scanners'
  p.extra_deps = [
    ['scandb', '>=0.1.3'],
    ['rprogram', '>=0.1.4'],
    ['ronin', '>=0.2.2']
  ]
end

# vim: syntax=Ruby
