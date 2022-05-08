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
       turnOnSwipeToBack()
        // Do any additional setup after loading the view.
    }
    @IBAction func onClickOfBarcodeButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension UserProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 25))
        let header = UILabel(frame: CGRect(x: 33, y: 65, width: tableView.frame.width, height: 20))
        header.font = UIFont(name: "DMSans-Bold", size: 14)
        header.textColor = UIColor.darkGray
        header.text = userProfileValues[section].headerName
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
extension UserProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfileValues[section].userProfileDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserProfileCell{
            cell.mainHeading.text = userProfileValues[indexPath.section].userProfileDetails[indexPath.row].header
            cell.subHeading.text = userProfileValues[indexPath.section].userProfileDetails[indexPath.row].info
            let dividerView = UIView(frame: CGRect(x: 0, y: cell.bounds.maxY, width: cell.bounds.width, height: 2))
            dividerView.translatesAutoresizingMaskIntoConstraints  = false
            dividerView.backgroundColor = UIColor.DarkPurple
            cell.contentView.addSubview(dividerView)
       return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 77
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return userProfileValues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
