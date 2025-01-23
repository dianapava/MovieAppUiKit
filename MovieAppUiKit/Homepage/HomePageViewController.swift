//
//  HomePageViewController.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//

import UIKit

final class HomePageViewController<ViewModel: HomePageViewModelProtocol>: BaseViewController<ViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setObservers() {
        viewModel.showMovies = { movies in
            
        }
    }
}

