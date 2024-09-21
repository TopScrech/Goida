import SwiftUI
import SwiftData

struct ScheduleView: View {
    @State private var vm = ScheduleVM()
    
    @Query(animation: .default) private var selectedGroups: [SelectedGroup]
    
    @State private var selectedGroup = 0
    
    var body: some View {
        List {
            Text("Selected group \(selectedGroup)")
            
            
            ForEach(vm.schedules) { schedule in
                ScheduleCard(schedule)
            }
        }
        .onChange(of: selectedGroup) { _, newValue in
            print("newValue: \(newValue)")
        }
        .safeAreaInset(edge: .top) {
            Picker("Selected Groups", selection: $selectedGroup) {
                Text("No Group Selected")
                    .tag(0)
                
                ForEach(selectedGroups) { group in
                    Text(group.name)
                        .tag(group.id)
                }
            }
        }
    }
}

//#Preview {
//    ScheduleView()
//}
