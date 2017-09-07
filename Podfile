# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'Loggit' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Loggit
  pod 'SwiftyJSON'
  pod 'Alamofire'
  pod 'RxAlamofire'
  pod 'RealmSwift'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Action'
  pod 'Kingfisher'

  target 'LoggitTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxTest'
    pod 'RxBlocking'
  end

  target 'LoggitUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

# enable tracing resources
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'RxSwift'
      target.build_configurations.each do |config|
        if config.name == 'Debug'
          config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D',
          'TRACE_RESOURCES']
        end
      end
    end
  end
end
