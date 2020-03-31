#!/usr/bin/ruby

require 'json'

class PodfileDependency
  private_class_method :new

  def self.resolve(podspec, config = nil, &block)
    model = JSON.parse %x( pod ipc spec #{podspec} )
    dependencies = model["dependencies"] || Hash.new

    subspec_list = model["subspecs"] || Array.new
    subspec_name = (config || Hash.new)[:subspec] || "unkown"
    subspec = subspec_list.detect { |e| (e["name"] || "") == subspec_name }
    subspec_dependencies = ((subspec || Hash.new)["dependencies"] || Hash.new)
    dependencies = dependencies.merge subspec_dependencies

    dependencies.each(&block)
  end
end
