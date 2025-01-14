//
//  HomePageViewController.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let viewModel = HomePageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewdidload()
        // Do any additional setup after loading the view.
    }


}

