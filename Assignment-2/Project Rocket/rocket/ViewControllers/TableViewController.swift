//
//  TableViewController.swift
//  rocket
//
//  Created by Акмарал Тажиева on 19.10.2022.
//

import UIKit

class TableViewController: UITableViewController {

    let service = Service()
    var rocketNumber:String = ""
    var rocketName: String = ""

    var launches = [Launch]()
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var navCont: UINavigationItem!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        

        service.loadLaunches { launches in

            launches.filter{$0.rocket == self.rocketNumber}
                .forEach { launch in

                    self.launches.append(launch)
                }

            DispatchQueue.main.async {
                self.navCont.self.title = self.rocketName
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        let launch = launches[indexPath.row]
        cell?.setLaunch(launch: launch)
        
        if launch.success != nil {
            if launch.success == true {
                cell?.successImage.image = UIImage(named: "rocket")
                cell?.check.image = UIImage(named: "checkmark")
            } else if launch.success == false {
                cell?.successImage.image = UIImage(named: "rocketFall")
                cell?.check.image = UIImage(named: "xcheckmark")
            }
        } else {
            cell?.successImage.image = .none
        }
        return cell ?? UITableViewCell()
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

