//
//  SOLIDViewController.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 03.12.2021.
//

import Foundation
import UIKit


//MARK:  - S
// not ok
class Car {
    let motor = Motor()
    let radio = Radio()
    
    func spinTheWheels() {
        //крутим колеса
    }
    
    func playMusic() {
        //включаем музыку
    }
}
class Motor {
    
}

class Radio {
    
}

//ok
class Car1 {
    let motor1 = Motor1()
    let radio1 = Radio1()
    
    func drive() {
        motor1.spinTheWheels()
    }
    
    func playMusic() {
        radio1.sing()
    }
}

class Motor1 {
    func spinTheWheels() {
        //крутим колеса
    }
}
class Radio1 {
    func sing() {
        //включаем музыку
    }
}


//MARK: - O

protocol MusicalInstruments {
    func play()
}
class Orchestra {
    let composition: [MusicalInstruments] = [Flute(), Drum(), Violin(), Violin(), Violin() ]
    
    func playMelody(){
        composition.forEach { instruments in
            instruments.play()
        }
    }
    
}

class Flute: MusicalInstruments {
    func play() {
        print("tyyyyyy tyyyy")
    }
}

class Drum: MusicalInstruments {
    func play() {
        print("bom bom tsss")
    }
}

class Violin: MusicalInstruments {
    func play() {
        print("iiiiiii")
    }
}


//MARK: - L

protocol Programmer {
    func writeCode() -> String
}

class Junior: Programmer {
    func writeCode() -> String {
        return "я это сделаю!"
    }
}

class Senior: Programmer {
    func writeCode() -> String {
        return "это не входит в текущую задачу"
    }
}

class TeamLead {
    func issueTask(worker: Programmer) {
        print(worker.writeCode())
    }
}

class Boss: TeamLead {
    func dismissWorker(worker: Programmer) {
        print("you dismiss!")
    }
}

class Company {
    let oleg = Junior()
    let petr = Senior()
    let dima = TeamLead()
    let hugo = Boss()
    
    func workProcess() {
        hugo.issueTask(worker: oleg)
        dima.issueTask(worker: oleg)
        hugo.issueTask(worker: petr)
        dima.issueTask(worker: petr)
        
        hugo.dismissWorker(worker: petr)
    }

}

//MARK: I
// NOT OK
protocol Musician {
    func sing()
    func playAnInstrument()
    func makeBeat()
}

class Oxxxy: Musician {
    func sing() {
        print("МОХ!")
    }
    
    func playAnInstrument() {
        print("Я не умею!")
    }
    
    func makeBeat() {
        print("куплю бит, от 10 минут!")
    }
}

//OK
protocol Signer {
    func sign()
}
protocol Instrumental {
    func playAnInstrument()
}
protocol Beatmaker {
    func makeBeat()
}

class LedyGaga: Signer, Instrumental {
    func sign() {
        print("ga ga ylalay")
    }
    func playAnInstrument() {
        print("А ЛЕГКО!")
    }
}
class Petya12YearsOld: Beatmaker {
    func makeBeat() {
        print("туц туц")
    }
}

//MARK: D

protocol Artist { }
extension LedyGaga: Artist { }
extension Petya12YearsOld: Artist { }

protocol Event {
  func perform(object: Artist)
}

class CityDay: Event {
    func perform(object: Artist) {

    }
}

class User {
    var name: String

    init(name: String) {
        self.name = name
    }
}


