//
//  SignInView.swift
//  SwiftUIOAuth
//
//  Created by Chee Ket Yung on 25/03/2021.
//

import SwiftUI

struct SignInViewUI: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SignInViewUI>) ->
        UIViewController {
        return FAM.shared.authViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController,
               context: UIViewControllerRepresentableContext<SignInViewUI>) {
        // empty
    }
}
