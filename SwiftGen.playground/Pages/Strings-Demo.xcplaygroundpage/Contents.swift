//: #### Other pages
//:
//: * [Demo for `colors` parser](Colors-Demo)
//: * [Demo for `coredata` parser](CoreData-Demo)
//: * [Demo for `files` parser](Files-Demo)
//: * [Demo for `fonts` parser](Fonts-Demo)
//: * [Demo for `ib` parser](InterfaceBuilder-Demo)
//: * [Demo for `json` parser](JSON-Demo)
//: * [Demo for `plist` parser](Plist-Demo)
//: * Demo for `strings` parser
//: * [Demo for `xcassets` parser](XCAssets-Demo)
//: * [Demo for `yaml` parser](YAML-Demo)

//: #### Example of code generated by `strings` parser with "structured-swift5" template

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// Some alert body there
  internal static let alertMessage = L10n.tr("Localizable", "alert__message", fallback: #"Some alert body there"#)
  /// Title for an alert
  internal static let alertTitle = L10n.tr("Localizable", "alert__title", fallback: #"Title of the alert"#)
  /// value1
  internal static let key1 = L10n.tr("Localizable", "key1", fallback: #"value1"#)
  /// These are %3$@'s %1$d %2$@.
  internal static func objectOwnership(_ p1: Int, _ p2: Any, _ p3: Any) -> String {
    return L10n.tr("Localizable", "ObjectOwnership", p1, String(describing: p2), String(describing: p3), fallback: #"These are %3$@'s %1$d %2$@."#)
  }
  /// This is a %% character.
  internal static let percent = L10n.tr("Localizable", "percent", fallback: #"This is a %% character."#)
  /// Hello, my name is "%@" and I'm %d
  internal static func `private`(_ p1: Any, _ p2: Int) -> String {
    return L10n.tr("Localizable", "private", String(describing: p1), p2, fallback: #"Hello, my name is "%@" and I'm %d"#)
  }
  /// Object: '%@', Character: '%c', Integer: '%d', Float: '%f', CString: '%s', Pointer: '%p'
  internal static func types(_ p1: Any, _ p2: CChar, _ p3: Int, _ p4: Float, _ p5: UnsafePointer<CChar>, _ p6: UnsafeRawPointer) -> String {
    return L10n.tr("Localizable", "types", String(describing: p1), p2, p3, p4, p5, Int(bitPattern: p6), fallback: #"Object: '%@', Character: '%c', Integer: '%d', Float: '%f', CString: '%s', Pointer: '%p'"#)
  }
  internal enum Apples {
    /// You have %d apples
    internal static func count(_ p1: Int) -> String {
      return L10n.tr("Localizable", "apples.count", p1, fallback: #"You have %d apples"#)
    }
  }
  internal enum Bananas {
    /// A comment with no space above it
    internal static func owner(_ p1: Int, _ p2: Any) -> String {
      return L10n.tr("Localizable", "bananas.owner", p1, String(describing: p2), fallback: #"Those %d bananas belong to %@."#)
    }
  }
  internal enum Settings {
    internal enum UserProfileSection {
      /// Here you can change some user profile settings.
      internal static let footerText = L10n.tr("Localizable", "settings.user__profile_section.footer_text", fallback: #"Here you can change some user profile settings."#)
      /// User Profile Settings
      internal static let headerTitle = L10n.tr("Localizable", "settings.user__profile_section.HEADER_TITLE", fallback: #"User Profile Settings"#)
    }
  }
  internal enum What {
    internal enum Happens {
      /// some comment
      internal static let here = L10n.tr("Localizable", "what./*happens*/.here", fallback: #"hello world! /* still in string */"#)
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    return Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type

//: #### Usage example

let alertTitle = L10n.alertTitle
let hello1 = L10n.private("David", 29)
let hello2 = L10n.private("Olivier", 32) // Prints as a string in the console because it's CustomStringConvertible

// note the inversion of parameters' order due to usage of %1$d, %2$@ and %1$@ in Localizable.strings
L10n.objectOwnership(3, "Apples", "John")
