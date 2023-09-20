import Foundation

#if os(iOS)
public func demo() {
    let resource = LocalizedStringResource(stringLiteral: "^[They](referentConcept: 1) said 'Hello 🌍'.")

    var options = AttributedString.LocalizationOptions()
    options.concepts = [.termsOfAddress([.masculine])]

    print(AttributedString(localized: resource, options: options))
}
#endif
