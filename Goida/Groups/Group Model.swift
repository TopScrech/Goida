struct Welcome4: Decodable {
    let data: [Group]
    let state: Int
    let msg: String
}

struct Group: Decodable, Identifiable, Equatable {
    let name: String
    let id: Int
    let kurs: Int
    let facul: String
    let yearName: String
    let facultyID: Int
}
