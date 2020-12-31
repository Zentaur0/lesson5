//
//  main.swift
//  lesson5
//
//  Created by Антон Сивцов on 31.12.2020.
//

import Foundation

enum BrandSport {
    case porshe, ferrari, bugatti
}

enum BrandTrunk {
    case volvo, man, daf
}

enum ReleaseYear {
    case year2020, year2019, year2018
}

enum SportMode: String {
    case turnedOn
    case turnedOff
}

enum Spotlights: String {
    case activate
    case dectivate
}

enum Windows: String {
    case open = "открыты"
    case closed = "закрыты"
}

enum TrunkOccupancy: String {
    case full = "полный"
    case empty = "пустой"
}

protocol Car {
    var releaseYear: ReleaseYear { get }
    var trunkVolume: Double { get }
    var engine: Bool { get set }
    var windows: Windows { get set }
    var trunkOccupancy: TrunkOccupancy { get set }
    
    func transform()
    func destroy()
}

extension Car {
    mutating func engineMode() {
        if engine == false {
            engine = true
        } else {
            engine = false
        }
    }
    
    mutating func windowsMode() {
        if windows == Windows.open {
            windows = Windows.closed
        } else {
            windows = Windows.open
        }
    }
    
    mutating func changeTrunkOccupancy() {
        if trunkOccupancy == TrunkOccupancy.empty {
            trunkOccupancy = TrunkOccupancy.full
        } else {
            trunkOccupancy = TrunkOccupancy.empty
        }
    }
}

class SportCar: Car {
    let releaseYear: ReleaseYear
    let trunkVolume: Double
    var engine: Bool {
        didSet {
            print("Состояние двигателя автомобиля было изменено")
        }
    }
    var windows: Windows {
        didSet {
            print("Состояние окон автомобиля было изменено")
        }
    }
    var trunkOccupancy: TrunkOccupancy {
        didSet {
            print("Наполненность багажника автомобиля была изменена")
        }
    }
    let brand: BrandSport
    var sportMode: SportMode {
        didSet {
            print("Супер-сверх-режим активирован")
        }
        willSet {
            print("В таком виде мы ничего не сомжем сделать...")
        }
    }
    
    func transform() { //спортивный автобот
        print("Трансформируюсь! Автоботы вперед!")
    }
    
    func destroy() {
        print("Уничтожить всех врагов, пиф-паф")
    }
    
    internal init(releaseYear: ReleaseYear, trunkVolume: Double, engine: Bool, windows: Windows, trunkOccupancy: TrunkOccupancy, brand: BrandSport, sportMode: SportMode) {
        self.releaseYear = releaseYear
        self.trunkVolume = trunkVolume
        self.engine = engine
        self.windows = windows
        self.trunkOccupancy = trunkOccupancy
        self.brand = brand
        self.sportMode = sportMode
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Описание машины: год релиза - \(releaseYear), объем багажника - \(trunkVolume), состояние двигателя - \(engine), состояние окон - \(windows), зполненность багажника - \(trunkOccupancy), брэнд - \(brand), спортивный режим - \(sportMode)"
            }
    func describe() {
        print(description)
    }
}

class TrunkCar: Car {
    let releaseYear: ReleaseYear
    let trunkVolume: Double
    var engine: Bool {
        didSet {
            print("Состояние двигателя грузовика было изменено")
        }
    }
    var windows: Windows {
        didSet {
            print("Состояние окон грузовика было изменено")
        }
    }
    var trunkOccupancy: TrunkOccupancy {
        didSet {
            print("Наполненность кузова грузовика была изменена")
        }
    }
    let brand: BrandTrunk
    var spotlights: Spotlights {
        didSet {
            print("Сверхсветовые прожекторы активированы, но бесполезны. Ослепить всех!")
        }
    }

    func transform() { //грузовой десептикон
        print("Десептиконы повержаны, крх крхкх крхкхкхккк...")
    }

    func destroy() {
        print("Мы все умрем, аргххгргрх")
    }
    
    internal init(releaseYear: ReleaseYear, trunkVolume: Double, engine: Bool, windows: Windows, trunkOccupancy: TrunkOccupancy, brand: BrandTrunk, spotlights: Spotlights) {
        self.releaseYear = releaseYear
        self.trunkVolume = trunkVolume
        self.engine = engine
        self.windows = windows
        self.trunkOccupancy = trunkOccupancy
        self.brand = brand
        self.spotlights = spotlights
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Описание грузовика: год релиза - \(releaseYear), объем кузова - \(trunkVolume), состояние двигателя - \(engine), состояние окон - \(windows), зполненность кузова - \(trunkOccupancy), брэнд - \(brand), состояние прожекторов - \(spotlights)"
            }
    func describe() {
        print(description)
    }
}

var sportCar = SportCar(releaseYear: .year2018, trunkVolume: 132, engine: false, windows: .open, trunkOccupancy: .empty, brand: .ferrari, sportMode: .turnedOff)
var trunkCar = TrunkCar(releaseYear: .year2019, trunkVolume: 3000, engine: false, windows: .closed, trunkOccupancy: .full, brand: .daf, spotlights: .dectivate)

sportCar.sportMode = .turnedOn
sportCar.transform()
sportCar.destroy()
trunkCar.engine = false
trunkCar.spotlights = .activate
trunkCar.destroy()
trunkCar.transform()
sportCar.engineMode()
sportCar.windowsMode()
trunkCar.changeTrunkOccupancy()
sportCar.describe()
trunkCar.describe()
