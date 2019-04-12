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
//import TencentQQ

let kWeChatAppID = "wx9a22b1fd277b0f0c"
let kQQAppID = "101427822"
let kWeiboAppID = "2592529482"

enum SocialPlatform: Int {
    case unknown = 0
    case wechat = 1
    case weibo = 2
    case qq = 3
}

class ViewController: UIViewController {
    
    var platform: SocialPlatform = .unknown
    
//    var oauth: TencentOAuth?
    
    lazy var wechatHandler: WeChatHandler = WeChatHandler()
    lazy var weiboHandler: WeiboHandler = WeiboHandler()
//    lazy var qqHandler: TencentOpenAPIHandler = TencentOpenAPIHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        WXApi.startLog(by: .detail, logDelegate: WeChatHandler())
        WXApi.registerApp(kWeChatAppID)
        
        WeiboSDK.enableDebugMode(true)
        WeiboSDK.registerApp(kWeiboAppID)
        
//        self.oauth = TencentOAuth(appId: kQQAppID, andDelegate: qqHandler)
    }
    
    
    func handle(url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        switch platform {
        case .unknown: return true
        case .wechat: return WXApi.handleOpen(url, delegate: self.wechatHandler)
        case .weibo: return WeiboSDK.handleOpen(url, delegate: self.weiboHandler)
        case .qq: return true
//            let success = QQApiInterface.handleOpen(url, delegate: self.qqHandler)
//            if TencentOAuth.canHandleOpen(url) {
//                return TencentOAuth.handleOpen(url)
//            }
//            return success
        }
    }
    
    
    @IBAction func openSocialApp(_ sender: UIButton) {
        guard let platform = SocialPlatform(rawValue: sender.tag) else { return }
        switch platform {
        case .wechat: WXApi.openWXApp()
        case .weibo: WeiboSDK.openWeiboApp()
        case .qq: break
//            QQApiInterface.openQQ()
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
        case .qq:
//            let textObj = QQApiTextObject(text: "QQ互联测试")
//            let req = SendMessageToQQReq(content: textObj)
//            QQApiInterface.send(req)
            break
        default: break
        }
    }
}

final class WeChatHandler: NSObject, WXApiLogDelegate, WXApiDelegate {
    // MARK - WXApiLogDelegate
    func onLog(_ log: String, logLevel level: WXLogLevel) {
        print("Level(\(level)): \(log)")
    }
    
    // MARK - WXApiDelegate
    func onReq(_ req: BaseReq) { }
    
    func onResp(_ resp: BaseResp) {
        switch WXErrCode(resp.errCode) {
        case WXSuccess: print("分享到微信成功")
        case WXErrCodeSentFail: print("分享到微信失败")
        case WXErrCodeUserCancel: print("分享到微信取消")
        default: break
        }
    }
}


final class WeiboHandler: NSObject, WeiboSDKDelegate {
    func didReceiveWeiboRequest(_ request: WBBaseRequest!) { }
    
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

/*
final class TencentOpenAPIHandler: NSObject, TencentSessionDelegate, QQApiInterfaceDelegate {
    // MARK - TencentSessionDelegate
    func tencentDidLogin() {
        
    }
    
    func tencentDidNotLogin(_ cancelled: Bool) {
        
    }
    
    func tencentDidNotNetWork() {
        
    }
    
    // MARK - QQApiInterfaceDelegate
    func onReq(_ req: QQBaseReq!) {
        
    }
    
    func onResp(_ resp: QQBaseResp!) {
        print(resp.result)
    }
    
    func isOnlineResponse(_ response: [AnyHashable : Any]!) {
        print(response ?? [:])
    }
}
 */
