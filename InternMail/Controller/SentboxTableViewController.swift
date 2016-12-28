//
//  SentboxTableViewController.swift
//  InternMail
//
//  Created by Saba on 12/27/16.
//  Copyright © 2016 Saba. All rights reserved.
//

import UIKit


//TODO Make Superclass for sentbox controller and inbox controller, most part is same

class SentboxTableViewController: UITableViewController {

    var dataSource : [IMMail]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName:"MailTableViewCell", bundle: nil), forCellReuseIdentifier: "mailCell")
        loadEmails()
        
    }
    
    func loadEmails(completion: @escaping () -> Void = {}){
        weak var wSelf = self
        MailService.sharedInstance.loadSentItems() { (response) -> Void in
            if (response?.error) != nil {
            }else{
                wSelf?.dataSource = (response?.result)!
                wSelf.self?.tableView.reloadData()
            }
        }
        completion()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "mailCell", for: indexPath)
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let mailCell = cell as! MailTableViewCell
        mailCell.configure(title: (dataSource?[indexPath.row].subject)!, address: (dataSource?[indexPath.row].from.username)!)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail_view", sender: nil)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detail_view"){
            (segue.destination as! DetailViewController).email = dataSource?[(tableView.indexPathForSelectedRow?.row)!]
        }
        
        
        
    }

}
