//
//  CarrouselHomePageCollectionViewCell.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 27/01/25.
//

import UIKit

protocol CarrouselHomePageCollectionViewDelegate: AnyObject {
    func willDisplay(with index: Int)
}

final class CarrouselHomePageCollectionView: UIView {
    
    private var carrouselCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let bounds = UIScreen.main.bounds.size
        layout.itemSize = bounds
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CarrouselHomePageCollectionViewCell.self, forCellWithReuseIdentifier: CarrouselHomePageCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var imageBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        imageView.addBlurEffect()
        return imageView
    }()
    
    private lazy var dataSource: BaseDataSource<MovieGenreObjectView, CarrouselHomePageCollectionViewCell> = {
        return BaseDataSource<MovieGenreObjectView, CarrouselHomePageCollectionViewCell>(cellIdentifier: CarrouselHomePageCollectionViewCell.reuseIdentifier)
    }()
    
    weak var delegate: CarrouselHomePageCollectionViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setImageBackgroundCosntraints()
        setupCollectionView()
        setCollectionViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        carrouselCollectionView.dataSource = dataSource
        carrouselCollectionView.delegate = dataSource
        dataSource.dataSourceDelegate = self
    }
    
    private func setCollectionViewConstraints() {
        addSubview(carrouselCollectionView)
        NSLayoutConstraint.activate([
            carrouselCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            carrouselCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            carrouselCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            carrouselCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: safeAreaInsets.bottom)
        ])
    }
    
    private func setImageBackgroundCosntraints() {
        insertSubview(imageBackground, at: 0)
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: topAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func set(data: [MovieGenreObjectView]) {
        DispatchQueue.global().async {
            DispatchQueue.main.async { [weak self] in
                self?.dataSource.set(data: data)
                self?.carrouselCollectionView.reloadData()
            }
        }
    }

    func setUpBackground(data: MovieGenreObjectView) {
        if let posterURL = data.movie.backgroundImageMovieURL {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: posterURL), let image = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in
                        self?.imageBackground.image = image
                    }
                }
            }
        }
    }
}

extension CarrouselHomePageCollectionView : DataSourceDelegate {
    func data(with Index: Int) {
        delegate?.willDisplay(with: Index)
    }
}
