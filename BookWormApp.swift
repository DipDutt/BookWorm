//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Dip Dutt on 30/12/23.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject var dataContoller = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataContoller.persistancecontainer .viewContext)
        }
    }
}
