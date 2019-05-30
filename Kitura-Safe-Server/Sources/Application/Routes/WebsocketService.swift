//
//  WebsocketService.swift
//  Application
//
//  Created by David Okun on 5/30/19.
//

import Foundation
import KituraWebSocket
import LoggerAPI

class DisasterSocketService: WebSocketService {
    func connected(connection: WebSocketConnection) {
        Log.info("connection established: \(connection)")
        allConnections.append(connection)
    }
    
    func disconnected(connection: WebSocketConnection, reason: WebSocketCloseReasonCode) {
        allConnections.removeAll { $0.id == connection.id }
        Log.info("Connection dropped for \(connection.id), reason: \(reason)")
    }
    
    func received(message: Data, from: WebSocketConnection) {
        Log.info("data message received: \(String(describing: String(data: message, encoding: .utf8)))")
    }
    
    func received(message: String, from: WebSocketConnection) {
        Log.info("string message received: \(message)")
    }
    private var allConnections = [WebSocketConnection]()
    private var dashboardConnection = [WebSocketConnection]()
    private var clientConnections = [Person: WebSocketConnection]()
}
