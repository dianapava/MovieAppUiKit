//
//  CarrouselHomePageCollectionViewCell.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 23/01/25.
//

import UIKit

class CarrouselHomePageCollectionViewCell: BaseCollectionViewCell<MovieGenreObjectView> {
    
    static let reuseIdentifier = "CarrouselHomePageCollectionViewCell"
    
    private lazy var titleMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.layer.shadowRadius = 12
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var genreMovieStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var voteMovieStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var voteImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        imageView.layer.shadowRadius = 14
        return imageView
    }()
    
    private lazy var voteMovie: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var carrouselImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 80
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        setTitleMovieConstraints()
        setGenreMovieStackViewConstraints()
        setVoteMovieStackViewConstraints()
        setvoteImageConstraints()
        setVoteMovieConstraints()
        setCarrouselImageConstraints()
    }
    

    
    private func setTitleMovieConstraints() {
        addSubview(titleMovie)
        NSLayoutConstraint.activate([
            titleMovie.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            titleMovie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleMovie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setGenreMovieStackViewConstraints() {
        addSubview(genreMovieStackView)
        NSLayoutConstraint.activate([
            genreMovieStackView.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 24),
            genreMovieStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            genreMovieStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            genreMovieStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setVoteMovieStackViewConstraints() {
        addSubview(voteMovieStackView)
        NSLayoutConstraint.activate([
            voteMovieStackView.topAnchor.constraint(equalTo: genreMovieStackView.bottomAnchor, constant: 16),
            voteMovieStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            voteMovieStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            voteMovieStackView.heightAnchor.constraint(equalToConstant: 30)

        ])
    }
    
    private func setvoteImageConstraints() {
        voteMovieStackView.addArrangedSubview(voteImage)
        NSLayoutConstraint.activate([
            voteImage.leadingAnchor.constraint(equalTo: voteMovieStackView.leadingAnchor, constant: 12),
            voteImage.centerYAnchor.constraint(equalTo: voteMovieStackView.centerYAnchor),
            voteImage.heightAnchor.constraint(equalToConstant: 16),
            voteImage.widthAnchor.constraint(equalToConstant: 28)
            
        ])
    }
    
    private func setVoteMovieConstraints() {
        voteMovieStackView.addArrangedSubview(voteMovie)
        NSLayoutConstraint.activate([
            voteMovie.centerYAnchor.constraint(equalTo: voteMovieStackView.centerYAnchor),
            voteImage.leadingAnchor.constraint(equalTo: voteImage.trailingAnchor, constant: 12),
        ])
    }
    
    private func setCarrouselImageConstraints() {
        addSubview(carrouselImage)
        NSLayoutConstraint.activate([
            carrouselImage.topAnchor.constraint(equalTo: voteMovieStackView.bottomAnchor, constant: 24),
            carrouselImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            carrouselImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            carrouselImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80)
        ])
    }
    
    func setGenre(values: String) {
        genreMovieStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        let label = UILabel()
        label.text = values
        label.font = .italicSystemFont(ofSize: 18)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        genreMovieStackView.addArrangedSubview(label)
    }
    
    override func setup(data: MovieGenreObjectView) {
        titleMovie.text = data.movie.titleMovie
        setGenre(values: data.genres)
        voteMovie.text = String(data.movie.votesMovie)
        if let posterURL = data.movie.posterURL {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: posterURL), let image = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in
                        self?.carrouselImage.image = image
                    }
                }
            }
        }
    }
}
