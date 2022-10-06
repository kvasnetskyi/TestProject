//
//  BaseViewModel.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Combine

enum ViewRenderingState: Equatable {
    case view
    case loading
    case alert(message: String)
}

class BaseViewModel: ViewModelProtocol {
    // MARK: - Internal Properties
    let renderingState = CurrentValueSubject<ViewRenderingState, Never>(.view)
    
    @Published var isLoaderPresent: Bool = false
    @Published var alertModel = AlertModel()
    
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    init() {
        setupRenderingBinding()
    }
}

// MARK: - Private Methods
private extension BaseViewModel {
    func setupRenderingBinding() {
        $isLoaderPresent
            .sink { [weak self] isPresented in
                guard let self else { return }
                
                guard isPresented else {
                    guard self.renderingState.value == .loading,
                          self.renderingState.value != .view else { return }
                    
                    self.renderingState.send(.view)
                    
                    return
                }
                
                guard self.renderingState.value != .loading else { return }
                
                self.renderingState.send(.loading)
            }
            .store(in: &subscriptions)
        
        $alertModel
            .sink { [weak self] model in
                guard let self else { return }
                
                guard model.isAlertPresent else {
                    guard self.renderingState.value != .loading,
                          self.renderingState.value != .view else { return }
                    
                    self.renderingState.send(.view)
                    return
                }
                
                switch self.renderingState.value {
                case .alert(_):
                    break
                    
                default:
                    self.renderingState.send(
                        .alert(
                            message: model.alertMessage ?? String()
                        )
                    )
                }
            }
            .store(in: &subscriptions)
        
        renderingState
            .removeDuplicates()
            .sink { [weak self] state in
                guard let self else { return }
                
                switch state {
                case .view:
                    self.alertModel = .init()
                    self.isLoaderPresent = false
                    
                case .alert(let message):
                    self.alertModel = .init(isAlertPresent: true, alertMessage: message)
                    self.isLoaderPresent = false
                    
                case .loading:
                    self.alertModel = .init()
                    self.isLoaderPresent = true
                }
            }
            .store(in: &subscriptions)
    }
}
