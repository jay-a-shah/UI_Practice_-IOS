//
//  UserProfileViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 04/05/22.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    //MARK: - Variables
    let userProfileValues = [UserProfileData(headerName: "General", userProfileDetails: [UserDetails(header: "Categories", info: "8 Categories"), UserDetails(header: "Account Currency", info: "Unites States Dollar (USD)")] ) , UserProfileData(headerName: "Account" , userProfileDetails: [UserDetails(header: "My Account", info: nil) , UserDetails(header: "Notifications", info: nil) , UserDetails(header: "Privacy", info: nil)])]
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        turnOnSwipeToBack()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

//MARK: - UITableViewDelegate
extension UserProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 25))
        let header = UILabel(frame: CGRect(x: 33, y: 30, width: tableView.frame.width, height: 40))
        header.font = UIFont(name: "DMSans-Bold", size: 14)
        header.textColor = UIColor.darkGray
        header.text = userProfileValues[section].headerName
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(header)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.darkGray
            header.textLabel?.font = UIFont(name: "DMSans-Bold", size: 14)
            header.clipsToBounds = true
        }
    }
}

//MARK: - UITableViewDataSource
extension UserProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfileValues[section].userProfileDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.tableViewCell.rawValue, for: indexPath) as? UserProfileCell{
            cell.mainHeading.text = userProfileValues[indexPath.section].userProfileDetails[indexPath.row].header
            cell.subHeading.text = userProfileValues[indexPath.section].userProfileDetails[indexPath.row].info
            let seprator = UIView()
            let bottomBorder = CALayer()
            bottomBorder.frame = CGRect(x: cell.contentView.frame.minX + 30, y: 62.0, width: cell.contentView.frame.size.width - 60, height: 1.0)
            bottomBorder.backgroundColor = UIColor.lightGray.cgColor
            seprator.layer.addSublayer(bottomBorder)
            cell.contentView.addSubview(seprator)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userProfileValues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Outlet Action
extension UserProfileViewController {
    
    @IBAction func onClickOfBarcodeButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickOfThreeDots(_ sender: UIButton) {
        customDialog(message: "Are you Sure You Want to Logout From this Wonderfull App")
    }
}

extension UserProfileViewController {
    
    func customDialog(message: String){
        let alert = UIAlertController(title: "UIAlertController", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction) in
            defaults.set(false, forKey: "isLoggedIn")
            if let signInVC = UIStoryboard(name: Identifiers.mainStoryboard.rawValue, bundle: nil).instantiateViewController(withIdentifier:Identifiers.signInViewController.rawValue ) as? SignInViewController {
            self.navigationController?.pushViewController(signInVC, animated: true)
        }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
