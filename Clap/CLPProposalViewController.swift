//
//  CLPProposalViewController.swift
//  Clap
//
//  Created by Matthieu Labarrière on 27/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import UIKit

class CLPProposalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerTitle: UILabel!
    
    var packages:[Package]? {
        didSet {
            if let packages = packages, packages.count > 0 {
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CLPProposalTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CLPProposalTableViewCell")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        packages = [Package]()
        Package.getPackagesForUser { (package) in
            if let package = package {
                self.packages?.append(package)
            }
            self.tableView.reloadData()
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let packages = packages {
            return packages.count
        } else {
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CLPProposalTableViewCell", for: indexPath) as! CLPProposalTableViewCell
        
        // Configure the cell...
        if let packages = packages {
            cell.configure(package: packages[indexPath.row])
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CLPTimelineViewController") as! CLPTimelineViewController
        vc.package = packages![indexPath.row]
        self.show(vc, sender: self)
    }


}
