Pod::Spec.new do |s|
  s.name = "Closurable"
  s.version = "0.2"
  s.summary = "Simple, easy and lightweight library for MVVM."
  # s.description  = ""
  s.homepage = "https://github.com/AcaiBowl/Closurable"
  # s.screenshots  = "https://raw.githubusercontent.com/AcaiBowl/Closurable/master/usage.gif"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Toru Asai" => "acaibowl.dev@gmail.com" }
  s.social_media_url = "http://twitter.com/_acaibowl"
  s.platform = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"
  s.source = { :git => "https://github.com/AcaiBowl/Closurable.git", :tag => "#{s.version}" }
  s.source_files = "Closurable", "Closurable/**/*.swift"
  # s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Closurable/**/*.h"
  # s.resource = "icon.png"
  # s.resources = "Resources/*.png"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # s.framework = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library = "iconv"
  # s.libraries = "iconv", "xml2"
  # s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
end
