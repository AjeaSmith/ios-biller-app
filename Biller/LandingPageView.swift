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
            VStack{
                Text("Im the landing page baby")
                NavigationLink {
                    RootView().environment(\.managedObjectContext, persistenceController.container.viewContext)
                } label: {
                    Text("Get started")
                        .navigationBarHidden(true)
                        .navigationTitle("")
                }

            }
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
