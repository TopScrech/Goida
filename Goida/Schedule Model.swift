struct Welcome4: Decodable {
    let data: [Group]
    let state: Int
    let msg: String
}

struct Group: Decodable, Identifiable {
    let name: String
    let id: Int
    let kurs: Int
    let facul: String
    let yearName: String
    let facultyID: Int
}

struct Welcome7: Decodable {
    let data: [Datum]
    let state: Int
    let msg: String
}

struct Datum: Decodable {
    let name: String
    let id, kurs: Int
    let facul: String
    let yearName: String
    let facultyID: Int
}
