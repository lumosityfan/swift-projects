//
//  Prospect.swift
//  HotProspects
//
//  Created by Jeff Xie on 3/21/25.
//

import SwiftData
import SwiftUI

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
}
