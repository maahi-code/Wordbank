//
//  VocabularyEntry.swift
//  Wordbank
//
//  Created by Mahipal Singh on 25/09/26.
//
import SwiftUI

enum PartOfSpeech: String, CaseIterable {
    case noun, pronoun, verb, adjective, adverb, preposition, conjunction, interjection, determiner
}
struct VocabularyEntry: Identifiable {
    let id = UUID()
    let term: String
    let definition: String
    let partOfSpeech: PartOfSpeech
    let syllabification: String
    let note: String
    let reviewCount: Int
    let addedDate: Date
    let lastSeenDate: Date

    var isMastered: Bool = false
    
    
    static let mockEntries: [VocabularyEntry] = [
        VocabularyEntry(
            term: "meticulous",
            definition: "very careful and precise about small details",
            partOfSpeech: .adjective,
            syllabification: "me·tic·u·lous",
            note: "My manager used this word to describe Dana’s carefully prepared spreadsheets.",
            reviewCount: 7,
            addedDate: .now.addingTimeInterval(days: -44),
            lastSeenDate: .now.addingTimeInterval(days: -2),
            isMastered: true
        ),
        VocabularyEntry(
            term: "serendipity",
            definition: "the chance discovery of something valuable or delightful",
            partOfSpeech: .noun,
            syllabification: "ser·en·dip·i·ty",
            note: "Finding that quiet bookstore while walking through the city felt like serendipity.",
            reviewCount: 10,
            addedDate: .now.addingTimeInterval(days: -90),
            lastSeenDate: .now.addingTimeInterval(days: -1),
            isMastered: true
        ),
        VocabularyEntry(
            term: "resilient",
            definition: "able to recover quickly from difficulty or change",
            partOfSpeech: .adjective,
            syllabification: "re·sil·ient",
            note: "I heard this used when discussing how a team recovered after a difficult project.",
            reviewCount: 6,
            addedDate: .now.addingTimeInterval(days: -35),
            lastSeenDate: .now.addingTimeInterval(hours: -6)
        ),
        VocabularyEntry(
            term: "eloquent",
            definition: "fluent and persuasive in speaking or writing",
            partOfSpeech: .adjective,
            syllabification: "el·o·quent",
            note: "The speaker gave an eloquent explanation without using complicated language.",
            reviewCount: 12,
            addedDate: .now.addingTimeInterval(days: -120),
            lastSeenDate: .now.addingTimeInterval(days: -7),
            isMastered: true
        ),
        VocabularyEntry(
            term: "ephemeral",
            definition: "lasting for only a very short time",
            partOfSpeech: .adjective,
            syllabification: "ephem·er·al",
            note: "Cherry blossoms are beautiful but ephemeral.",
            reviewCount: 3,
            addedDate: .now.addingTimeInterval(days: -14),
            lastSeenDate: .now.addingTimeInterval(days: -3)
        ),
        VocabularyEntry(
            term: "pragmatic",
            definition: "focused on practical solutions and real-world results",
            partOfSpeech: .adjective,
            syllabification: "prag·mat·ic",
            note: "We chose the pragmatic solution instead of rebuilding the entire feature.",
            reviewCount: 8,
            addedDate: .now.addingTimeInterval(days: -60),
            lastSeenDate: .now.addingTimeInterval(days: -12),
            isMastered: true
        ),
        VocabularyEntry(
            term: "ambiguous",
            definition: "open to more than one possible meaning",
            partOfSpeech: .adjective,
            syllabification: "am·big·u·ous",
            note: "The instructions were ambiguous, so everyone understood them differently.",
            reviewCount: 5,
            addedDate: .now.addingTimeInterval(days: -25),
            lastSeenDate: .now.addingTimeInterval(days: -5)
        ),
        VocabularyEntry(
            term: "tenacious",
            definition: "persistent and unwilling to give up",
            partOfSpeech: .adjective,
            syllabification: "te·na·cious",
            note: "She was tenacious while debugging the issue and eventually found the cause.",
            reviewCount: 9,
            addedDate: .now.addingTimeInterval(days: -75),
            lastSeenDate: .now.addingTimeInterval(days: -1),
            isMastered: true
        ),
        VocabularyEntry(
            term: "benevolent",
            definition: "kind, generous, and willing to help others",
            partOfSpeech: .adjective,
            syllabification: "be·nev·o·lent",
            note: "The story described a benevolent ruler who cared about the community.",
            reviewCount: 4,
            addedDate: .now.addingTimeInterval(days: -40),
            lastSeenDate: .now.addingTimeInterval(days: -8)
        ),
        VocabularyEntry(
            term: "nostalgia",
            definition: "a sentimental longing for a time or place in the past",
            partOfSpeech: .noun,
            syllabification: "nos·tal·gia",
            note: "Listening to old songs gives me a strong feeling of nostalgia.",
            reviewCount: 15,
            addedDate: .now.addingTimeInterval(months: -6),
            lastSeenDate: .now.addingTimeInterval(days: -15),
            isMastered: true
        ),
        VocabularyEntry(
            term: "candid",
            definition: "honest and direct, even when the truth is difficult",
            partOfSpeech: .adjective,
            syllabification: "can·did",
            note: "She gave candid feedback about what needed to improve.",
            reviewCount: 5,
            addedDate: .now.addingTimeInterval(days: -20),
            lastSeenDate: .now.addingTimeInterval(days: -4)
        ),
        VocabularyEntry(
            term: "ubiquitous",
            definition: "present or appearing seemingly everywhere",
            partOfSpeech: .adjective,
            syllabification: "ubiq·ui·tous",
            note: "Smartphones have become ubiquitous in everyday life.",
            reviewCount: 2,
            addedDate: .now.addingTimeInterval(days: -10),
            lastSeenDate: .now.addingTimeInterval(hours: -2)
        )
    ]
}



