Pod::Spec.new do |s|
  s.name = "Closurable"
  s.version = "0.3"
  s.summary = "Simple, easy and lightweight library for MVVM."
  s.homepage = "https://github.com/AcaiBowl/Closurable"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Toru Asai" => "acaibowl.dev@gmail.com" }
  s.social_media_url = "http://twitter.com/_acaibowl"
  s.platform = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source = { :git => "https://github.com/AcaiBowl/Closurable.git", :tag => "#{s.version}" }
  s.source_files = "Closurable", "Closurable/**/*.swift"
  s.public_header_files = "Closurable/**/*.h"
end
