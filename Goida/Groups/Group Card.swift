import ScrechKit

struct GroupCard: View {
    private let group: Group
    
    init(_ group: Group) {
        self.group = group
    }
    
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text(group.name)
                Text(group.id)
                Text(group.facul)
                Text(group.yearName)
                Text(group.facultyID)
                Text(group.kurs)
            }
        }
    }
}

//#Preview {
//
//}
