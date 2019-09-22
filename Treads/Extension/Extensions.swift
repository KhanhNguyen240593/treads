//
//  Extensions.swift
//  Treads
//
//  Created by KhanhNguyen on 9/22/19.
//  Copyright © 2019 KhanhNguyen. All rights reserved.
//

import UIKit

extension Double {
    func metersToMiles(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return((self / 1609.34) * divisor).rounded() / divisor
    }
}
