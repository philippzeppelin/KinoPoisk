//
//  TableViewPresenter.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 30.04.2023.
//

import Foundation

protocol MainTableViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}
