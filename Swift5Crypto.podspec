Pod::Spec.new do |s|
  s.name         = "Swift5Crypto"
  s.version      = "0.0.3"
  s.summary      = "Wstunes's library for Crypto using Swift, adapted to Swift 5"
  s.homepage     = "https://github.com/insodet/Swift5Crypto"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Wstunes" => "wangshuogr@qq.com" }
  s.platform     = :ios, "13.0"
  s.source       = { :git => "https://github.com/insodet/Swift5Crypto.git", :tag => s.version }
  s.source_files = 'Sources/**/*.swift'
  s.preserve_paths = 'CocoaPods/**/*'
  s.swift_version = '5.0'
  s.pod_target_xcconfig = {

  }
end