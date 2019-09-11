Pod::Spec.new do |s|
    s.name             = 'SocialSDKs_Swift_Weibo'
    s.version          = '0.1.0'
    s.summary          = '微博原生SDK动态库'
    s.description      = '基于微博SDK_v3.2.4动态库封装'

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
    s.frameworks   = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony'
    s.libraries = 'sqlite3', 'z'
    
    s.source_files = 'Weibo/source/**/*'
    s.vendored_libraries = 'Weibo/lib/libWeiboSDK.a'
    s.module_map = 'Weibo/source/module.modulemap'

    s.dependency 'SocialSDKs_Swift_WeiboSDKBundle', '~> 0.1.0'
end
