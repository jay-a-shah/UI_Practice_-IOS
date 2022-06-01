//
//  UserListViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 01/06/22.
//

import UIKit

class UserListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Variables
    var userArray = [UserListData]()
    var viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

//MARK: - UITextFieldDelegate
extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: - UITableViewDataSource
extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.tableViewCell.rawValue, for: indexPath) as? UserListCell{
            let elements = userArray[indexPath.row]
            cell.configCell(firstName: elements.first_name, email: elements.email, image: elements.avatar)
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

//MARK: - Bind ViewModel
extension UserListViewController {
    
    func bindViewModel() {
        viewModel.apiCallUserList()
        viewModel.onLoginResponseData = { response in
            self.userArray = response.data
            self.tableView.reloadData()
        }
        viewModel.onLoginFailureData = { failure in
            DispatchQueue.main.async {
                self.makealert(message: failure.error)
            }
        }
    }
    
}
