//
//  LandingPageView.swift
//  Biller
//
//  Created by Ajea Smith on 10/30/22.
//

import SwiftUI

struct LandingPageView: View {
    let persistenceController = PersistenceController.shared
    var body: some View {
        NavigationView {
            ZStack {
                Color("landing-background")
                VStack(spacing: 50){
                    Image(systemName: "dollarsign.circle")
                        .font(.system(size: 100))
                        .foregroundColor(Color("landing-text"))
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolor")
                        .font(Font.landingText)
                        .foregroundColor(Color("landing-text"))
                        .frame(width:240)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink {
                        RootView().environment(\.managedObjectContext, persistenceController.container.viewContext)
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
                                    .foregroundColor(Color("landing-button-text"))
                                    .padding(.trailing, 5)
                                    .navigationBarHidden(true)
                                    .navigationTitle("")

                                Image(systemName: "arrow.right")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("landing-background"))
                                Spacer()
                            }
                        }
                    }
                }

            }.ignoresSafeArea()
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
