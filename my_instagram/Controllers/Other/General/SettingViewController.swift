//
//  SettingViewController.swift
//  MyInstagram
//
//  Created by MAC on 22/11/2021.
//

import UIKit
import Firebase

struct SettingCellModel {
    let title : String
    let handle : (() -> Void)
}

// view controller to show user settings
final class SettingViewController: UIViewController {

    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    // multidimensional array because we have multiply sections
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureModel()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModel() {
        let section = [
            SettingCellModel(title: "Log Out", handle: {
            self.didTapLogOut()
        })]
        data.append(section)
    }
    
    private func didTapLogOut (){
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out", preferredStyle: .alert)
        actionSheet.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logout(completion: { success, error in
                if success{
                    let loginVc = LoginViewController()
                    loginVc.modalPresentationStyle = .fullScreen
                    self.present(loginVc, animated: true) {
                        // to show home screen
                        self.navigationController?.popToRootViewController(animated: true)
                        self.tabBarController?.selectedIndex = 0
                    }
                }
                else{
                    fatalError(error as! String)
                }
            })
        }))
        present(actionSheet, animated: true)
    }

}

//MARK: - TABLEVIEW

extension SettingViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handle()
    }
    
}
