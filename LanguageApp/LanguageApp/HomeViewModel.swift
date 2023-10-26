//
//  HomeViewModel.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import Foundation

// MARK: - SearchViewModelDelegate

protocol HomeViewModelDelegate: AnyObject {
    func reloadData()
}

// MARK: - SearchViewModelProtocol

protocol HomeViewModelProtocol {
    var numberOfItems: Int { get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    var numberOfItems: Int {
        return 5
    }
    
    weak var delegate: HomeViewModelDelegate?
}
