import SwiftUI
import SwiftData

@main
struct GoidaApp: App {
    private let container: ModelContainer
    
    init() {
        let schema = Schema([
            SelectedGroup.self
        ])
        
        do {
            container = try ModelContainer(for: schema)
        } catch {
            fatalError("Failed to create model container")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            AppContainer()
        }
        .modelContainer(container)
    }
}
