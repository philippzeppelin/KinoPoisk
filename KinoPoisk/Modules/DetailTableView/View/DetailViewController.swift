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

    let ratingsView: UIView = {
        let view = UIView()
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
        setupLabels()
    }

    private func setupLabels() {
           // Create a container view to hold the labels
           let container = UIView()
           container.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(container)

           // First Label
           let label1 = UILabel()
           label1.text = "Label 1"
           label1.translatesAutoresizingMaskIntoConstraints = false
           container.addSubview(label1)

           // Second Label
           let label2 = UILabel()
           label2.text = "Label 2"
           label2.translatesAutoresizingMaskIntoConstraints = false
           container.addSubview(label2)

           // Set constraints for the container view
           NSLayoutConstraint.activate([
               container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               container.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ])

           // Set constraints for the labels within the container view
           NSLayoutConstraint.activate([
               label1.leadingAnchor.constraint(equalTo: container.leadingAnchor),
               label1.centerYAnchor.constraint(equalTo: container.centerYAnchor),

               label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 8),
               label2.centerYAnchor.constraint(equalTo: container.centerYAnchor),
               label2.trailingAnchor.constraint(equalTo: container.trailingAnchor)
           ])
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
            scrollStackView.heightAnchor.constraint(equalToConstant: 1300),

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
            ratingVoteCountLabel.rightAnchor.constraint(equalTo: ratingsView.rightAnchor)
        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func setMovies(film: Film?) {
        //
    }
}
