//
//  SkyesWardrobeApp.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-16.
//

import SwiftUI

@main
struct SkyesWardrobeApp: App {
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if mainVM.isUserLogin{
                    MainTabView()
                }else{
                    WelcomeView()
                }
                
            }
           
        }
    }
}
