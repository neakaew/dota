import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet var textview: UITextView!
    
//    let heroPresenter = GetHeroesPresenter()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // Hero()
//        textview.text = "Loading"
//        fetchHero { (text) in
//            DispatchQueue.main.async {
//                 self.textview.text = text
//            }
//
//        }
//    }
    
    let heroPresenter = GetHeroesPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        heroPresenter.delegate = self
        textview.text = "Loading"
        heroPresenter.getHeros()
        
    }
}

extension ViewController: GetHeroesPresenterProtocol {
    func getHeroes(didFinishedWithSuccess heroes: [Hero]) {
        DispatchQueue.main.async {
            self.textview.text = heroes.debugDescription
        }
    }
    func getHeroes(didFinishedWithError error: Error) {
        DispatchQueue.main.async {
            self.textview.text = error.localizedDescription
        }
    }
    
}



    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    func Hero() {
//        Alamofire.request("https://api.opendota.com/api/heroes").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//
//        }
//    }


