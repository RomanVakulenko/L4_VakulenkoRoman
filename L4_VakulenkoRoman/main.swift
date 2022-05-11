//
//  main.swift
//  L4_VakulenkoRoman
//
//  Created by Roman Vakulenko on 11.05.2022.
//

import Foundation

//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
enum TypeOfCar {
    case sportOne
    case truck
}
enum Fuel{
    case gasoline
    case diezel
}
//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
class Car {
    let brand: String
    let type: TypeOfCar
    let productionYear: Int
    var trunkVolume: Int
    
    init(brand: String, type: TypeOfCar, productionYear: Int, trunkVolume: Int){
        self.brand = brand
        self.type = type
        self.productionYear = productionYear
        self.trunkVolume = trunkVolume
    }
    
    func changeSmth(changeType: TypeOfCar, changeFuel: Fuel, trunkVolume: Int) {
    }
}
//2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
class TrunkCar: Car {
    var wheels: Int
    var fuel: Fuel
    
    init(brand: String, type: TypeOfCar, productionYear: Int, trunkVolume: Int, wheels: Int, fuel: Fuel) {
        self.wheels = wheels
        self.fuel = fuel
        super.init(brand: brand, type: type, productionYear: productionYear, trunkVolume: trunkVolume)
    }
    
    override func changeSmth(changeType: TypeOfCar, changeFuel: Fuel, trunkVolume: Int) {
        if fuel == .diezel{
            fuel = .gasoline
            print("We changed a type of fuel!")
        }
            
        if trunkVolume > 999 {
            print("But this is a truck, because of trunk Volume = \(trunkVolume)")
        }
        else {
            print("This is not a truck, probably a SportCar")
        }

        switch fuel {
        case.gasoline:
            print("Warning!\(TypeOfCar.truck) uses \(Fuel.diezel) - buy ONLY diezel!")
        default:
            print("this part won't be used")
        }
    }
}
class SportCar: Car {
    var amountOfSeats: Int
    var speed: Int
    
    init(brand: String, type: TypeOfCar, productionYear: Int, trunkVolume: Int, amountOfSeats: Int, speed: Int) {
        self.amountOfSeats = amountOfSeats
        self.speed = speed
        super.init(brand: brand, type: type, productionYear: productionYear, trunkVolume: trunkVolume)
    }
    
    override func changeSmth(changeType: TypeOfCar, changeFuel: Fuel, trunkVolume: Int) {
        if amountOfSeats < 3 {
            print("This is a SportCar")
        }
        else {
            print("This is a spechial version with 3 seats")
        }
    }
}
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.
var porshe911 = SportCar(brand: "Porshe", type: .sportOne, productionYear: 2021, trunkVolume: 200, amountOfSeats: 2, speed: 120)
porshe911.amountOfSeats = 3
porshe911.speed = 320
porshe911.changeSmth(changeType: .sportOne, changeFuel: .diezel, trunkVolume: 900)
print("exclusive car - \(porshe911.brand) - a \(porshe911.type.self),\n production year is \(porshe911.productionYear),\n trunkVolume = \(porshe911.trunkVolume),\n but it has more seats then usual one = \(porshe911.amountOfSeats), with high speed of \(porshe911.speed) km/hour")

var maz9230 = TrunkCar(brand: "MAZ", type: .truck, productionYear: 2010, trunkVolume: 8900, wheels: 6, fuel: .diezel)
maz9230.changeSmth(changeType: .sportOne, changeFuel: .diezel, trunkVolume: 9999)

print(maz9230.fuel, "\n1 - we inited maz with diezel,\n2 - we changed fuel type to gasoline via function 'changeSmth'")
