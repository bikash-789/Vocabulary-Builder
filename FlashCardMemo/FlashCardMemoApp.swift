//
//  FlashCardMemoApp.swift
//  FlashCardMemo
//
//  Created by Bikash Chauhan on 20/05/2023.
//

import SwiftUI
import Firebase
@main
struct FlashCardMemoApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
