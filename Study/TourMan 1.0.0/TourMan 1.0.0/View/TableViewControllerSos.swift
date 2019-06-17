//
//  TableViewControllerSos.swift
//  TourMan 1.0.0
//
//  Created by Aleh Ban on 6/18/19.
//  Copyright © 2019 Aleh Ban. All rights reserved.
//

import UIKit

class TableViewControllerSos: UITableViewController {

    @IBAction func pushAddSosButton(_ sender: Any) {
        let alertControllerSos = UIAlertController(title: "Добавить номер", message: "Добавьте имя и номер человека для экстренной связи", preferredStyle: .alert)
        alertControllerSos.addTextField { (textField) in
            textField.placeholder = "прим: +375(44)5678122 Михаил (Тур-менеджер)"
        }
        let alertActionSos1 = UIAlertAction(title: "Отмена", style: .default) { (alert) in
            
        }
        let alertActionSos2 = UIAlertAction(title: "Добавить", style: .cancel) { (alert) in
            let newSosItem = alertControllerSos.textFields![0].text
            addSosItem(nameItem: newSosItem!)
            self.tableView.reloadData()
        }
        alertControllerSos.addAction(alertActionSos1)
        alertControllerSos.addAction(alertActionSos2)
        present(alertControllerSos, animated: true, completion: nil)
    }
    
    
    @IBAction func pushEditSosButton(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.groupTableViewBackground
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SosItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SosCell", for: indexPath)

         cell.textLabel?.text = SosItems[indexPath.row]

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeSosItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveSosItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        tableView.reloadData()
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
