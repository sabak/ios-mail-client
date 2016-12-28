//
//  MailTableViewCell.swift
//  TableVIewTest
//
//  Created by Saba on 12/14/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit

class MailTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func configure(title:String, address: String){
        self.title.text = title
        self.address.text = address
        //self.date.text = date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
