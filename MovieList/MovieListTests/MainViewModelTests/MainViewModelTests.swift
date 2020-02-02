//
//  MovieListTests.swift
//  MovieListTests
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import XCTest
import TMDBSwift
@testable import MovieList

class MainViewModelTests: XCTestCase {

    // MARK: - Variables
    
    var viewModel: MainViewModel?
    var expectation: XCTestExpectation?
    var movies: [MovieMDB]?
    
    // MARK: - Lifecycle
    
    override func setUp() {
        viewModel = MainViewModel()
        viewModel?.viewDelegate = self
    }

    override func tearDown() {
        viewModel = nil
    }

    // MARK: - Tests
    
    func testUpcomingSuccess() {
        expectation = XCTestExpectation(description: "Get upcoming movies should success")
        viewModel?.upcomingMovies(page: 1)
        wait(for: [expectation!], timeout: 3.0)
        XCTAssert(movies!.count > 0)
    }

    func testUpcomingFail() {
        expectation = XCTestExpectation(description: "Get upcoming movies should fail")
        viewModel?.upcomingMovies(page: -1)
        wait(for: [expectation!], timeout: 3.0)
        XCTAssert(movies!.count == 0)
    }
}

extension MainViewModelTests: MainViewDelegate {
    func upcomingMovies(_ movies: [MovieMDB]) {
        self.movies = movies
        expectation?.fulfill()
    }
}
