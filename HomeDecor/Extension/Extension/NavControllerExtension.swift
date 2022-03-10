//
//  NavControllerExtension.swift
//  Ethnic Roop
//
//  Created by Devarshi on 06/12/18.
//  Copyright © 2018 SIPL. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

//MARK: - NavigationController
extension UINavigationController {
    
    func backToViewController(vc: Any) {
        // iterate to find the type of vc
        for element in viewControllers as Array {
            if element.isKind(of: vc as! AnyClass) {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
    
    func isViewcontrollerAvailable(vc: Any) -> Bool? {
        for element in viewControllers as Array {
            if element.isKind(of: vc as! AnyClass) {
                return true
            }
        }
        return false
    }
    
    func getViewController(vc: Any) -> UIViewController? {
        for element in viewControllers as Array {
            if element.isKind(of: vc as! AnyClass) {
                return element
            }
        }
        return nil
    }
    
    func removeViewController(_ controller: UIViewController.Type) {
        if let viewController = viewControllers.first(where: { $0.isKind(of: controller.self) }) {
            viewController.removeFromParent()
        }
    }
    
    func popViewControllers(viewsToPop: Int, animated: Bool = true) {
      if viewControllers.count > viewsToPop {
        let vc = viewControllers[viewControllers.count - viewsToPop - 1]
        popToViewController(vc, animated: animated)
      }
    }
    
}


public class Reachability {

    class func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        /* Only Working for WIFI
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired

        return isReachable && !needsConnection
        */

        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret

    }
}
