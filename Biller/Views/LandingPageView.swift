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
                Color("primary-color")
                VStack(spacing: 50){
                    Image(systemName: "dollarsign.circle")
                        .font(.system(size: 100))
                        .foregroundColor(Color("secondary-color"))
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolor")
                        .font(Font.landingText)
                        .foregroundColor(Color("secondary-color"))
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
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
