source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'ContentFlowDemo' do
    pod 'AsyncDisplayKit', :git => 'https://github.com/facebook/AsyncDisplayKit.git', :branch => 'master'
    pod 'PagingMenuController', '1.2.0'
    pod 'Reveal-SDK', :configurations => ['Debug']
end

## Xcode 8 support
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '2.3'
        end
    end
end


