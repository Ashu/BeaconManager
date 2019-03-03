//
//  BeaconCell.swift
//  BeaconManager
//
//  Created by Ashutosh Dave on 03/03/19.
//  Copyright © 2019 Ashutosh Dave. All rights reserved.
//

import UIKit

class BeaconCell: UITableViewCell {

	@IBOutlet weak var lblMajor: UILabel!
	@IBOutlet weak var lblUUID: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
