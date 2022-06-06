//
//  LocalNotificationViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/06/22.
//

import UIKit
import UserNotifications

class LocalNotificationViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblNotificationResponse: UILabel!
    @IBOutlet weak var btnLocalNotification: BaseCustomUIButton!
    
    //MARK: - Variables
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNotificationCenter.delegate = self
    }
    
    func requestNotificationAuthorization() {
        // let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        userNotificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (success,error)  in
            if let error = error {
                print("Error ",error)
            }
        }
    }
    
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Test"
        notificationContent.body = "This is an Local Notification which is triggeed by Cuba Practice"
        notificationContent.badge = 3
        notificationContent.sound = UNNotificationSound.default
        notificationContent.subtitle = "I am Subtitle"
        notificationContent.categoryIdentifier = "CategoryIdentifier"
        
        
        if let url = Bundle.main.url(forResource: "notification", withExtension: "gif") {
            if let attachment = try? UNNotificationAttachment(identifier: "Image", url: url, options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: notificationTrigger)
        userNotificationCenter.add(notificationRequest) { (error) in
            if let error = error {
                print("Notification Error:", error)
            }
        }
        
        let replyAction = UNTextInputNotificationAction(identifier: "Accept", title: "Reply on message", textInputButtonTitle: "Chal Bhej", textInputPlaceholder: "Input text here")
        //let like = UNNotificationAction.init(identifier: "Accept", title: "Reply on message", options: .foreground, icon: .init(templateImageName: "Icon_Right"))
        let dislike = UNNotificationAction.init(identifier: "Decline", title: "Decline", options: .destructive, icon: .init(templateImageName: "Icon_Back"))
        let category = UNNotificationCategory.init(identifier: notificationContent.categoryIdentifier, actions: [replyAction,dislike], intentIdentifiers: [], options: [])
        userNotificationCenter.setNotificationCategories([category])
        
    }
    
}

//MARK: - UNUserNotificationCenterDelegate
extension LocalNotificationViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "Accept":
            print("Accept")
            if let textResponse =  response as? UNTextInputNotificationResponse {
                let sendText =  textResponse.userText
                lblNotificationResponse.text = sendText
                print("Received text message: \(sendText)")
            }
            UIApplication.shared.applicationIconBadgeNumber = 0
        case "Decline":
            print("Decline")
        default:
            print("Unknown action")
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}

//MARK: - Outlet Action
extension LocalNotificationViewController {
    
    
    @IBAction func onClickOfLocalNotification(_ sender: Any) {
        requestNotificationAuthorization()
        sendNotification()
    }
    
}
