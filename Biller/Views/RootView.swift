//
//  RootView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import CoreData

enum CurrentView {
    case landing, mainView
}
struct RootView: View {
    @StateObject var billVM = BillViewModel()
    
    @State var currentView: CurrentView = .landing
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray5
    }
    
    var body: some View {
        switch currentView {
        case .landing:
            LandingPageView(currentView: $currentView)
                .environmentObject(billVM)
        case .mainView:
            TabBarView()
                .environmentObject(billVM)
        }
    }
}
