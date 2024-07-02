//
//  aboutStory.swift
//  Choose your own adventure
//
//  Created by 이수현 on 6/27/24.
//

import Foundation

class AboutStory {
    var selectNum = 0
    let stories = [
        Story(title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.", choice_1: "I'll hop in. Thanks for help. ", destination_1: 2, choice_2: " Well, I don't have many options. Better ask him if he's a murderer.", destination_2: 1),
        Story(title: "He nods slowly, unphased by the question.", choice_1: "At least he's honest. I'll climb in", destination_1: 2, choice_2: "Wait, I know how to change a tire.", destination_2: 3),
        Story(title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.", choice_1: "I love Elton John! Hand him the cassette tape.", destination_1: 5, choice_2: ": It’s him or me. Take the knife and stab him.", destination_2: 4),
        Story(title: "What? Such a cop-out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?", choice_1: "The", destination_1: 0, choice_2: "End", destination_2: 0),
        Story(title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in. ", choice_1: "The", destination_1: 0, choice_2: "End", destination_2: 0),
        Story(title: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier'", choice_1: "The", destination_1: 0, choice_2: "End", destination_2: 0)
    ]
    
    func updateTitle_1() -> String {
        selectNum = stories[selectNum].destination_1
        return stories[selectNum].title
    }
    
    func updateTitle_2() -> String{
        selectNum = stories[selectNum].destination_2
        return stories[selectNum].title
    }
    
    func updateChoice_1() -> String {
        return stories[selectNum].choice_1
    }
    
    func updateChoice_2() -> String {
        return stories[selectNum].choice_2
    }
}


