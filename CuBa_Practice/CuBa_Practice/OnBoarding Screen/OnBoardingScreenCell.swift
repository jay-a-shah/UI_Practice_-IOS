//
//  OnBoardingScreenCell.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 05/05/22.
//

import UIKit

class OnBoardingScreenCell: UICollectionViewCell {
    
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
//        let alert = UIAlertController(title: "UIAlertController", message: "Get Started With App", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
//        alert.present(alert, animated: true, completion: nil)
        
    }
}
