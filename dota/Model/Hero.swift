import Foundation
import ObjectMapper

struct Hero: Decodable, ImmutableMappable {

    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
        localized_name = try map.value("localized_name")
        primary_attr = try map.value("primary_attr")
        attack_type = try map.value("attack_type")
        roles = try map.value("roles")
        legs = try map.value("legs")

    }

    var id: Int
    var name: String
    var localized_name: String
    var primary_attr: Attribute
    var attack_type: AttrackType
    var roles: [String]
    var legs: Int

    enum Attribute: String, Decodable {
        case agi
        case str
        case int
    }

    enum AttrackType: String, Decodable {
        case melee = "Melee"
        case ranged = "Ranged"
    }

//    enum CodeingKeys: String, CodingKey { //กำหนดค่าไม่ให้มี _ เพื่อนำไปใช้งาน
//        case id
//        case name
//        case localizedname = "localized_name"
//        case primaryattr = "primary_attr"
//        case attacktype = "attack_type"
//        case roles
//        case legs
//    }
//    init(from decoder: Decoder) throws {
//        let values = try! decoder.container(keyedBy: CodeingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        name = try values.decode(String.self, forKey: .name)
//        localizedname = try values.decode(String.self, forKey: .localizedname)
//        primaryattr = try values.decode(Attribute.self, forKey: .primaryattr)
//        attacktype = try values.decode(AttrackType.self, forKey: .attacktype)
//        roles = try values.decode([String].self, forKey: .roles)
//        legs = try values.decode(Int.self, forKey: .legs)
//    }
}
