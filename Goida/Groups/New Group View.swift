import SwiftUI

struct NewGroupView: View {
    @State private var vm = GroupVM()
    
    @State private var isSearching = false
    
    var body: some View {
        List {
            ForEach(vm.filteredGroups) { group in
                GroupCard(group)
            }
        }
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

#Preview {
    NewGroupView()
}
