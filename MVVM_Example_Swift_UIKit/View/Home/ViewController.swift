//
//  ViewController.swift
//  MVVM_Example_Swift_UIKit
//
//  Created by Ahmet Balaman on 22.10.2023.
//

import UIKit

class ViewController: UIViewController {
    var viewModel:HomeViewProtocol = HomeViewModel()
    lazy var myTableView:UITableView = {
        
        let tableView:UITableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StudentViewCell", bundle: nil), forCellReuseIdentifier: "StudentViewCellIdentifier")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        viewModel.getStudents()
        myTableView.frame = view.frame.inset(by: view.safeAreaInsets);
        view.addSubview(myTableView)
    }
}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getStudentsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudentViewCellIdentifier", for: indexPath) as? StudentTableViewCell else {
            fatalError("StudentTableViewCell Cast Error")
        }
        cell.viewModel = StudentCellViewModel(_student: viewModel.getStudent(index: indexPath.row))
        cell.delegate = self
        return cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

extension ViewController: HomeViewModelDelegate{
    func downloadResult() {
        print("Workkk")
        myTableView.reloadData()
    }
    
    func filteredResult() {
        print("Workkk22")
        myTableView.reloadData()
    }
    
}

extension ViewController: StudentTableViewCellDelegate{
    func buttonDidTap(_ info: String) {
        print(info)
    }
}
