//
//  BaseViewModel.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 16/01/25.
//
import Foundation

protocol ViewModelProtocol: AnyObject {
    func viewDidLoad()
}

class BaseViewModel : ViewModelProtocol {
    func viewDidLoad() {}
}
 
