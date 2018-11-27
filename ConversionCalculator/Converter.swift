//
//  Converter.swift
//  ConversionCalculator
//
//  Created by Zachary Pierucci on 10/26/18.
//  Copyright © 2018 Zachary Pierucci. All rights reserved.
//

import Foundation

struct Converter {
    var label: String
    var inputUnit: String
    var outputUnit: String
}

enum ActionSheet {
    case ftoc
    case ctof
    case mtok
    case ktom
}
