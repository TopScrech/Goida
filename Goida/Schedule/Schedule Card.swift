import SwiftUI

struct ScheduleCard: View {
    private let schedule: Schedule
    
    init(_ schedule: Schedule) {
        self.schedule = schedule
    }
    
    var body: some View {
        Section {
            HStack {
                Text("Time")
                    .title3()
                
                VStack {
                    Text("Subject")
                    
                    Text("Docent")
                        .footnote()
                        .foregroundStyle(.secondary)
                }
                
                VStack {
                    Image(systemName: "location.fill")
                    
                    Text("Location")
                }
            }
        }
    }
}

//#Preview {
//    List {
//        ScheduleCard()
//    }
//}
