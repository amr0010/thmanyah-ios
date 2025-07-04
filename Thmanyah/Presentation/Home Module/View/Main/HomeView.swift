//
//  HomeView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = DIContainer.shared.makeHomeViewModel()
    @State private var selectedFilter = ContentFilter.all
    
    var body: some View {
        VStack(spacing: 0) {
            ContentFilterView(
                selectedFilter: $selectedFilter,
                filters: ContentFilter.defaultFilters
            )
            .background(DesignSystem.Colors.background)
            .transition(.move(edge: .top).combined(with: .opacity))
            
            ScrollView {
                LazyVStack(spacing: DesignSystem.Spacing.lg) {
                    ForEach(Array(filteredSections.enumerated()), id: \.element.id) { index, section in
                        SectionView(section: section)
                            .padding(.horizontal, DesignSystem.Spacing.screenPadding)
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing).combined(with: .opacity),
                                removal: .move(edge: .leading).combined(with: .opacity)
                            ))
                            .animation(.easeInOut(duration: 0.3).delay(Double(index) * 0.1), value: filteredSections.count)
                            .onAppear {
                                checkForLoadMore(section: section)
                            }
                    }
                    
                    if viewModel.pagination?.hasNextPage == true {
                        LoadMoreIndicatorView(isLoading: viewModel.isLoadingMore)
                            .padding(.horizontal, DesignSystem.Spacing.screenPadding)
                            .transition(.scale.combined(with: .opacity))
                            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: viewModel.isLoadingMore)
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
                    .transition(.scale.combined(with: .opacity))
            } else if let errorMessage = viewModel.errorMessage, viewModel.sections.isEmpty {
                ErrorView(message: errorMessage) {
                    Task {
                        await viewModel.loadHomeSections()
                    }
                }
                .transition(.scale.combined(with: .opacity))
            } else if filteredSections.isEmpty && !viewModel.sections.isEmpty {
                EmptyStateView(
                    title: "No \(selectedFilter.displayName)",
                    subtitle: "No content found for the selected filter",
                    systemImage: selectedFilter.icon ?? "tray"
                )
                .transition(.scale.combined(with: .opacity))
            } else if viewModel.sections.isEmpty {
                EmptyStateView(
                    title: "No Content Available",
                    subtitle: "There's no content available right now",
                    systemImage: "tray"
                )
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.4), value: viewModel.isLoading)

        .task {
            if viewModel.sections.isEmpty {
                await viewModel.loadHomeSections()
            }
        }
        .accentColor(DesignSystem.Colors.accent)
    }
    
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

