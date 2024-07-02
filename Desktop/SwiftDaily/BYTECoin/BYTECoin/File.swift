//
//  File.swift
//  BYTECoin
//
//  Created by 이수현 on 7/1/24.
//

import UIKit

struct API: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
