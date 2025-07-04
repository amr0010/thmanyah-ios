//
//  SearchView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = DIContainer.shared.makeSearchViewModel()
    @FocusState private var isSearchFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(
                searchText: $viewModel.searchQuery,
                isLoading: viewModel.isLoading,
                onClear: {
                    viewModel.clearSearch()
                }
            )
            .focused($isSearchFocused)
            .padding(.horizontal, DesignSystem.Spacing.screenPadding)
            .padding(.vertical, DesignSystem.Spacing.sm)
            .background(DesignSystem.Colors.background)
            
            ZStack {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                if viewModel.searchQuery.isEmpty {
                    EmptyStateView.searchEmpty()
                } else if viewModel.isLoading {
                    LoadingView()
                } else if !viewModel.sections.isEmpty {
                    ScrollView {
                        LazyVStack(spacing: DesignSystem.Spacing.lg) {
                            ForEach(viewModel.sections) { section in
                                SearchSectionView(section: section)
                                    .padding(.horizontal, DesignSystem.Spacing.screenPadding)
                            }
                        }
                        .padding(.top, DesignSystem.Spacing.sm)
                    }
                } else if viewModel.hasError {

                } else {
                    EmptyStateView.noSearchResults(for: viewModel.searchQuery)
                }
            }
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                isSearchFocused = true
//            }
        }
        .accentColor(DesignSystem.Colors.accent)
    }
}







