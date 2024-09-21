import SwiftUI

struct NewGroupView: View {
    @State private var vm = GroupVM()
    
    @Binding private var sheetNewGroup: Bool
    
    init(_ sheetNewGroup: Binding<Bool>) {
        _sheetNewGroup = sheetNewGroup
    }
    
    @State private var isSearching = false
    
    var body: some View {
        List {
            Text("Found \(vm.filteredGroups.count) groups")
            
            ForEach(vm.filteredGroups) { group in
                NewGroupCard($sheetNewGroup, group)
            }
        }
        .animation(.default, value: vm.filteredGroups)
        .searchable(text: $vm.searchPrompt, isPresented: $isSearching)
        .refreshable {
            vm.fetchGroupList()
        }
        .toolbar {
            Button {
                isSearching = true
            } label: {
                Image(systemName: "magnifyingglass")
            }
        }
    }
}

//#Preview {
//    NewGroupView()
//}
