//
//  TopFilmsDataProvidingProtocol.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 06.05.2023.
//

import Foundation

protocol TopFilmsDataProvidingProtocol {
    func getData(completion: @escaping ([Films]) -> Void)
    func getTheNumberOfFilms() -> Int
    func getFilmForCell(for indexPath: IndexPath) -> Films
}
