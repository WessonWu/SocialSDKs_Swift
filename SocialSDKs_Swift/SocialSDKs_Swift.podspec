Pod::Spec.new do |s|
    s.name             = 'SocialSDKs_Swift'
    s.version          = '0.1.0'
    s.summary          = '微信和微博原生SDK动态库'
    s.description      = <<-DESC
                                微信SDK_1.8.4、微博SDK_3.2.3动态库封装
                            DESC

    s.homepage         = 'https://github.com/WessonWu/SocialSDKs_Swift'
    s.license          = { :type => 'MIT', :text => <<-LICENSE
                                Copyright (c) 2019 WessonWu <wessonwu94@gmail.com>
                            LICENSE
    }
    s.author           = { 'wessonwu' => 'wessonwu94@gmail.com' }
    s.source           = { :http => 'http://files-1251841180.cosgz.myqcloud.com/SocialSDKs_V_0_1_0.zip' }

    s.ios.deployment_target = '8.0'
    
    s.subspec 'ReducedWeChat' do |sp|
        sp.vendored_frameworks = 'SocialSDKs_V_0_1_0/ReducedWeChat.framework'
    end
    
    s.subspec 'WeChat' do |sp|
        sp.vendored_frameworks = 'SocialSDKs_V_0_1_0/WeChat.framework'
    end
    
    s.subspec 'Weibo' do |sp|
        sp.resource = 'SocialSDKs_V_0_1_0/WeiboSDK.bundle'
        sp.vendored_frameworks = 'SocialSDKs_V_0_1_0/Weibo.framework'
    end
end
