//
//  StudentTableViewCell.swift
//  MVVM_Example_Swift_UIKit
//
//  Created by Ahmet Balaman on 22.10.2023.
//

import UIKit

protocol StudentTableViewCellDelegate: AnyObject{
    func buttonDidTap(_ info: String)
}

class StudentTableViewCell: UITableViewCell {
    
   weak var delegate: StudentTableViewCellDelegate?
    
    var viewModel:StudentCellViewModelProtocol?{
        didSet{
            setup()
        }
    }
    
    @IBOutlet weak var surNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    @IBAction func buttonTap(_ sender: UIButton) {
        delegate?.buttonDidTap(viewModel!.name + " " + viewModel!.surName)
    }
    static let identifier = "StudentTableViewCell"
    
    private func setup(){
        nameLabel.text = viewModel?.name
        surNameLabel.text = viewModel?.surName
    }
}
