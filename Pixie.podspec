Pod::Spec.new do |s|
  s.name = 'Pixie'
  s.version = '1.3.12'
  s.summary = 'Set of tools that make your developer\'s life easier'
  s.homepage = 'https://github.com/gsagadyn/Pixie'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'iOS Team' => '' }
  s.source = { :git => 'https://github.com/gsagadyn/Pixie.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'

  s.source_files = 'Pixie/Pixie/Classes/**/*.{swift}'
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3']
end