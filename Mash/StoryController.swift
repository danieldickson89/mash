//
//  StoryController.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import Foundation
import CoreData

class StoryController {
    
    static let sharedController = StoryController()
    
    func numberGenerator() -> Int {
        var randomNum = 0
        while randomNum <= 2 {
            randomNum = Int(arc4random_uniform(21))
        }
        return randomNum
    }
    
    // This will return BOTH the process at which we eliminate elements and the resulting index for each list
    func getStory(num: Int) -> (theProcess: [Int], results: [Int]) {
        
        // This is the array we'll loop through, removing values until each array has one left with the appropriate index reference
        var answersArray: [[Int]] = [[0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3]]
        
        // We'll keep track of the totals for each array that are included in oneBigArray (meaning they'll drop from 2 to 0 when we finish each array)
        var firstTotal = 4
        var secondTotal = 4
        var thirdTotal = 4
        var fourthTotal = 4
        var fifthTotal = 4
        var sixthTotal = 4
        var seventhTotal = 4
        
        // Start the count at -1 so we're all set with zero index
        var count = -1
        
        // We need an empty array that we'll append to each time we eliminate an item so that we're left with the correct order in which we'll cross everything off at
        var everyIndexInOrder: [Int] = []
        
        // We'll do all of this until we have one element in each array
        while ((answersArray[0].count > 1) ||
            (answersArray[1].count > 1) ||
            (answersArray[2].count > 1) ||
            (answersArray[3].count > 1) ||
            (answersArray[4].count > 1) ||
            (answersArray[5].count > 1) ||
            (answersArray[6].count > 1)) {
                
                // We'll add them all to on big array each time to make it easier
                var oneBigArray: [Int] = []
                for i in 0 ..< answersArray.count {
                    // Only add the list values if they have more than 1 left still
                    if answersArray[i].count > 1 {
                        // Append each element of the array to our one BIG array
                        for j in 0 ..< answersArray[i].count {
                            oneBigArray.append(answersArray[i][j])
                        }
                    }
                }
                let totalCount = oneBigArray.count
                count += num
                if count >= oneBigArray.count {
                    count = (count % oneBigArray.count)
                }
                if ((count < answersArray[0].count) && firstTotal > 1) {
                    // The index is in the answersArray[0]
                    var index = count
                    if index >= totalCount {
                        index = (index % totalCount)
                    }
                    everyIndexInOrder.append(0)
                    everyIndexInOrder.append(answersArray[0][index])
                    if firstTotal == 2 {
                        // If we're losing the second element, we need to decrement the count by 1 to correct the offset for the next round
                        (answersArray[0][index] > answersArray[0][0] ? (count -= 1) : (count = count))
                        answersArray[0].removeAtIndex(index)
                        firstTotal -= 1
                    } else {
                        answersArray[0].removeAtIndex(index)
                    }
                    // No matter what we are always going to be minus one element after taking one out of the array
                    count -= 1
                    firstTotal -= 1
                } else if ((count < firstTotal + secondTotal) && (secondTotal > 1)) {
                    // The index is in the answersArray[1]
                    var index = count - firstTotal
                    if index >= totalCount {
                        index = (index % totalCount)
                    }
                    everyIndexInOrder.append(1)
                    everyIndexInOrder.append(answersArray[1][index])
                    if secondTotal == 2 {
                        (answersArray[1][index] > answersArray[1][0] ? (count -= 1) : (count = count))
                        answersArray[1].removeAtIndex(index)
                        secondTotal -= 1
                    } else {
                        answersArray[1].removeAtIndex(index)
                    }
                    // No matter what we are always going to be minus one element after taking one out of the array
                    count -= 1
                    secondTotal -= 1
                } else if ((count < firstTotal + secondTotal + thirdTotal) && (thirdTotal > 1)) {
                    // The index is in the answersArray[2]
                    var index = count - firstTotal - secondTotal
                    if index >= totalCount {
                        index = (index % totalCount)
                    }
                    everyIndexInOrder.append(2)
                    everyIndexInOrder.append(answersArray[2][index])
                    if thirdTotal == 2 {
                        (answersArray[2][index] > answersArray[2][0] ? (count -= 1) : (count = count))
                        answersArray[2].removeAtIndex(index)
                        thirdTotal -= 1
                    } else {
                        answersArray[2].removeAtIndex(index)
                    }
                    // No matter what we are always going to be minus one element after taking one out of the array
                    count -= 1
                    thirdTotal -= 1
                } else if ((count < firstTotal + secondTotal + thirdTotal + fourthTotal) && (fourthTotal > 1)) {
                    // The index is in the answersArray[3]
                    var index = count - firstTotal - secondTotal - thirdTotal
                    if index >= totalCount {
                        index = (index % totalCount)
                    }
                    everyIndexInOrder.append(3)
                    everyIndexInOrder.append(answersArray[3][index])
                    if fourthTotal == 2 {
                        (answersArray[3][index] > answersArray[3][0] ? (count -= 1) : (count = count))
                        answersArray[3].removeAtIndex(index)
                        fourthTotal -= 1
                    } else {
                        answersArray[3].removeAtIndex(index)
                    }
                    // No matter what we are always going to be minus one element after taking one out of the array
                    count -= 1
                    fourthTotal -= 1
                } else if ((count < firstTotal + secondTotal + thirdTotal + fourthTotal + fifthTotal) && (fifthTotal > 1)) {
                    // The index is in the answersArray[4]
                    var index = count - firstTotal - secondTotal - thirdTotal - fourthTotal
                    if index >= totalCount {
                        index = (index % totalCount)
                    }
                    everyIndexInOrder.append(4)
                    everyIndexInOrder.append(answersArray[4][index])
                    if fifthTotal == 2 {
                        (answersArray[4][index] > answersArray[4][0] ? (count -= 1) : (count = count))
                        answersArray[4].removeAtIndex(index)
                        fifthTotal -= 1
                    } else {
                        answersArray[4].removeAtIndex(index)
                    }
                    // No matter what we are always going to be minus one element after taking one out of the array
                    count -= 1
                    fifthTotal -= 1
                } else if ((count < firstTotal + secondTotal + thirdTotal + fourthTotal + fifthTotal + sixthTotal) && (sixthTotal > 1)) {
                    // The index is in the answersArray[5]
                    var index = count - firstTotal - secondTotal - thirdTotal - fourthTotal - fifthTotal
                    if index >= totalCount {
                        index = (index % totalCount)
                    }
                    everyIndexInOrder.append(5)
                    everyIndexInOrder.append(answersArray[5][index])
                    if sixthTotal == 2 {
                        (answersArray[5][index] > answersArray[5][0] ? (count -= 1) : (count = count))
                        answersArray[5].removeAtIndex(index)
                        sixthTotal -= 1
                    } else {
                        answersArray[5].removeAtIndex(index)
                    }
                    // No matter what we are always going to be minus one element after taking one out of the array
                    count -= 1
                    sixthTotal -= 1
                } else if ((count < firstTotal + secondTotal + thirdTotal + fourthTotal + fifthTotal + sixthTotal + seventhTotal) && (seventhTotal > 1)) {
                    // The index is in the answersArray[6]
                    var index = count - firstTotal - secondTotal - thirdTotal - fourthTotal - fifthTotal - sixthTotal
                    if index >= totalCount {
                        index = (index % totalCount)
                    }
                    everyIndexInOrder.append(6)
                    everyIndexInOrder.append(answersArray[6][index])
                    if seventhTotal == 2 {
                        (answersArray[6][index] > answersArray[6][0] ? (count -= 1) : (count = count))
                        answersArray[6].removeAtIndex(index)
                        seventhTotal -= 1
                    } else {
                        answersArray[6].removeAtIndex(index)
                    }
                    // No matter what we are always going to be minus one element after taking one out of the array
                    count -= 1
                    seventhTotal -= 1
                } else {
                    print("Error: Something went wrong")
                }
                
        }
        var theResults: [Int] = []
        for i in 0 ..< answersArray.count {
            for j in 0 ..< answersArray[i].count {
                theResults.append(answersArray[i][j])
            }
        }
        return (everyIndexInOrder, theResults)
    }
    
    func storyResults(mash: Mash, storyResults: [Int]) -> [String] {
        let homes = [mash.home1, mash.home2, mash.home3, mash.home4]
        let people = [mash.person1, mash.person2, mash.person3, mash.person4]
        let places = [mash.place1, mash.place2, mash.place3]
        let vehicles = [mash.vehicle1, mash.vehicle2, mash.vehicle3, mash.vehicle4]
        let careers = [mash.career1, mash.career2, mash.career3, mash.career4]
        let numbersForKids = [mash.numOfKids1, mash.numOfKids2, mash.numOfKids3, mash.numOfKids4]
        let pets = [mash.pet1, mash.pet2, mash.pet3, mash.pet4]
        let results = [homes[storyResults[0]]!, people[storyResults[1]]!, places[storyResults[2]]!, vehicles[storyResults[3]]!, careers[storyResults[4]]!, numbersForKids[storyResults[5]]!, pets[storyResults[6]]!]
        return results
    }
}