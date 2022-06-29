
struct Data {
    var precent: Double = 0
    var numberOfPeople: Int = 2
    var billTotal : Double = 0
    
    mutating func calculate() -> String {
        String(format: "%.2f", (billTotal * (1.0 + precent)) / Double(numberOfPeople))
    }
    
}
