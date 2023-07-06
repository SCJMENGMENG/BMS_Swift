platform :ios, '11.0'

target 'BMS_Swift' do

use_frameworks!

inhibit_all_warnings!

pod "SnapKit"

end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
       end
    end
  end
end
