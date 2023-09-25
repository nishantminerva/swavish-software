//
//  MainView.swift
//  Swavish Software
//
//  Created by Nishant Minerva on 24/09/23.
//



import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            infoView
            
        } else {
            LoginView()
        }
    }
    


    @ViewBuilder
    var infoView: some View {
            ProfileView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
