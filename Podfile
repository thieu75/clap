# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Clap' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Clap
  pod 'Firebase/Database'
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Gloss', '~> 1.1'
  pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher.git', :tag => '3.0.1'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

  target 'ClapTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ClapUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
