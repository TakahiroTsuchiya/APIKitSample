//
//  DecodableDataParser.swift
//  APIKitSample
//
//  Created by Takahiro Tsuchiya on 2017/11/07.
//  Copyright © 2017 Takahiro Tsuchiya. All rights reserved.
//

import Foundation
import APIKit

final class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}
