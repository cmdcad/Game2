//
//  StorageView.swift
//  Game2
//
//  Created by Mike on 4/12/25.
//

import Foundation
import UIKit

class StorageView: UIViewController {
    // The list of achievements that the player can get.
    enum Achievements : String, Codable {
        case startedPlaying
        case finishedGameInTenMinutes
        case foundAllSecretRooms
    }

    // The data that represents a saved game.
    class SavedGame : Codable {

        var levelNumber = 0
        var playerName = ""

        var achievements : Set<Achievements> = []
    }

    
    var data: Data!
    override func viewDidLoad() {
        super.viewDidLoad()
        let savedGame = SavedGame()
        
        // Store some data
        savedGame.levelNumber = 3
        savedGame.playerName = "Grabthar"
        savedGame.achievements.insert(Achievements.foundAllSecretRooms)
        
        
        do {
            // Encode the data
            let encoder = JSONEncoder()

            data = try encoder.encode(savedGame)

            // We can now write the data to disk
            print(String(data: data, encoding: .utf8)!)
        } catch let error {
            print("Failed to encode the saved game! \(error)")
        }
        
        let fileManager = FileManager.default
        guard let documentsURL = fileManager.urls(
            for: FileManager.SearchPathDirectory.documentDirectory,
            in:FileManager.SearchPathDomainMask.userDomainMask).last else {

            fatalError("Failed to find the documents folder!")
        }

        let savedGameURL = documentsURL
            .appendingPathComponent("SavedGame.json")

        do {
            try data.write(to: savedGameURL)
        } catch let error {
            print("Error writing: \(error)")
        }

        
        

        //You can load the data from disk by reading from the location:
        var loadedData : Data?

        do {
            loadedData = try Data(contentsOf: savedGameURL)
        } catch let error {
            print("Error reading: \(error)")
        }


    }
    
    
    
    

    class CurrencyManager {

        var gold : Int = 0

        var gems : Int {
            set(value) {
                // Set the updated count of gems in the user defaults system
                UserDefaults.standard.set(value, forKey: "gems")
            }

            get {
                // Ask the user defaults system for the current number of gems
                return UserDefaults.standard.integer(forKey: "gems")
            }
        }

        func endGame() {
            // When the game is over, reset gold but leave gems alone
            gold = 0
        }

    }
}
