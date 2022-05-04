//
//  RoundedCustomUIView.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 04/05/22.
//

import Foundation
import UIKit

class RoundedCustomUIView: UIView{
    
     override init(frame: CGRect) {
         super.init(frame: frame)
         layoutSubviews()
     }
    
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         layoutSubviews()
     }
    
    override func layoutSubviews() {
        self.roundCorners(view: self, corners: [.topLeft , .topRight], radius: 12.0)
    }
    
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
             let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
             let mask = CAShapeLayer()
             mask.path = path.cgPath
             view.layer.mask = mask
     }
    
   
}
