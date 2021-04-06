import UIKit

public let scene = Scene()
// ------------------------------------
//#-localizable-zone(Crystals01)
// Create Crystal Function
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Crystals02)
// This function creates a Graphic that plays a sound and glows when touched.
//#-end-localizable-zone
public func createGraphic(image: Image, sound: SonicSound) -> Graphic {
    let graphic = Graphic(image: image)

    graphic.setOnTouchHandler {
        playSound(sound, volume: 100)
        graphic.glow()
    }
    
    return graphic
}

// ------------------------------------
//#-localizable-zone(Crystals03)
// Create Graphic Loops Function
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Crystals04)
// This function creates a Graphic that toggles a loop on and off when touched.
//#-end-localizable-zone
public func createGraphicLoop(image: Image, sound: SonicSound) -> Graphic {
    let graphic = Graphic(image: image)
    graphic.scale = 0.5
    
    let loop = Loop(sound: sound)

    graphic.setOnTouchHandler {
        loop.toggle()
        graphic.glow()
    }
    
    return graphic
}


// ------------------------------------
//#-localizable-zone(Crystals05)
// Create Colored Graphic Function
//#-end-localizable-zone
// ------------------------------------
//#-localizable-zone(Crystals06)
// This function creates a Graphic that changes color when you touch and drag across it and plays a sound when touched once.
//#-end-localizable-zone
public func createColorGraphic(image: Image, sound: SonicSound) -> Graphic {
    let graphic = Graphic(image: image)
    
    graphic.setOnTouchMovedHandler { touch in
        let color = Color(hue: touch.position.x, saturation: 0.5, brightness: 1.0, alpha: 0.6)
        graphic.setTintColor(color, blend: 1.0)
    }
    
    graphic.setOnTouchHandler {
        playSound(sound, volume: 100)
    }
    
    return graphic
}

