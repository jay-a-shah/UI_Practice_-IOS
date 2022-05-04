//
//  UserProfileViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 04/05/22.
//

import UIKit

class UserProfileViewController: UIViewController {

    let userProfileValues = [UserProfileData(headerName: "General", userProfileDetails: [UserDetails(header: "Categories", info: "8 Categories"), UserDetails(header: "Account Currency", info: "Unites States Dollar (USD)")] ) , UserProfileData(headerName: "Account" , userProfileDetails: [UserDetails(header: "My Account", info: nil) , UserDetails(header: "Notifications", info: nil) , UserDetails(header: "Privacy", info: nil)])]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
   
}
extension UserProfileViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.darkGray
            header.textLabel?.font = UIFont(name: "DMSans-Bold", size: 14)
        }
    }
}
extension UserProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfileValues[section].userProfileDetails.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userProfileValues[section].headerName
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserProfileCell{
            cell.mainHeading.text = userProfileValues[indexPath.section].userProfileDetails[indexPath.row].header
            cell.subHeading.text = userProfileValues[indexPath.section].userProfileDetails[indexPath.row].info
       return cell
        }
        return UITableViewCell()
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return userProfileValues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
