# Uncomment the next line to define a global platform for your project

# platform :ios, '11.0'

target 'First1' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for First1

     pod 'Alamofire', '~> 5.6.2'     
     pod 'SVGKit', '~> 3.0.0',:inhibit_warnings => true
     pod 'SnapKit','~> 5.6.0'
     pod 'HandyJSON', '~> 5.0.1'
     pod 'SDWebImage', '~> 5.14.1'
     pod 'SVProgressHUD', '~> 2.2.5'
     pod 'MJRefresh', '~> 3.7.5'
  target 'First1Tests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'First1UITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
        end
    end
end
