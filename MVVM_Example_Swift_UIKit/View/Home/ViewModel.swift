//
//  ViewModel.swift
//  MVVM_Example_Swift_UIKit
//
//  Created by Ahmet Balaman on 22.10.2023.
//

import Foundation

protocol HomeViewProtocol{
    func filteredStudents(filteredString:String)
    func getStudents()
    func getStudent(index:Int) -> Student
    func getStudentsCount() -> Int
    var delegate: HomeViewModelDelegate?{get set}
}
protocol HomeViewModelDelegate: AnyObject{
    func downloadResult()
    func filteredResult()
}

class HomeViewModel{
    weak var delegate:HomeViewModelDelegate?
    var students:[Student] = [Student]()
    var filteredStudent:[Student] = [Student]()
    var isSearching:Bool = false
}

extension HomeViewModel: HomeViewProtocol{
    func getStudent(index: Int) -> Student {
        isSearching ? filteredStudent[index] : students[index]
    }
    
    func filteredStudents(filteredString:String) {
        isSearching = !filteredString.isEmpty
        filteredStudent = students.filter({$0.name.contains(filteredString) || $0.surName.contains(filteredString) })
        delegate?.filteredResult()
    }
    
    func getStudents() {
        students = SampleData.Students;
        delegate?.downloadResult()
    }
    
    func getStudentsCount() -> Int {
        isSearching ?  filteredStudent.count : students.count
    }
}



