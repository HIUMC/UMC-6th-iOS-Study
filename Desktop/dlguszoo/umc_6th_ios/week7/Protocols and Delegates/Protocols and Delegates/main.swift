
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport? //대리자는 AdvancedLifeSupport 프로토콜을 채택해야 함
        
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport { //AdvancedLifeSupport 프로토콜 채택
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self //CPR 알람을 듣겠다
    }
    
    func performCPR() { //AdvancedLifeSupport 프로토콜 채택했으므로, CPR 기능 반드시 갖춰야 함
        print("The paramedic does chest compressions, 30 per second.")
    }
    
     
}

class Doctor: AdvancedLifeSupport { //AdvancedLifeSupport 프로토콜 채택
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self //CPR 알람을 듣겠다
    }
    
    func performCPR() { //AdvancedLifeSupport 프로토콜 채택했으므로, CPR 기능 반드시 갖춰야 함
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope() { //doctor의 또다른 기능
        print("Listening for heart sounds")
    }
    
}

class Surgeon: Doctor { //외과의사
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func userElectricDrill() {
        print("Whirr...")
    }
}

let emily = EmergencyCallHandler()
//let peter = Paramedic(handler: emily) //emily가 응급 상황(CPR) 통지해줌
let judy = Surgeon(handler: emily) //emily가 응급 상황(CPR) 통지해줌

emily.assessSituation() //emily가 먼저 상황 평가
emily.medicalEmergency() //응급 상황 발생, emily가 CPR 통지, 대리인인 peter가 CPR 시행

//-> 클래스가 뭐가 됐든 AdvancedLifeSupport를 채택한 클래스를 적용하면 performCPR()을 실행할 수 있다
