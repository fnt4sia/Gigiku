import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                HomePage()
                    .tabItem {
                        Label("Beranda", systemImage: "house.fill")
                    }
                ArtikelPage()
                    .tabItem {
                        Label("Artikel", systemImage: "book.pages")
                    }
                ReportPage()
                    .tabItem {
                        Label("Laporan", systemImage: "note.text")
                    }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
