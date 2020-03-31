#!/usr/bin/ruby

require 'cocoapods'

def generate_xcodeproj()
    Pod::UI.puts "Generating xcodeproj file"
    print(`xcodegen -q -s .project.yml`)
end

generate_xcodeproj
