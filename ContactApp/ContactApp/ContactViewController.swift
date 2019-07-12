//
//  ContactViewController.swift
//  ContactApp
//
//  Created by Megan Wilson on 7/12/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import UIKit
import CoreData

class ContactViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!

    var individual = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchReq: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do{
        
           let individual = try SaveData.context.fetch(fetchReq)
           self.individual = individual
            self.tableView.reloadData()
            
        }catch{}

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addOn() {
        let alert = UIAlertController(title: "Add Contact", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Number"
        }
        let action = UIAlertAction(title: "Save", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            let number = alert.textFields!.last!.text!
            let contact = Contact(context: SaveData.context)
            contact.name = name
            contact.number = Double(number)!
            SaveData.saveContext()
            self.individual.append(contact)
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return individual.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.text = individual[indexPath.row].name
            cell.detailTextLabel?.text = String(individual[indexPath.row].number)
            return cell
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

