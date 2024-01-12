//: #### Other pages
//:
//: * [Demo for `colors` parser](Colors-Demo)
//: * [Demo for `coredata` parser](CoreData-Demo)
//: * [Demo for `files` parser](Files-Demo)
//: * [Demo for `fonts` parser](Fonts-Demo)
//: * [Demo for `ib` parser](InterfaceBuilder-Demo)
//: * Demo for `json` parser
//: * [Demo for `plist` parser](Plist-Demo)
//: * [Demo for `strings` parser](Strings-Demo)
//: * [Demo for `xcassets` parser](XCAssets-Demo)
//: * [Demo for `yaml` parser](YAML-Demo)

// setup code
// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    return Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
bundle = BundleToken.bundle

//: #### Example of code generated by `json` parser with "inline-swift5" template

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - JSON Files

// swiftlint:disable identifier_name line_length number_separator type_body_length
internal enum JSONFilesInline {
  internal enum Array {
    internal static let items: [String] = ["Anna", "Bob"]
  }
  internal enum Configuration {
    internal static let apiVersion: String = "2"
    internal static let country: Any? = nil
    internal static let environment: String = "staging"
    internal static let options: [String: Any] = ["screen-order": ["1", "2", "3"]]
  }
}
// swiftlint:enable identifier_name line_length number_separator type_body_length

//: #### Example of code generated by `json` parser with "runtime-swift5" template

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - JSON Files

// swiftlint:disable identifier_name line_length type_body_length
internal enum JSONFilesRuntime {
  internal enum Array {
    internal static let items: [String] = objectFromJSON(at: "array.json")
  }
  internal enum Configuration {
    private static let _document = JSONDocument(path: "configuration.json")
    internal static let apiVersion: String = _document["api-version"]
    internal static let country: Any? = _document["country"]
    internal static let environment: String = _document["environment"]
    internal static let options: [String: Any] = _document["options"]
  }
}
// swiftlint:enable identifier_name line_length type_body_length

//: #### Usage Example

// Access content embedded inline in Swift
let list = JSONFilesInline.Array.items
let dictionary = JSONFilesInline.Configuration.options
let name = JSONFilesInline.Configuration.environment

// Or access content by loading JSON file at runtime
let stringValue = JSONFilesRuntime.Configuration.apiVersion
let info = JSONFilesRuntime.Configuration.options
