import ScrechKit

struct GroupCard: View {
    private let group: Group
    
    init(_ group: Group) {
        self.group = group
    }
    
    @State private var showAlert = false
    @State private var name = ""
    
    var body: some View {
        Section {
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
        }
    }
}

//#Preview {
//
//}
