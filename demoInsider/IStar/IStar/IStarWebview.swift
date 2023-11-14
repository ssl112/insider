//
//  IStar.swift
//  IStar
//
//  Created by Admin on 5.11.2023.
//

import UIKit
import WebKit
import UserNotifications

public class IStarWebview:UIView, IStarWebViewProtocol, WKNavigationDelegate {
    var webView: WKWebView!
    public weak var delegate: IStarDelegate?
    var starList:[StarModel] = []

    public override init(frame: CGRect) {
        super.init(frame: frame)
        //create webview
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), configuration: webConfiguration)
        webView.navigationDelegate = self
  
        let htmlString = """
         <html>
            <body>
                <img style="width:100%;"
            src="\(Constants.shared.webviewURL)" />
            </body>
        </html>
        """
    
        webView.loadHTMLString(htmlString, baseURL: nil)
        addSubview(webView)
        
        requestNotificationPermission()
        listenAppStates()
    }
    
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Page load error: \(error.localizedDescription)")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension IStarWebview {//init buttons and other objects flow
    
    public func addStarInterface() {//add all buttons
        let smallStarButton = UIButton(type: .system)
        smallStarButton.setTitle("Small Star", for: .normal)
        smallStarButton.addTarget(self, action: #selector(smallStarButtonClick), for: .touchUpInside)
        smallStarButton.frame = CGRect(x: 20, y: frame.height - 60, width: 100, height: 40)
        
        let bigStarButton = UIButton(type: .system)
        bigStarButton.setTitle("Big Star", for: .normal)
        bigStarButton.addTarget(self, action: #selector(bigStarButtonClick), for: .touchUpInside)
        bigStarButton.frame = CGRect(x: 20, y: frame.height - 120, width: 100, height: 40)
    
        let resetButton = UIButton(type: .system)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(resetButtonClick), for: .touchUpInside)
        resetButton.frame = CGRect(x: 20, y: frame.height - 180, width: 100, height: 40)
        
        addSubview(smallStarButton)
        addSubview(bigStarButton)
        addSubview(resetButton)
    }
    
    @objc func smallStarButtonClick() {
        if(starList.count > 10) {
            delegate?.showAlertMessage("Sky is Full")
        }
        
        let star = StarModel(
            Size: Constants.sizeTypes.S.rawValue,
            Color: Constants.colorTypes.smallCases.randomElement()!.rawValue,
            Brightness: Constants.brightnessTypes.allCases.randomElement()!.rawValue)
        
        starList.append(star)
        logList()
    }
    
    @objc func bigStarButtonClick() {
        if(starList.count > 10) {
            delegate?.showAlertMessage("Sky is Full")
        }
        
        let star = StarModel(
            Size: Constants.sizeTypes.B.rawValue,
            Color: Constants.colorTypes.bigCases.randomElement()!.rawValue,
            Brightness: Constants.brightnessTypes.allCases.randomElement()!.rawValue)
        
        starList.append(star)
        logList()
    }
    
    @objc func resetButtonClick() {
        starList.removeAll()
        logList()
    }
    
    func logList(){//this method shows all datas & Brightness count
        print("\nStartList: ",starList,"\n")
        //count all "Brightness" datas
        let countBright = starList.filter { $0.Brightness == Constants.brightnessTypes.Bright.rawValue }.count
        print("\nBright Count: \(countBright) \n")
    }
}

extension IStarWebview:UNUserNotificationCenterDelegate {//local notitifications flow
    
    func requestNotificationPermission() -> Bool {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("Granted access")
            } else {
                print("Notifications denied")
            }
        }
        center.delegate = self
        
        return true
    }
    
    func scheduleNotification(text:String) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "You forgot me!"
        content.body = text
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notificatins", content: content, trigger: trigger)
        center.add(request) { (error) in
            if let error = error {
                print("Notification Error: \(error.localizedDescription)")
            }
        }
    }
        
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        starList.removeAll()
        logList()
        completionHandler()
    }
}

extension IStarWebview {
    
    func listenAppStates() {
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillTerminate), name: UIApplication.willTerminateNotification, object: nil)
    }
    
    @objc private func applicationDidEnterBackground() {
        scheduleNotification(text: "5 seconds have passed while the app is in the background.")
    }

    @objc private func applicationWillTerminate() {
          scheduleNotification(text: "5 seconds have passed while the app is running with the app closed.")
    }
    
}
