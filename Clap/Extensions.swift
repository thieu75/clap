//
//  Extensions.swift
//  Clap
//
//  Created by Matthieu Labarrière on 27/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import Foundation

extension Double {
    func convertDoubleToFormatedhours() -> String? {
        let componentFormatter = DateComponentsFormatter()
        componentFormatter.unitsStyle = .positional
        componentFormatter.zeroFormattingBehavior = .dropAll
        return componentFormatter.string(from: self)
    }
}

extension Date {
    func convertToDateAndTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        return dateFormatter.string(from: self)
    }
    
    func convertToTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeStyle = DateFormatter.Style.short
        return dateFormatter.string(from: self)
    }
}
