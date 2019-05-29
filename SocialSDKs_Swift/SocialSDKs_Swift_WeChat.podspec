Pod::Spec.new do |s|
    s.name             = 'SocialSDKs_Swift_WeChat'
    s.version          = '0.1.0'
    s.summary          = '微信原生SDK动态库'
    s.description      = <<-DESC
                                微信SDK_1.8.4动态库封装
                            DESC

    s.homepage         = 'https://github.com/WessonWu/SocialSDKs_Swift'
    s.license          = { :type => 'MIT', :text => <<-LICENSE
                                Copyright (c) 2019 WessonWu <wessonwu94@gmail.com>
                            LICENSE
    }
    s.author           = { 'wessonwu' => 'wessonwu94@gmail.com' }
    s.source           = { :git => 'https://github.com/WessonWu/SocialSDKs_Swift.git',
                           :tag => s.version.to_s }

    s.ios.deployment_target = '8.0'
    
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
    s.frameworks = 'UIKit', 'Foundation', 'Security', 'CFNetwork', 'SystemConfiguration', 'CoreTelephony', 'CoreGraphics'
    s.libraries = 'c++', 'sqlite3.0', 'z'
    
    s.source_files = 'WeChat/source/**/*'
    s.vendored_libraries = 'WeChat/lib/libWeChatSDK.a'
    s.module_map = 'WeChat/source/module.modulemap'
end
