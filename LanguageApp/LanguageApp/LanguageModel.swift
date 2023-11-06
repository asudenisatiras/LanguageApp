//
//  LanguageModel.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 6.11.2023.
//

import Foundation

struct LanguageData: Codable {
    let id: Int?
    let type: String?
    let subtitle: String?
    let languages: [Language]?
}

struct Language: Codable {
    let language: String?
    let word: String?
    let title: String?
    let sentence: String?
}
