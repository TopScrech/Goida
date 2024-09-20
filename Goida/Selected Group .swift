import SwiftData

@Model
final class SelectedGroup {
    var name = ""
    var groupId = 228
    
    init(_ name: String, groupId: Int) {
        self.name = name
        self.groupId = groupId
    }
}
