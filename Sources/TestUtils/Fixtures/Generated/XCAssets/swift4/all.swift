// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import ARKit
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Files {
    internal static let data = DataAsset(name: "Data")
    internal enum Json {
      internal static let data = DataAsset(name: "Json/Data")
    }
    internal static let readme = DataAsset(name: "README")
  }
  internal enum Food {
    internal enum Exotic {
      internal static let banana = ImageAsset(name: "Exotic/Banana")
      internal static let mango = ImageAsset(name: "Exotic/Mango")
    }
    internal enum Round {
      internal static let apricot = ImageAsset(name: "Round/Apricot")
      internal static let apple = ImageAsset(name: "Round/Apple")
      internal enum Double {
        internal static let cherry = ImageAsset(name: "Round/Double/Cherry")
      }
      internal static let tomato = ImageAsset(name: "Round/Tomato")
    }
    internal static let `private` = ImageAsset(name: "private")
  }
  internal enum Other {
  }
  internal enum Styles {
    internal enum _24Vision {
      internal static let background = ColorAsset(name: "24Vision/Background")
      internal static let primary = ColorAsset(name: "24Vision/Primary")
    }
    internal static let orange = ImageAsset(name: "Orange")
    internal enum Vengo {
      internal static let primary = ColorAsset(name: "Vengo/Primary")
      internal static let tint = ColorAsset(name: "Vengo/Tint")
    }
  }
  internal enum Symbols {
    internal static let exclamationMark = SymbolAsset(name: "Exclamation Mark")
    internal static let plus = SymbolAsset(name: "Plus")
  }
  internal enum Targets {
    internal static let bottles = ARResourceGroupAsset(name: "Bottles")
    internal static let paintings = ARResourceGroupAsset(name: "Paintings")
    internal static let posters = ARResourceGroupAsset(name: "Posters")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ARResourceGroupAsset {
  internal fileprivate(set) var name: String

  #if os(iOS)
  @available(iOS 11.3, *)
  internal var referenceImages: Set<ARReferenceImage> {
    return ARReferenceImage.referenceImages(in: self)
  }

  @available(iOS 12.0, *)
  internal var referenceObjects: Set<ARReferenceObject> {
    return ARReferenceObject.referenceObjects(in: self)
  }
  #endif
}

#if os(iOS)
@available(iOS 11.3, *)
internal extension ARReferenceImage {
  static func referenceImages(in asset: ARResourceGroupAsset) -> Set<ARReferenceImage> {
    let bundle = BundleToken.bundle
    return referenceImages(inGroupNamed: asset.name, bundle: bundle) ?? Set()
  }
}

@available(iOS 12.0, *)
internal extension ARReferenceObject {
  static func referenceObjects(in asset: ARResourceGroupAsset) -> Set<ARReferenceObject> {
    let bundle = BundleToken.bundle
    return referenceObjects(inGroupNamed: asset.name, bundle: bundle) ?? Set()
  }
}
#endif

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = Color(asset: self)

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct DataAsset {
  internal fileprivate(set) var name: String

  @available(iOS 9.0, tvOS 9.0, watchOS 6.0, macOS 10.11, *)
  internal var data: NSDataAsset {
    return NSDataAsset(asset: self)
  }
}

@available(iOS 9.0, tvOS 9.0, watchOS 6.0, macOS 10.11, *)
internal extension NSDataAsset {
  convenience init!(asset: DataAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS) || os(watchOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(macOS)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct SymbolAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(watchOS)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  internal typealias Configuration = UIImage.SymbolConfiguration
  internal typealias Image = UIImage

  @available(iOS 12.0, tvOS 12.0, watchOS 5.0, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load symbol asset named \(name).")
    }
    return result
  }

  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  internal func image(with configuration: Configuration) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, with: configuration) else {
      fatalError("Unable to load symbol asset named \(name).")
    }
    return result
  }
  #endif
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    return Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
