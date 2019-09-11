#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

Dir.glob("*.podspec").each do |name|
    if name.end_with? "Weibo.podspec"
        system "pod lib lint #{name} --include-podspecs=*WeiboSDKBundle.podspec --allow-warnings"
    else
        system "pod lib lint #{name} --allow-warnings"
    end
end
