import ScrechKit

struct HomeView: View {
    @State private var vm = ScheduleVM()
    
    var body: some View {
        List {
            ForEach(vm.groups, id: \.id) { group in
                GroupCard(group)
            }
        }
        .refreshable {
            vm.fetchGroupList()
        }
    }
}

#Preview {
    HomeView()
}
