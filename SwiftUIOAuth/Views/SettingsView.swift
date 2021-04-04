//
//  SettingsView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 28/03/2021.
//

import SwiftUI

struct SettingRowView : View {
    var title : String
    var systemImageName : String
    
    var body : some View {
        HStack (spacing : 15) {
            Image(systemName: systemImageName)
            Text (title)
        }
    }
}

struct SettingsView : View {
    
    @State private var showSignOutPrompt : Bool = false
    
    @EnvironmentObject private var userViewModel : UserViewModel
   
    
    var body : some View {
        
        NavigationView {
           List {
              // first section
              Section(header: Text("Account")) {
                  NavigationLink(destination: EmptyView(), label: {
                     SettingRowView(title: "My Account",
                     systemImageName: "person")
                  })
              }

              // second section
              Section(header: Text("More Features")) {
                   NavigationLink(destination: EmptyView(), label: {
                      SettingRowView(title: "Profit & Loss",
                      systemImageName:"dollarsign.circle")
                   })
                         
                   NavigationLink(destination: EmptyView(), label: {
                       SettingRowView(title: "Announcement",
                       systemImageName: "newspaper")
                   })
              }
            
            
              Section(header: Text("")) {
              
                    Button(action: {
                        self.showSignOutPrompt.toggle()
                    }){
                    
                       SettingRowView(title: "Sign Out", systemImageName: "arrow.backward.circle")
                      .foregroundColor(.gray)
                    }
                
              }
            
        
           }
           .navigationTitle(Text("Settings"))
        }
        .alert(isPresented : $showSignOutPrompt){

             Alert(title: Text("Are you sure you want to sign out now?"),
             primaryButton: .default(Text("Yes")) {
                
                userViewModel.signOut()
             },
             secondaryButton: .cancel(Text("No")))
        }

    }
}
