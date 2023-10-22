//
//  StudentCellViewModel.swift
//  MVVM_Example_Swift_UIKit
//
//  Created by Ahmet Balaman on 22.10.2023.
//

import Foundation

protocol StudentCellViewModelProtocol{
    var name:String {get}
    var surName:String {get}
    
    
}



class StudentCellViewModel{
    var student:Student;
    init(_student:Student) {
        self.student = _student;
    }
}

extension StudentCellViewModel:StudentCellViewModelProtocol{
    var name: String {
        student.name
    }
    
    var surName: String {
        student.surName
    }
    
    
}
