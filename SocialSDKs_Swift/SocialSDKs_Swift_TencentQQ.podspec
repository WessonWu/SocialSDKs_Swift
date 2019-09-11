Pod::Spec.new do |s|
    s.name             = 'SocialSDKs_Swift_TencentQQ'
    s.version          = '0.1.0'
    s.summary          = 'QQ互联平台原生SDK动态库'
    s.description      = '基于QQ互联SDK(V3.3.6)动态库封装 (使用UniversalLink方案进行登录分享校验)'

    s.homepage         = 'https://github.com/WessonWu/SocialSDKs_Swift'
    s.license          = { :type => 'MIT', :text => <<-LICENSE
                                Copyright (c) 2019 WessonWu <wessonwu94@gmail.com>
                            LICENSE
    }
    s.author           = { 'wessonwu' => 'wessonwu94@gmail.com' }
    s.source           = { :git => 'https://github.com/WessonWu/SocialSDKs_Swift.git',
                           :tag => s.version.to_s }

    s.ios.deployment_target = '8.0'
    
    s.frameworks = 'SystemConfiguration', 'WebKit'
    s.vendored_frameworks = 'TencentQQ/vendor/TencentOpenAPI.framework'
    
    s.source_files = 'TencentQQ/source/**/*'
    s.module_map = 'TencentQQ/source/module.modulemap'
end
