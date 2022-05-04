//
//  UIViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 03/05/22.
//

import Foundation
import UIKit

extension UIViewController {
    func makealert(message: String){
             let alert = UIAlertController(title: "UIAlertController", message: message, preferredStyle: UIAlertController.Style.alert)
             alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
             alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
             self.present(alert, animated: true, completion: nil)
    }
}
