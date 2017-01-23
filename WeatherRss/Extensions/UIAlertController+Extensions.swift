//
//  UIAlertController+Extensions.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    convenience init(title: String? = "OOPS",
                     message: String?,
                     okTappedHandler: (() -> Void)? = nil)
    {
        self.init(title: title,
                  message: message,
                  preferredStyle: UIAlertControllerStyle.alert)
        addAction(UIAlertAction(title: "OK",
                                style: UIAlertActionStyle.default) { action in
                                    okTappedHandler?()
        })
    }
}
