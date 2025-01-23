//
//  HomePageViewModelFactory.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 22/01/25.
//

class HomePageViewModelFactory: ViewModelFactory<HomePageViewModel> {
    override func create() -> HomePageViewModel {
        let apiClient = ApiClient()
        let respository = MovieRepository(apiClient: apiClient)
        return HomePageViewModel(respository: respository)
    }
}
