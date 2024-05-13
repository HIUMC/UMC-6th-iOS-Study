
let myOptional: String?

myOptional = "Justin"

// let text: String = myOptional // Different data type. String? vs String
// let text: String = myOptional! // myOptional can't be nil

//if myOptional != nil {
//    let text: String = myOptional!
//} else {
//    print("myOptional was found to be nil")
//}

if let safeOptional = myOptional {
    let text: String = safeOptional // no longer using '!'
}

// Nil coalescing operator

let myOptional2: String?
myOptional2 = nil

let text2: String = myOptional2 ?? "I'm the default value" // if myOptional2 isn't nil, text2 = myOptional2. Otherwise, text2 gonna be "I'm the ..."

struct MyOptional {
    var property = 123
    func method() {
        print("struct method")
    }
}

let structMyOptional: MyOptional?

structMyOptional = MyOptional()
print(structMyOptional?.property) // Question mark check the value before its mark. If it is not nil, I can access to struct's property and method.
structMyOptional?.method()


