//
//  ViewController.swift
//  SocialSDKs_Swift
//
//  Created by wuweixin on 2019/4/12.
//  Copyright © 2019 wuweixin. All rights reserved.
//

import UIKit
//import WeChat
import ReducedWeChat
import Weibo

let kWeChatAppID = "wx9a22b1fd277b0f0c"
let kQQAppID = "101427822"
let kWeiboAppID = "2592529482"

enum SocialPlatform: Int {
    case unknown = 0
    case wechat = 1
    case weibo = 2
}

class ViewController: UIViewController {
    
    var platform: SocialPlatform = .unknown
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        WXApi.startLog(by: .detail, logDelegate: self)
        WXApi.registerApp(kWeChatAppID)
        
        WeiboSDK.enableDebugMode(true)
        WeiboSDK.registerApp(kWeiboAppID)
    }
    
    
    func handle(url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        switch platform {
        case .unknown: return true
        case .wechat: return WXApi.handleOpen(url, delegate: self)
        case .weibo: return WeiboSDK.handleOpen(url, delegate: self)
        }
    }
    
    
    @IBAction func openSocialApp(_ sender: UIButton) {
        guard let platform = SocialPlatform(rawValue: sender.tag) else { return }
        switch platform {
        case .wechat: WXApi.openWXApp()
        case .weibo: WeiboSDK.openWeiboApp()
        default: break
        }
    }
    
    @IBAction func shareToSocialApp(_ sender: UIButton) {
        guard let platform = SocialPlatform(rawValue: sender.tag) else { return }
        self.platform = platform
        switch platform {
        case .wechat:
            let req = SendMessageToWXReq()
            req.bText = false
            req.text = "测试测试测试"
            req.bText = true
            req.scene = Int32(WXSceneSession.rawValue)
            WXApi.send(req)
        case .weibo:
            let msgObj = WBMessageObject()
            msgObj.text = "测试测试测试"
            if let image = UIImage(named: "Test.jpg"),
                let imageData = image.jpegData(compressionQuality: 0.8) {
                let imageObj = WBImageObject()
                imageObj.imageData = imageData
                msgObj.imageObject = imageObj
            }
            let sendMsgRequest = WBSendMessageToWeiboRequest()
            sendMsgRequest.message = msgObj
            WeiboSDK.send(sendMsgRequest)
        default: break
        }
    }
}

extension ViewController: WXApiLogDelegate {
    func onLog(_ log: String, logLevel level: WXLogLevel) {
        print("Level(\(level)): \(log)")
    }
}

extension ViewController: WXApiDelegate {
    func onResp(_ resp: BaseResp) {
        switch WXErrCode(resp.errCode) {
        case WXSuccess: print("分享到微信成功")
        case WXErrCodeSentFail: print("分享到微信失败")
        case WXErrCodeUserCancel: print("分享到微信取消")
        default: break
        }
    }
}


extension ViewController: WeiboSDKDelegate {
    func didReceiveWeiboRequest(_ request: WBBaseRequest!) {
        
    }
    
    func didReceiveWeiboResponse(_ response: WBBaseResponse!) {
        guard let resp = response as? WBSendMessageToWeiboResponse else { return }
        switch resp.statusCode {
        case .success: print("分享成功")
        case .userCancel: print("分享取消")
        case .sentFail: print("分享失败")
        default: break
        }
    }
}
