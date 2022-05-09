//
//  OnBoardingScreenCell.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 05/05/22.
//

import UIKit

class OnBoardingScreenCell: UICollectionViewCell {
      
    //MARK: - Outlets
    @IBOutlet weak var getStartedBtn: BaseCustomUIButton!
    @IBOutlet weak var subTitleLabel: LightGrayUILabel!
    @IBOutlet weak var titleLabel: DarkGrayUILabel!
    
    //MARK: - Varibles
    var currentPage = 0
    var displayAlert: MakingAlert?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(slide: OnBoardingModel, pageNumber: Int) {
        titleLabel.text = slide.title
        subTitleLabel.text = slide.subTitle
        getStartedBtn.setTitle(slide.btnTitle, for: .normal)
        currentPage = pageNumber
    }
}

//MARK: - Outlet Action
extension OnBoardingScreenCell {
    
    @IBAction func onClickOfGetStartedBtn(_ sender: BaseCustomUIButton) {
        switch(currentPage) {
        case 0: displayAlert?.sendAlert(message: "Waiting To Started is Added")
        case 1: displayAlert?.sendAlert(message: "Not Still started")
        case 2: displayAlert?.sendAlert(message: "Get Started is called")
        default:
            break
        }
    }
}
