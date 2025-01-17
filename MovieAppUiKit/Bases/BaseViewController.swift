//
//  BaseViewController.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 16/01/25.
//
import UIKit

class BaseViewController: UIViewController {
 
    private var viewModel = BaseViewModel()
    
    init(viewModel: BaseViewModel = BaseViewModel()) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
