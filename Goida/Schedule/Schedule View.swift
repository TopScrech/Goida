import SwiftUI
import SwiftData

struct ScheduleView: View {
    @State private var vm = ScheduleVM()
    
    @Query(animation: .default) private var selectedGroups: [SelectedGroup]
    
    @AppStorage("selected_group") private var selectedGroup = 0
    
    var body: some View {
        List {
            Section {
                if let group = selectedGroups.first(where: {
                    $0.groupId == selectedGroup
                }) {
                    VStack(alignment: .leading) {
                        Text(group.name)
                        
                        Text(group.groupId)
                            .secondary()
                            .footnote()
                    }
                }
            }
            
            ForEach(vm.schedules) { schedule in
                ScheduleCard(schedule)
            }
        }
        .toolbar {
            Menu {
                Section {
                    Button("No group selected") {
                        selectedGroup = 0
                    }
                }
                
                ForEach(selectedGroups) { group in
                    Button {
                        selectedGroup = group.groupId
                    } label: {
                        Label(group.name, systemImage: selectedGroup == group.groupId ? "checkmark" : "")
                        
                        Text(group.groupId)
                    }
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
}

//#Preview {
//    ScheduleView()
//}
