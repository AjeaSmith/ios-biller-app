//
//  RootView.swift
//  Biller
//
//  Created by Ajea Smith on 10/26/22.
//

import SwiftUI
import CoreData

struct RootView: View {
    
    @StateObject var billVM = BillViewModel()
    
    @State private var isPresented = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray5
    }
    
    var body: some View {
       TabBarView()
        .environmentObject(billVM)
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
