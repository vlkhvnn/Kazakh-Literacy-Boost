//
//  ReadingSource.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import Foundation

enum Category : String {
    case skazki = "Сказки"
    case knigi = "Книги"
    case komiksy = "Комиксы"
}

struct Book {
    let title : String
    var content : String
    let imageName : String
}

struct Comics {
    
}

struct FairyTales {
    
}
