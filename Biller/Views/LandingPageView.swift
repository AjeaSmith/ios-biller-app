//
//  LandingPageView.swift
//  Biller
//
//  Created by Ajea Smith on 10/30/22.
//

import SwiftUI

struct LandingPageView: View {
    let persistenceController = PersistenceController.shared
    
    @Binding var currentView: CurrentView
    
    var body: some View {
        ZStack {
            Color("primary-color")
            VStack(spacing: 50){
                Image(systemName: "dollarsign.circle")
                    .font(.system(size: 100))
                    .foregroundColor(Color("secondary-color"))
                
                Text("Keep track of your monthly bills with Biller. Head over to \"Settings\" to enable notifications to be notified when that next bill is approaching.")
                    .font(Font.landingText)
                    .foregroundColor(Color("secondary-color"))
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
                
                Button {
                    self.currentView = .mainView
                } label: {
                    ZStack{
                        Capsule()
                            .frame(width: 189, height: 50)
                            .foregroundColor(Color("landing-button"))
                            .shadow(color: Color("shadow"), radius: 4, x: 0, y: 4)
                        HStack{
                            Spacer()
                            Text("Get Started")
                                .font(Font.landingText)
                                .foregroundColor(Color("primary-color"))
                                .padding(.trailing, 5)
                                .navigationBarHidden(true)
                                .navigationTitle("")
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14))
                                .foregroundColor(Color("primary-color"))
                            
                            Spacer()
                        }
                    }
                }
            }
            
        }.ignoresSafeArea()
    }
}
