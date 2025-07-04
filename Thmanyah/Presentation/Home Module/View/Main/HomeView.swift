//
//  EnhancedHomeView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = DIContainer.shared.makeHomeViewModel()
    @State private var selectedFilter = ContentFilter.all
    
    var body: some View {
//        NavigationView {
            VStack(spacing: 0) {
                ContentFilterView(
                    selectedFilter: $selectedFilter,
                    filters: ContentFilter.defaultFilters
                )
                .background(DesignSystem.Colors.background)
                
                ScrollView {
                    LazyVStack(spacing: DesignSystem.Spacing.lg) {
                        ForEach(filteredSections) { section in
                            SectionView(section: section)
                                .padding(.horizontal, DesignSystem.Spacing.screenPadding)
                                .onAppear {
                                    checkForLoadMore(section: section)
                                }
                        }
                        
                        if viewModel.pagination?.hasNextPage == true {
                            LoadMoreIndicatorView(isLoading: viewModel.isLoadingMore)
                                .padding(.horizontal, DesignSystem.Spacing.screenPadding)
                                .onAppear {
                                    Task {
                                        await viewModel.loadMoreSections()
                                    }
                                }
                        }
                    }
                    .padding(.top, DesignSystem.Spacing.sm)
                }
                .background(DesignSystem.Colors.background)
            }
            .navigationTitle("Thmanyah")
            .navigationBarTitleDisplayMode(.large)
            .refreshable {
                await viewModel.refreshSections()
            }
            .overlay {
                if viewModel.isLoading && viewModel.sections.isEmpty {
                    LoadingView()
                } else if let errorMessage = viewModel.errorMessage, viewModel.sections.isEmpty {
                    ErrorView(message: errorMessage) {
                        Task {
                            await viewModel.loadHomeSections()
                        }
                    }
                } else if filteredSections.isEmpty && !viewModel.sections.isEmpty {
                    EmptyStateView(
                        title: "No \(selectedFilter.displayName)",
                        subtitle: "No content found for the selected filter",
                        systemImage: selectedFilter.icon ?? "tray"
                    )
                } else if viewModel.sections.isEmpty {
                    EmptyStateView(
                        title: "No Content Available",
                        subtitle: "There's no content available right now",
                        systemImage: "tray"
                    )
                }
            }
            .task {
                if viewModel.sections.isEmpty {
                    await viewModel.loadHomeSections()
                }
            }
        
        .accentColor(DesignSystem.Colors.accent)
    }
    
    // MARK: - Computed Properties
    private var filteredSections: [Section] {
        return viewModel.sections.filter { section in
            selectedFilter.type.matches(section)
        }
    }
    
    private func checkForLoadMore(section: Section) {
        if let lastSection = filteredSections.last,
           section.id == lastSection.id,
           viewModel.pagination?.hasNextPage == true,
           !viewModel.isLoadingMore {
            Task {
                await viewModel.loadMoreSections()
            }
        }
    }
}


