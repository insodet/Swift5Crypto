import Foundation
import CommonCrypto

public enum HMACAlgorithm {
    case sha256
    case sha384
    case sha512
}

public extension HMACAlgorithm {
    var commonCryptoAlgorithm: CCHmacAlgorithm {
        switch self {
        case .sha256:
            return CCHmacAlgorithm(kCCHmacAlgSHA256)
        case .sha384:
            return CCHmacAlgorithm(kCCHmacAlgSHA384)
        case .sha512:
            return CCHmacAlgorithm(kCCHmacAlgSHA512)
        }
    }

    var commonCryptoDigestLength: Int32 {
        switch self {
        case .sha256:
            return CC_SHA256_DIGEST_LENGTH
        case .sha384:
            return CC_SHA384_DIGEST_LENGTH
        case .sha512:
            return CC_SHA512_DIGEST_LENGTH
        }
    }
}

public func hmac(algorithm: HMACAlgorithm, key: Data, message: Data) -> Data {
    let context = UnsafeMutablePointer<CCHmacContext>.allocate(capacity: 1)
    defer { context.deallocate() }

    key.withUnsafeBytes { (pointer:UnsafeRawBufferPointer) in
        CCHmacInit(context, algorithm.commonCryptoAlgorithm, pointer.baseAddress, size_t(key.count))
    }

    message.withUnsafeBytes { (pointer:UnsafeRawBufferPointer) in
        CCHmacUpdate(context, pointer.baseAddress, size_t(message.count))
    }

    var hmac = Array<UInt8>(repeating: 0, count: Int(algorithm.commonCryptoDigestLength))
    CCHmacFinal(context, &hmac)

    return Data(hmac)
}
