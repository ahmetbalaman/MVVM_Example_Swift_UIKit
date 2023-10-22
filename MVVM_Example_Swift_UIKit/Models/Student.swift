//
//  Student.swift
//  MVVM_Example_Swift_UIKit
//
//  Created by Ahmet Balaman on 22.10.2023.
//

import Foundation


struct Student{
    var id:UUID
    var name:String
    var surName:String
    init( name: String, surName: String) {
        self.id = UUID.init()
        self.name = name
        self.surName = surName
    }
}
