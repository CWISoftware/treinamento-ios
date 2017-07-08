//
//  Reachbility.swift
//  ClienteAPI
//
//  Created by Juliano Krieger Nardon on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import SystemConfiguration
import CoreTelephony

final class Intenenet {
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1, { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            })
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
    }
    
    func getNetworkType() -> String {
        if let reachability = Reachability().isConnectedToNetwork() {
            reachability.startNotifier()
            let status = reachability.currentReachabilityStatus()
            if status == .init(0) {
                // .NotReachable
                return "Not Reachable"
            }
            else if status == .init(1) {
                // .ReachableViaWiFi
                return "Reachable Via WiFi"
            }
            else if status == .init(2) {
                // .ReachableViaWWAN
                let netInfo = CTTelephonyNetworkInfo()
                if let cRAT = netInfo.currentRadioAccessTechnology  {
                    switch cRAT {
                    case CTRadioAccessTechnologyGPRS,
                         CTRadioAccessTechnologyEdge,
                         CTRadioAccessTechnologyCDMA1x:
                        return "Reachable Via 2G"
                    case CTRadioAccessTechnologyWCDMA,
                         CTRadioAccessTechnologyHSDPA,
                         CTRadioAccessTechnologyHSUPA,
                         CTRadioAccessTechnologyCDMAEVDORev0,
                         CTRadioAccessTechnologyCDMAEVDORevA,
                         CTRadioAccessTechnologyCDMAEVDORevB,
                         CTRadioAccessTechnologyeHRPD:
                        return "Reachable Via 3G"
                    case CTRadioAccessTechnologyLTE:
                        return "Reachable Via 4G"
                    default:
                        fatalError("error")
                    }
                }
            }
        }    }
}
