import UIKit


// ------------------------------------
//#-localizable-zone(Band00)
// Band Properties Structure
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Band01)
// This struct holds values for the scale, point, and rotation of the graphic.
//#-end-localizable-zone
public struct BandProperties {
    public var scale: Double
    public var point: Point
    public var rotation: Double
    
    public init(scale: Double, point: Point, rotation: Double = 0.0) {
        self.scale = scale
        self.point = point
        self.rotation = rotation
    }
}

// ------------------------------------
//#-localizable-zone(Band02)
// Gem Properties Structure
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Band03)
// This struct holds values for the image, sound, and point of the graphic.
//#-end-localizable-zone
public struct GemProperties {
    public var image: Image
    public var sound: SonicSound
    public var point: Point
    
    public init(image: Image, sound: SonicSound, point: Point) {
        self.image = image
        self.sound = sound
        self.point = point
    }
}

// ------------------------------------
//#-localizable-zone(Band04)
// Get Note Function
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Band05)
// This function returns a note from the notes array.
//#-end-localizable-zone
public func getNote(_ index:Int) -> Double {
    let notes = [1.0, 4.0, 5.0, 7.0, 9.0, 12.0, 13.0]
    return notes[index % notes.count]
}

// ------------------------------------
//#-localizable-zone(Band06)
// Create Crystal Function
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Band07)
// This function creates a Graphic that plays an Instrument when touched.
//#-end-localizable-zone
public func addBandElement(image: Image, instrument: Instrument.Kind, note: Double, rotation: Double, scale: Double, point: Point) {
    let bandElement = Graphic(image: image)
    bandElement.scale = Double.random(in: scale * 0.8...scale)
    bandElement.rotation = rotation
    bandElement.setOnTouchHandler {
        playInstrument(instrument, note: note, volume: 100)
        bandElement.shake(duration: 1)
        bandElement.glow()
    }
    scene.place(bandElement, at: point)
}


// ------------------------------------
//#-localizable-zone(Band08)
// Add Band Function
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Band09)
// This function creates a fan of Graphics that will all play a different note of an instrument.
//#-end-localizable-zone
public func addBand(image: Image, instrument: Instrument.Kind, point: Point, scale: Double) {
    let bandImage = image
    let bandInstrument = instrument
    let angles = [40, 25, 0, -30, -45]
    
    for i in 0..<angles.count {
        let xDistance = i * 30 - i * 9
        var yDistance: Int = 0
        if i == 0 || i == angles.count - 1 {
            yDistance = -Int(bandImage.size.height / 8.5)
        } else {
            yDistance = -Int(bandImage.size.height / 15)
        }
        let bandPoint = Point(x: xDistance + Int(point.x) , y: Int(point.y) + yDistance)
        
        addBandElement(
            image: bandImage,
            instrument: bandInstrument,
            note: getNote(i),
            rotation: Double(angles[i]),
            scale: scale,
            point: bandPoint
        )
    }
}


// ------------------------------------
//#-localizable-zone(Band10)
// Spinning Gem Function
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Band11)
// This function creates a Graphic that plays a sound and spins when touched.
//#-end-localizable-zone
public func spinningGem(image: Image, period: Double, sound: SonicSound) -> Graphic {
    let gem = Graphic(image: image)
    gem.scale = Double.random(in: 0.07...0.15)
    gem.setOnTouchHandler {
        playSound(sound, volume: 100)
        gem.spin(period: period)
    }
    return gem
}




