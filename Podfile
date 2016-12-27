# Uncomment this line to define a global platform for your project
platform :ios, '8.0'
# Uncomment this line if you're using Swift
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'InternMail' do
    pod 'SDWebImage'
    pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire'
    pod 'KMPlaceholderTextView', '~> 1.3.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

