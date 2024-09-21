import SwiftUI

struct ScheduleView: View {
    @State private var vm = ScheduleVM()
    
    var body: some View {
        List {
            ForEach(vm.schedules) { schedule in
                ScheduleCard(schedule)
            }
        }
    }
}

#Preview {
    ScheduleView()
}
