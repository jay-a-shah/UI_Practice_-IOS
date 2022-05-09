//
//  OnBoardingScreenCell.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 05/05/22.
//

import UIKit

class OnBoardingScreenCell: UICollectionViewCell {
    
    var displayAlert: makingAlert?
    @IBOutlet weak var getStartedBtn: BaseCustomUIButton!
    @IBOutlet weak var subTitleLabel: LightGrayUILabel!
    @IBOutlet weak var titleLabel: DarkGrayUILabel!
   
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureCell(slide: OnBoardingModel) {
        titleLabel.text = slide.title
        subTitleLabel.text = slide.subTitle
        getStartedBtn.setTitle(slide.btnTitle, for: .normal)
    }
    @IBAction func onClickOfGetStartedBtn(_ sender: BaseCustomUIButton) {
        displayAlert?.sendAlert(message: "Get Started Button is Clicked" )
    }
}

