//
//  BaseViewController.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 16/01/25.
//
import UIKit

class BaseViewController<ViewModel: ViewModelProtocol>: UIViewController {
 
    var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        viewModel.viewDidLoad()
    }
    
    func setObservers() {}
}
