//
//  ViewController.swift
//  BeaconManager
//
//  Created by Ashutosh Dave on 03/03/19.
//  Copyright © 2019 Ashutosh Dave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tblBeacons: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell =  tableView.dequeueReusableCell(withIdentifier: "BeaconCell", for: indexPath) as! BeaconCell
		
		return cell
	}
	
	
}
