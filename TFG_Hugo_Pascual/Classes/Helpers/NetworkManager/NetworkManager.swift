//
//  NetworkManager.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/12/2020.
//

import Foundation
import Alamofire

class NetworkManager {
	
	//shared instance
	static let shared = NetworkManager()
	
	let reachabilityManager = Alamofire.NetworkReachabilityManager()
	
	func startNetworkReachabilityObserver() {
		
		reachabilityManager?.listener = { status in
			switch status {
				
			case .notReachable:
				print("The network is not reachable")
				
			case .unknown :
				print("It is unknown whether the network is reachable")
				
			case .reachable(.ethernetOrWiFi):
				print("The network is reachable over the WiFi connection")
				
			case .reachable(.wwan):
				print("The network is reachable over the WWAN connection")
				
			}
		}
		
		// start listening
		reachabilityManager?.startListening()
	}
	
	func checkNetwork() -> Bool {
		
		return self.reachabilityManager?.isReachable ?? true
	}
	
	func networkType() -> String {
		
		return NetworkManager.shared.reachabilityManager?.isReachableOnEthernetOrWiFi ?? false
			? "connection_type_wifi"//TODO añadir la localización
			: "connection_type_mobile"//TODO añadir la localización
	}
}
