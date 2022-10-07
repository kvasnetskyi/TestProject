// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localization {
  /// Localizable.strings
  ///   TestProject
  /// 
  ///   Created by Artem Kvasnetskyi on 06.10.2022.
  internal static let ok = Localization.tr("Localizable", "OK", fallback: "OK")
  internal enum AnimalRow {
    /// Premium
    internal static let premium = Localization.tr("Localizable", "AnimalRow.Premium", fallback: "Premium")
  }
  internal enum Error {
    /// Failed to decode file.
    internal static let decoding = Localization.tr("Localizable", "Error.Decoding", fallback: "Failed to decode file.")
    internal enum Bundle {
      /// The file could not be found.
      internal static let fileNotFound = Localization.tr("Localizable", "Error.Bundle.FileNotFound", fallback: "The file could not be found.")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
