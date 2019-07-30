// Generated with quicktype
// For more options, try https://app.quicktype.io

import Foundation

struct ResponseDetail: Codable {
    let status: Status
    let data: AppointmentEvent
}

struct AppointmentEvent: Codable {
    let id, userID: Int
    let apName, apDescription: String
    let apStartTime, apEndTime: Int
    let apLocation: String
    let joinList: [Int]

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case apName = "ap_name"
        case apDescription = "ap_description"
        case apStartTime = "ap_startTime"
        case apEndTime = "ap_endTime"
        case apLocation = "ap_location"
        case joinList = "join_list"
    }
}

struct Status: Codable {
    let code, message: String
}

// MARK: Convenience initializers

extension ResponseDetail {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(ResponseDetail.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension AppointmentEvent {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(AppointmentEvent.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Status {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Status.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}



