//
//  LandingPageView.swift
//  Biller
//
//  Created by Ajea Smith on 10/30/22.
//

import SwiftUI

struct LandingPageView: View {
    let persistenceController = PersistenceController.shared
    
    @EnvironmentObject var billVM: BillViewModel
    
    @Binding var currentView: CurrentView
    
    var body: some View {
        ZStack {
            Color("Landing/background")
            VStack(spacing: 50){
                Image(systemName: "dollarsign.circle")
                    .font(.system(size: 100))
                    .foregroundColor(Color("Landing/accent"))
                
                Text("Welcome to BillR!")
                    .font(.largeTitle)
                    .foregroundColor(Color("Landing/text"))
                Text("Keep track of your monthly bills with BillR. Get started by enabling notifications to be notified when that next bill is approaching.")
                    .font(Font.landingText)
                    .foregroundColor(Color("Landing/text"))
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
                
                Button {
                    self.currentView = .mainView
                    billVM.enableNotifications()
                    
                } label: {
                    ZStack{
                        Capsule()
                            .frame(width: 189, height: 50)
                            .foregroundColor(Color("Landing/accent"))
                            .shadow(color: Color("Landing/shadow"), radius: 4, x: 0, y: 4)
                        HStack{
                            Spacer()
                            Text("Get Started")
                                .font(Font.landingText)
                                .foregroundColor(Color("Landing/button-text"))
                                .padding(.trailing, 5)
                                .navigationBarHidden(true)
                                .navigationTitle("")
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14))
                                .foregroundColor(Color("Landing/button-text"))
                            
                            Spacer()
                        }
                    }
                }
            }
            
        }.ignoresSafeArea()
    }
}
