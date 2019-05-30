//
//  TOEICVocabularyModel.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/30.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation

class TOEICVocabularyModel:Codable {
     let eachVocabularys:[eachVocabulary]
}

class eachVocabulary: Codable {
    let chinese:String
    let english:String
}
