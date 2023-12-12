//
//  ContentView.swift
//  12-4-kit
//
//  Created by Kenny Luchau on 12/11/23.
//

import SwiftUI
import PDFKit
import WebKit

struct PDFView: UIViewRepresentable {
    var pdfName: String // Name of the PDF file
    
    func makeUIView(context: Context) -> PDFKit.PDFView {
        let pdfView = PDFKit.PDFView()
        if let pdfURL = Bundle.main.url(forResource: pdfName, withExtension: "pdf") {
            if let document = PDFDocument(url: pdfURL) {
                pdfView.document = document
            }
        }
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFKit.PDFView, context: Context) {}
}

struct WebView: UIViewRepresentable {
    var urlString: String // URL of the webpage
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        TabView {
            
            VStack {
                PDFView(pdfName: "feature_diagram")
                    .edgesIgnoringSafeArea(.all)
            }
            .tabItem {
                Label("PDF", systemImage: "doc.richtext.fill")
            }
            
            VStack {
                WebView(urlString: "https://shop.geekjack.net")
                    .edgesIgnoringSafeArea(.all)
            }
            .tabItem {
                Label("Web", systemImage: "globe")
            }
        }
    }
}
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
