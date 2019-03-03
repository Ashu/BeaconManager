//
//  File.swift
//  BeaconManager
//
//  Created by Ashutosh Dave on 03/03/19.
//  Copyright © 2019 Ashutosh Dave. All rights reserved.
//

import Foundation
import CoreLocation

public class iBeacon: NSObject {
	
	// iBeacon Minor
	public let minor:UInt16?
	
	// iBeaon Major
	public let major:UInt16?
	
	// iBeacon id
	private(set) public var id:String = ""

	// iBeacon UUID
	public let UUID: String
	
	// Default proximity
	internal(set) public var proximity: CLProximity = CLProximity.unknown
	
	// Default state
	internal(set) public var state:CLRegionState = CLRegionState.unknown
	
	public init(beacon:CLBeacon) {
		self.UUID = beacon.proximityUUID.uuidString
		self.minor = beacon.minor.uint16Value
		self.major = beacon.major.uint16Value
		self.proximity = beacon.proximity
		super.init()
	}
	
	public init(minor:UInt16?, major:UInt16?, proximityId:String) {
		self.minor = minor
		self.major = major
		self.UUID = proximityId
		super.init()
	}
	
	public override func isEqual(_ object: Any?) -> Bool {
		if let minor = self.minor {
			if !(minor == (object as! iBeacon).minor) {
				return false
			}
		}
		if let major = self.major {			
			if !(major == (object as! iBeacon).major) {
				return false
			}
		}
		if self.UUID.lowercased() == (object as! iBeacon).UUID.lowercased() {
			return true
		}
		return false
	}
}
