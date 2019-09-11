Pod::Spec.new do |s|
    s.name             = 'SocialSDKs_Swift_ReducedWeChat'
    s.version          = '0.1.0'
    s.summary          = '微信原生SDK(无支付)动态库'
    s.description      = '基于WeChatSDK1.8.5_NoPay(不包含支付功能)动态库封装'

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
    
    s.source_files = 'ReducedWeChat/source/**/*'
    s.vendored_libraries = 'ReducedWeChat/lib/libWeChatSDK.a'
    s.module_map = 'ReducedWeChat/source/module.modulemap'
end
