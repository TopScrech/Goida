import ScrechKit

struct NewGroupCard: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding private var showSheet: Bool
    private let group: Group
    
    init(_ showSheet: Binding<Bool>, _ group: Group) {
        _showSheet = showSheet
        self.group = group
    }
    
    @State private var showAlert = false
    @State private var name = ""
    
    private let images: [ImageResource] = [
        .th1, .th2, .th3, .th4, .th5, .th6, .th7
    ]
    
    var body: some View {
        Section {
            Button {
                showAlert = true
            } label: {
                HStack(spacing: 16) {
                    Image(systemName: "graduationcap.fill")
                        .title()
                        .foregroundStyle(.teal)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom) {
                            Text("Group: \(group.name)")
                            
                            Text(group.id)
                                .footnote()
                                .foregroundStyle(.secondary)
                        }
                        
                        HStack(alignment: .bottom) {
                            Text("Faculty: \(group.facul)")
                            
                            Text(group.facultyID)
                                .footnote()
                                .foregroundStyle(.secondary)
                        }
                        
                        Text("Kurs: \(group.kurs)")
                    }
                    
                    //                Image(images.randomElement()!)
                    //                    .resizable()
                    //                    .frame(width: 200, height: 100)
                    //                    .clipShape(.rect(cornerRadius: 16))
                }
                .foregroundStyle(.foreground)
            }
        }
        .alert("Add a new group", isPresented: $showAlert) {
            TextField(group.name, text: $name)
                .autocorrectionDisabled()
            
            Button("Add") {
                let groupName = name.isEmpty ? group.name : name
                let group = SelectedGroup(groupName, groupId: group.id)
                
                modelContext.insert(group)
                
                showSheet = false
            }
        } message: {
            Text("You can choose your own group name or keep the default one")
        }
    }
}

//#Preview {
//    NewGroupCard()
//}
