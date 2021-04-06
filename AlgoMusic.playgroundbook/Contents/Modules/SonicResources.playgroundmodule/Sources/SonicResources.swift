//
//  SonicResources.swift
//
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import SPCAudio

/// An enumeration of all the different sounds that can be played.
///
/// - localizationKey: SonicSound
public enum SonicSound: Sound {

    case alien
    
}

/// Plays the given sound. Optionally, specify a volume from `0` (silent) to `100` (loudest), with `80` being the default.
///
/// - Parameter sonicSound: The sound to be played.
/// - Parameter volume: The volume at which the sound is to be played (ranging from `0` to `100`).
///
/// - localizationKey: playSound(sonicSound:volume:)
public func playSound(_ sonicSound: SonicSound, volume: Int = 80) {
    playSound(sonicSound.rawValue, volume: volume)
}

extension Loop {
    /// Creates a Loop with the specified sound and `loopFireHandler`.
    ///
    /// - Parameter sound: The sound played by the Loop.
    /// - Parameter loopFireHandler: The function that gets called each time the loop starts playing the associated sound.
    ///
    /// - localizationKey: Loop(sonicSound:loopFireHandler:)
    public convenience init(sound: SonicSound, loopFireHandler: (()->Void)? = nil) {
        self.init(sound: sound.rawValue, loopFireHandler: loopFireHandler)
    }
}

/// An enumeration of the different types of Music you can play.
///
/// - localizationKey: SonicMusic
public enum SonicMusic: Music {

    case cave
    
}

/// Plays the given music. Optionally, specify a volume from `0` (silent) to `100` (loudest), with `75` being the default.
///
/// - Parameter sonicMusic: The music to be played.
/// - Parameter volume: The volume at which the music is to be played (ranging from `0` to `100`).
///
/// - localizationKey: playMusic(sonicMusic:volume:)
public func playMusic(_ sonicMusic: SonicMusic, volume: Int = 75) {
    playMusic(sonicMusic.rawValue, volume: volume)
}
