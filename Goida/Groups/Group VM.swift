import Foundation

@Observable
final class GroupVM {
    // https://dec.mgutm.ru/webapp/#/Rasp/List
    
    var searchPrompt = ""
    var rasp: [Datum] = []
    
    private var groups: [Group] = []
    
    init() {
        fetchGroupList()
    }
    
    var filteredGroups: [Group] {
        let prompt = searchPrompt.lowercased()
        
        if searchPrompt.isEmpty {
            return groups
        } else {
            return groups.filter {
                $0.kurs.description.contains(prompt) ||
                $0.name.lowercased().contains(prompt) ||
                $0.facul.lowercased().contains(prompt) ||
                $0.id.description.contains(prompt) ||
                $0.facultyID.description.contains(prompt)
            }
        }
    }
    
    // https://dec.mgutm.ru/api/Rasp?idGroup=29179&sdate=2024-09-07
    func fetchRasp(for groupId: Int, date: String) {
        let urlString = "https://dec.mgutm.ru/api/Rasp?idGroup=\(groupId)&sdate=\(date)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data else {
                print("No data")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let raspList = try decoder.decode(Welcome7.self, from: data)
                    
                    self.rasp = raspList.data
                } catch {
                    print("JSON decoding error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    // https://dec.mgutm.ru/api/raspGrouplist?year=2024-2025
    func fetchGroupList() {
        let urlString = "https://dec.mgutm.ru/api/raspGrouplist?year=2024-2025"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data else {
                print("No data")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let groupList = try decoder.decode(Welcome4.self, from: data)
                    
                    self.groups = groupList.data
                } catch {
                    print("JSON decoding error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
