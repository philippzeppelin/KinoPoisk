//
//  DetailTableView.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 15.05.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    var presenter: DetailViewPresenterProtocol?

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let scrollStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let posterImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let movieNameRuLabel: UILabel = {
        let label = UILabel()
        label.text = "Джон Уик 4"
        label.font = UIFont(name: "Arial Bold", size: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieNameEnLabel: UILabel = {
        let label = UILabel()
        label.text = "John Wick 4"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "7.7"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingVoteCountLabel: UILabel = {
        let label = UILabel()
        label.text = "98K"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieYearLabel: UILabel = {
        let label = UILabel()
        label.text = "2023"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let genresLabel: UILabel = {
        let label = UILabel()
        label.text = "боевик"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let movieLengthLabel: UILabel = {
        let label = UILabel()
        label.text = "2:23"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countriesLabel: UILabel = {
        let label = UILabel()
        label.text = "США"
//        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ratingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yearAndGenreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let countryAndLengthView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 23
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let grabView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

//    private let movieNameRuLabel: UILabel = {
//// movie description?
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        presenter?.setMovies()

        setup()
    }

    @objc private func backButtonTapped() {
        print("tapped back button")
    }

    private func setup() {
        setupInterface()
        setupConstraints()
    }

    private func setupInterface() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackView)
        scrollView.addSubview(posterImageView)
        scrollView.addSubview(movieNameRuLabel)
        scrollView.addSubview(ratingsView)
        ratingsView.addSubview(ratingLabel)
        ratingsView.addSubview(ratingVoteCountLabel)
        scrollView.addSubview(yearAndGenreView)
        yearAndGenreView.addSubview(movieYearLabel)
        yearAndGenreView.addSubview(genresLabel)
        scrollView.addSubview(countryAndLengthView)
        countryAndLengthView.addSubview(countriesLabel)
        countryAndLengthView.addSubview(movieLengthLabel)
        scrollView.addSubview(backButton)
        scrollView.addSubview(grabView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            scrollStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            scrollStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollStackView.heightAnchor.constraint(equalToConstant: 900),

            posterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            posterImageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 650),

            movieNameRuLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 50),
            movieNameRuLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            ratingsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            ratingLabel.topAnchor.constraint(equalTo: movieNameRuLabel.bottomAnchor, constant: 25),

            ratingLabel.leftAnchor.constraint(equalTo: ratingsView.leftAnchor),
            ratingLabel.centerYAnchor.constraint(equalTo: ratingsView.centerYAnchor),

            ratingVoteCountLabel.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor, constant: 8),
            ratingVoteCountLabel.centerYAnchor.constraint(equalTo: ratingsView.centerYAnchor),
            ratingVoteCountLabel.rightAnchor.constraint(equalTo: ratingsView.rightAnchor),

            yearAndGenreView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            yearAndGenreView.topAnchor.constraint(equalTo: ratingsView.bottomAnchor, constant: 25),

            movieYearLabel.leftAnchor.constraint(equalTo: yearAndGenreView.leftAnchor),
            movieYearLabel.centerYAnchor.constraint(equalTo: yearAndGenreView.centerYAnchor),

            genresLabel.leftAnchor.constraint(equalTo: movieYearLabel.rightAnchor, constant: 8),
            genresLabel.centerYAnchor.constraint(equalTo: yearAndGenreView.centerYAnchor),
            genresLabel.rightAnchor.constraint(equalTo: yearAndGenreView.rightAnchor),

            countryAndLengthView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            countryAndLengthView.topAnchor.constraint(equalTo: yearAndGenreView.bottomAnchor, constant: 25),

            countriesLabel.leftAnchor.constraint(equalTo: countryAndLengthView.leftAnchor),
            countriesLabel.centerYAnchor.constraint(equalTo: countryAndLengthView.centerYAnchor),

            movieLengthLabel.leftAnchor.constraint(equalTo: countriesLabel.rightAnchor, constant: 8),
            movieLengthLabel.centerYAnchor.constraint(equalTo: countryAndLengthView.centerYAnchor),
            movieLengthLabel.rightAnchor.constraint(equalTo: countryAndLengthView.rightAnchor),

            backButton.topAnchor.constraint(equalTo: countryAndLengthView.bottomAnchor, constant: 25),
            backButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 48),
            backButton.widthAnchor.constraint(equalToConstant: 200),

            grabView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 5),
            grabView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            grabView.heightAnchor.constraint(equalToConstant: 5),
            grabView.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func setMovies(film: Film?) {
        movieNameRuLabel.text = film?.nameRu
        ratingLabel.text = film?.rating
        movieLengthLabel.text = film?.filmLength
        ratingVoteCountLabel.text = "\((film?.ratingVoteCount ?? 0) / 1000)K"

        guard let ratingColor = Double(film!.rating) else { return }
        switch ratingColor {
        case 0..<5:  ratingLabel.textColor = .red
        case 7...10: ratingLabel.textColor = .green
        default: ratingLabel.textColor = .gray
        }

        //        var genres: [String] = []
        //        for genre in film?.genres {
        //            genres.append(genre.genre)
        //        }
        //        genresLabel.text = genres.joined(separator: ", ")

        //        var countries: [String] = []
        //        for country in film?.countries {
        //            countries.append(country.country)
        //        }
        //        countriesLabel.text = countries.joined(separator: ", ")
    }
}