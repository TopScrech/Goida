import ScrechKit
import SwiftData

struct HomeView: View {
    @State private var vm = GroupVM()
    
    @Query(animation: .default) private var selectedGroups: [SelectedGroup]
    
    @State private var sheetNewGroup = false
    
    var body: some View {
        List {
            ForEach(selectedGroups) { group in
                Section {
                    VStack {
                        Text(group.name)
                        Text(group.groupId)
                    }
                }
            }            
        }
        .sheet($sheetNewGroup) {
            NavigationView {
                NewGroupView()
            }
        }
        .overlay {
            if selectedGroups.isEmpty {
                ContentUnavailableView {
                    Label("You have no groups yet", systemImage: "pc")
                } actions: {
                    Button("Add a new group") {
                        sheetNewGroup = true
                    }
                    .foregroundStyle(.green)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
