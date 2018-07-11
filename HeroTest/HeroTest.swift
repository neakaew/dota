import XCTest
@testable import dota
import ObjectMapper

extension Decodable {
    static func decode(from dict: Any) throws -> Self {
        let data = try JSONSerialization.data(withJSONObject: dict, options: [])
        return try JSONDecoder().decode(self, from: data)
    }
}

class HeroTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHero_fromDecoable() {
        let dict = json(from: "Hero")!
        let dummyHero = try! Hero.decode(from: dict)

        XCTAssertEqual(1, dummyHero.id)
        XCTAssertEqual("npc_dota_hero_antimage", dummyHero.name)
        XCTAssertEqual("Anti-Mage", dummyHero.localized_name)
        XCTAssertEqual("agi", (dummyHero.primary_attr).rawValue)
        XCTAssertEqual("Melee", (dummyHero.attack_type).rawValue)
        XCTAssertEqual(["Carry", "Escape", "Nuker"], dummyHero.roles)
        XCTAssertEqual(2, dummyHero.legs)

    }

    func testHero_fromObjectMapper() {
        let dict = json(from: "Hero")!
        let dummyHero = try! Hero(JSONObject: dict)

        XCTAssertEqual(1, dummyHero.id)
        XCTAssertEqual("npc_dota_hero_antimage", dummyHero.name)
        XCTAssertEqual("Anti-Mage", dummyHero.localized_name)
        XCTAssertEqual("agi", (dummyHero.primary_attr).rawValue)
        XCTAssertEqual("Melee", (dummyHero.attack_type).rawValue)
        XCTAssertEqual(["Carry", "Escape", "Nuker"], dummyHero.roles)
        XCTAssertEqual(2, dummyHero.legs)

    }

    func testExample() {
    }

    func testPerformanceExample() {
        self.measure {
        }
    }

}
