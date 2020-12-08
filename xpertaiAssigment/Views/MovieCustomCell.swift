//
//  MovieCustomCell.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 05/12/2020.
//

import UIKit
import Kingfisher

class MovieCustomCell: UITableViewCell {
    
    private let movieTittleAndReleaseYearLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
     }()

    private let movieOverviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
     }()
    
    private let movieRateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
     }()

    private let coverImage: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        return imageView
     }()

    private let titleAndOverviewStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .equalSpacing
        return stack
     }()
    private let imageAndRateStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .equalSpacing
        return stack
     }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleAndOverviewStack.addArrangedSubview(movieTittleAndReleaseYearLabel)
        titleAndOverviewStack.addArrangedSubview(movieOverviewLabel)
        addSubview(titleAndOverviewStack)
        
        imageAndRateStack.addArrangedSubview(coverImage)
        imageAndRateStack.addArrangedSubview(movieRateLabel)
        addSubview(imageAndRateStack)

        
        imageAndRateStack.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.centerY.equalToSuperview()
        }

        titleAndOverviewStack.snp.makeConstraints {
            $0.bottom.top.trailing.equalToSuperview().inset(10)
            $0.leading.equalTo(coverImage.snp.trailing).inset(-10)
        }
    }
    func setupCell(movie: Movie?) {
        if let title = movie?.title, let releaseDate = movie?.year {
            let index = releaseDate.index(releaseDate.startIndex, offsetBy: 4)
            let realeaseYear = releaseDate.prefix(upTo: index)

            movieTittleAndReleaseYearLabel.text =  "\(title) (\(realeaseYear))"
        }
        movieOverviewLabel.text = movie?.overview
        if let rate = movie?.rate {
            let rateString = String(rate)
            movieRateLabel.text = "Rate: \(rateString)"
        }
        if let posterPath = movie?.posterImage {
            let urlString = "https://image.tmdb.org/t/p/w500/\(posterPath)"
            let url = URL(string: urlString)!
            coverImage.kf.setImage(with: url)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
