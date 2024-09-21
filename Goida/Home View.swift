import SwiftUI

struct HomeView: View {
    @AppStorage("selected_tab") private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ScheduleView()
                .tag(0)
                .tabItem {
                    Label("Scheudle", systemImage: "calendar")
                }
            
            GroupList()
                .tag(1)
                .tabItem {
                    Label("Groups", systemImage: "graduationcap")
                }
        }
    }
}

#Preview {
    HomeView()
}
