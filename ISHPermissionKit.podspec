Pod::Spec.new do |s|

  s.name         = 'ISHPermissionKit'
  s.version      = '1.1.0'
  s.summary      = 'A polite and unified way of asking for permission on iOS.'
  s.description  = 'This framework provides a unified way of asking for user permissions on iOS. It also 
                    provides UI to explain the permission requirements before presenting the system
                    permission dialog to the user. This allows the developer to postpone the system dialog. The framework 
                    provides no actual chrome, leaving the developer and designer in charge of creating the views.'

  s.homepage     = 'https://github.com/iosphere/ISHPermissionKit.git'
  s.screenshots  = 'https://raw.githubusercontent.com/iosphere/ISHPermissionKit/master/assets/demo.gif'

  s.license      = 'New BSD'   
  s.authors      = { 'Felix Lamouroux' => 'felix@iosphere.de' }

  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/iosphere/ISHPermissionKit.git', :tag => s.version.to_s }
  s.module_name = 'ISHPermissionKit'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files         = 'ISHPermissionKit/**/*.{h,m}'
    core.private_header_files = 'ISHPermissionKit/Private/**/*.h'
    core.pod_target_xcconfig  = { 'OTHER_LDFLAGS' => '-ObjC' }
    core.requires_arc         = true
  end

  s.subspec 'Health' do |health|
   health.dependency 'ISHPermissionKit/Core'

   health.weak_framework       = 'HealthKit'
   health.pod_target_xcconfig  = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ISHPermissionRequestHealthKitEnabled' }
  end

end
