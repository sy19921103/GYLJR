# Encoding of the source code

platform :ios, '8.0' 
use_frameworks!
target "GYLJR-Swift" do

pod 'SnapKit'
pod ‘RNCryptor’
pod ‘Kingfisher’

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'Kingfisher'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
            end
        end
    end
end


