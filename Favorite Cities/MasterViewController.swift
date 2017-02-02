//
//  MasterViewController.swift
//  Favorite Cities
//
//  Created by Jen on 2/1/17.
//  Copyright © 2017 JenMachuca. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
        let alert = UIAlertController(title: "Add City", message: nil, preferredStyle: .alert)
        alert.addTextField{  (textField) in
            textField.placeholder = "City"
        }
        alert.addTextField{  (textField) in
            textField.placeholder = "State"
        }
        alert.addTextField{  (textField) in
            textField.placeholder = "Population"
            textField.keyboardType = UIKeyboardType.numberPad
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        let insertAction = UIAlertAction(title: "Add", style: .default, handler: {  (action) in
            let cityTextField = alert.textFields![0] as UITextField
            let stateTextField = alert.textFields![1] as UITextField
            let populationTextField = alert.textFields![2] as UITextField
            guard let image = UIImage(named: cityTextField.text!) else {
                print("missing \(cityTextField.text!) image")
                return
                
            }
        
            if let population = Int(populationTextField.text!) {
                let city = City(name: cityTextField.text!, state: stateTextField.text!, population: population, image: UIImagePNGRepresentation(image)!)
                self.objects.append(city)
                self.tableView.reloadData()
            }
        }
            
        alert.addAction(insertAction)
            present(alert, animated:true, completion: nil)
    }
        // we are building the compononents of the UI Alert thing, and we made a cancel button???? the numberpad thing is the keyboard that only has numbers.
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! City
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row] as! City
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

