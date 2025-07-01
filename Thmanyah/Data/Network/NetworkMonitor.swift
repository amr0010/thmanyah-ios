//
//  NetworkMonitor.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation
import Network

@MainActor
final class NetworkMonitor: ObservableObject {
    
    @Published var isConnected = false
    @Published var connectionType: NWInterface.InterfaceType?
    
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    init() {
        monitor = NWPathMonitor()
        startMonitoring()
    }
    
    deinit {
        monitor.cancel()
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            Task { @MainActor in
                self?.isConnected = path.status == .satisfied
                self?.connectionType = path.availableInterfaces.first?.type
            }
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}

extension NWInterface.InterfaceType {
    var description: String {
        switch self {
        case .wifi:
            return "WiFi"
        case .cellular:
            return "Cellular"
        case .wiredEthernet:
            return "Ethernet"
        case .loopback:
            return "Loopback"
        case .other:
            return "Other"
        @unknown default:
            return "Unknown"
        }
    }
}
