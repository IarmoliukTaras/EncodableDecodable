//
//  Post.swift
//  BeCodeble
//
//  Created by 123 on 08.09.17.
//  Copyright © 2017 123. All rights reserved.
//

import Foundation

struct Post: Encodable, Decodable {
    let body: String
    let id: Int
    let title: String
    let userId: Int
}
