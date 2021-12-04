//
//  Extensions.swift
//  MyInstagram
//
//  Created by MAC on 23/11/2021.
//

import UIKit
// add extensions to class UIView to shortcut the code for size
extension UIView {
    public var width : CGFloat {
        return frame.size.width
    }
    public var height : CGFloat {
        return frame.size.height
    }
    public var top : CGFloat {
        // start of y axes
        return frame.origin.y
    }
    public var bottom : CGFloat {
        // end of the frame is its height start from start y axes
        return frame.origin.y + frame.size.height
    }
    public var left : CGFloat {
        return frame.origin.x
    }
    public var right : CGFloat {
        return frame.origin.x + frame.size.width
    }
}
