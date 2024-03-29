import Foundation

public extension Data {
    /// These methods return a compressed or decompressed version of the receiver using the specified algorithm
    
    @available(iOS 13.0, macOS 10.15, *)
    func compressed(using algorithm: NSData.CompressionAlgorithm) throws -> Data {
        try (self as NSData).compressed(using: algorithm) as Data
    }

    @available(iOS 13.0, macOS 10.15, *)
    func decompressed(using algorithm: NSData.CompressionAlgorithm) throws -> Data {
        try (self as NSData).decompressed(using: algorithm) as Data
    }
}
