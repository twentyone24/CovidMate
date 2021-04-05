//
//  WebView.swift
//  CovidMate
//
//  Created by NAVEEN MADHAN on 4/5/21.
//

import Foundation
import SafariServices
import SwiftUI

struct WebView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // No-op
    }
}
