Pod::Spec.new do |s|
    s.name             = 'SocialSDKs_Swift_WeiboSDKBundle'
    s.version          = '0.1.0'
    s.summary          = 'WeiboSDK.bundle'
    s.description      = '原生WebiSDK的资源捆绑包，配合SocialSDKs_Swift_Weibo使用'

    s.homepage         = 'https://github.com/WessonWu/SocialSDKs_Swift'
    s.license          = 'MIT'
    s.author           = { 'wessonwu' => 'wessonwu94@gmail.com' }
    s.source           = { :git => 'https://github.com/WessonWu/SocialSDKs_Swift.git',
                           :tag => s.version.to_s }

    s.ios.deployment_target = '8.0'
    s.resource = 'Weibo/asset/WeiboSDK.bundle'
end
