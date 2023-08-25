//
//  MainView.swift
//  WhatsUp
//
//  Created by Christopher Winter on 25.08.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            GroupListContainerView()
                .tabItem{
                    Label("Chats", systemImage: "message")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
