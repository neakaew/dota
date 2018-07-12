import OHHTTPStubs
import XCTest
@testable import dota

class heroPresenterTest: XCTestCase {
    

    
    func test_getHeroesSuccess() {
        stub(condition: isHost("api.opendota.com") ) { (_) -> OHHTTPStubsResponse in
            let stubPath = OHPathForFile("Heroes.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
        
        let presenter = GetHeroesPresenter()
        presenter.getHeros()
       
        
    }
}
