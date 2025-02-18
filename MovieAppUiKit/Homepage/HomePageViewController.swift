//
//  HomePageViewController.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 13/01/25.
//

import UIKit

final class HomePageViewController<ViewModel: HomePageViewModelProtocol>: BaseViewController<ViewModel>, CarrouselHomePageCollectionViewDelegate{

    private let carrouselCollectionView = CarrouselHomePageCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carrouselCollectionView.delegate = self
        carrouselCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        setHomePageViewConstraints()
    }
    
    override func setObservers() {
        viewModel.showMovies = { [weak self] movies in
            self?.carrouselCollectionView.set(data: movies)
        }
        
        viewModel.backGroundMovie = { [weak self] imageUrl in
            self?.carrouselCollectionView.setUpBackground(data: imageUrl)
        }
        
    }
    
    private func setHomePageViewConstraints() {
        view.addSubview(carrouselCollectionView)
        NSLayoutConstraint.activate([
            carrouselCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -40),
            carrouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carrouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carrouselCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 14)
        ])
    }
    
    func willDisplay(with index: Int) {
        viewModel.willDisplay(index: index)
    }
}
