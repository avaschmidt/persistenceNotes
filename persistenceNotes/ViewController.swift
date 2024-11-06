import UIKit

public class Dog : Codable{
    var name : String
    var age : Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UITextField!
 @IBOutlet weak var textFieldOutlet: UITextField!
    //this gives us access to storage on the phone
    var defaults = UserDefaults.standard
    //takes the object and makes it into key value pairs
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    
    var names = ["Billy", "Bob", "Joe"]
    var dogs = [Dog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //get stuff from the phone
        var hs = defaults.integer(forKey: "highScore")
        var n = defaults.string(forKey: "name")
       var dog = defaults.object(forKey: "array")
        if let d = dog{
            let dd = d as! [String]
            for something in dd{
                print(something)
            }
        }
        
        
        
        //reading an array of objects from memory
        if let blahDogs = defaults.data(forKey: "theDogs"){
            if let decoded = try? decoder.decode([Dog].self, from: blahDogs){
                dogs = decoded
            }
        }
        for dogg in dogs{
            print(dogg.name)
        }
        print(hs)
        print(n)
        //print(dog)
        labelOutlet.text = "\(n): \(hs)"
        
        
    }

    @IBAction func saveAction(_ sender: UIButton) {
        var blah = Int(textFieldOutlet.text!)!
        dogs.append(Dog(name: "Bowser", age: 12))
        dogs.append(Dog(name: "Waldo", age: 10))
        //saving to the phone
        defaults.set(blah, forKey: "highScore")
        
        var blahName = nameOutlet.text!
        
        defaults.set(blahName, forKey: "name")
        defaults.setValue(names, forKey: "array")
        
        // saving an object to user defaults
        if let something = try? encoder.encode(dogs){
            defaults.setValue(dogs, forKey: "theDogs")
        }
    }
    
}

