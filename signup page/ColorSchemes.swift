//
//  ColorSchemes.swift
//  signup page
//
//  Created by Saee Saadat on 2/27/20.
//  Copyright © 2020 Saee Saadat. All rights reserved.
//

import Foundation
import UIKit

class ColorSchemes {
    
    private static let index = UITraitCollection.current.userInterfaceStyle == .light ? 0 : 1
    
    // 0 -> light theme, 1 -> dark theme
    static var bodyTextColor : UIColor  = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] [index]
    
    static var textFieldBackgroundColor : UIColor = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)] [index]
    
    static var textFieldTextColor : UIColor = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] [index]
    
    static var textFieldPlaceHolderColor : UIColor = [#colorLiteral(red: 0.6802823604, green: 0.01701301704, blue: 0.5529439378, alpha: 0.3984107449) , #colorLiteral(red: 0.7922350888, green: 0.02138128946, blue: 0.6520118593, alpha: 0.3984107449)] [index]
    
    static var backgroundColor : UIColor = [#colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1) , #colorLiteral(red: 0.2415437762, green: 0, blue: 0.1971500266, alpha: 1)] [index]
    
    static var titleTextColor : UIColor = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] [index]
    
    static var buttonBackgroundColor : UIColor = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)] [index]
    
    static var buttonTextColor : UIColor = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) , #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] [index]

    
    

}
