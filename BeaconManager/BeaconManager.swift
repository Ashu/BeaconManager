//
//  BeaconManager.swift
//  BeaconManager
//
//  Created by Ashutosh Dave on 03/03/19.
//  Copyright © 2019 Ashutosh Dave. All rights reserved.
//

import Foundation
import CoreLocation

class BeaconManager: NSObject, CLLocationManagerDelegate {
	let locationManager = CLLocationManager()
	private var regions = [CLBeaconRegion]()
	
	public var stateCallback:((_ beacon:iBeacon)->Void)?
	public var rangeCallback:((_ beacon:iBeacon)->Void)?
	
	override public init() {
		super.init()
		locationManager.delegate = self
		
	}
	
	public func registerBeacons(beacons:[iBeacon]) {
		for beacon in beacons {
			var beaconRegion:CLBeaconRegion = CLBeaconRegion(proximityUUID: NSUUID(uuidString: beacon.UUID)! as UUID, identifier: beacon.id)
			
			if let major = beacon.major {
				beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(uuidString: beacon.UUID)! as UUID, major: major, identifier: beacon.id)
			}
			
			if let major = beacon.major, let minor = beacon.minor {
				beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(uuidString: beacon.UUID)! as UUID, major: major, minor: minor, identifier: beacon.id)
			}
			beaconRegion.notifyEntryStateOnDisplay = true
			beaconRegion.notifyOnEntry = true
			beaconRegion.notifyOnExit = true
			
			regions.append(beaconRegion)
		}
	}
	
	public func registerBeacon(beaconId:String)
	{
		
		let bid = CLBeaconRegion(proximityUUID:  NSUUID(uuidString:beaconId)! as UUID, identifier: "Test Beacon")
		regions.append(bid)
	}
	
	 func startMonitoring() {
		locationManager.startUpdatingLocation()
		locationManager.distanceFilter = 10
		locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
		
		for beaconRegion in regions {
			locationManager.startMonitoring(for: beaconRegion)
			locationManager.startRangingBeacons(in: beaconRegion)
		}
	}
	
	func stopMonitoring() {
		for beaconRegion in regions {
			locationManager.stopMonitoring(for: beaconRegion)
			locationManager.stopRangingBeacons(in: beaconRegion)
		}
		locationManager.stopUpdatingLocation()
	}
	
	func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
		if let region = region as? CLBeaconRegion, let minor = region.minor, let major = region.major {
			let beacon = iBeacon(minor: minor.uint16Value, major: major.uint16Value, proximityId: region.proximityUUID.uuidString)
			beacon.state = state
		}
		
		switch state {
		case .outside:
			manager.stopRangingBeacons(in: region as! CLBeaconRegion)
		case .inside:
			manager.startRangingBeacons(in: region as! CLBeaconRegion)
		default:
			print("nothing")
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
		
	}
}
