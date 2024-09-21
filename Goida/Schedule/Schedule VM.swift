import Foundation

@Observable
final class ScheduleVM {
    var schedules: [Schedule] = []
    
    init() {
        fetchSchedules()
    }
    
    func fetchSchedules() {
        
    }
}
