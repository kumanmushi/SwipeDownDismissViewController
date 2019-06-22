Pod::Spec.new do |s|
  s.name         = "SwipeDownDismissViewController"
  s.version      = "1.0.0"
  s.summary      = "SwipeDownDismissViewController can dismiss UIViewCntrrller with swipe down."
  s.homepage     = "https://github.com/kumanmushi/SwipeDownDismissViewController"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Shinya Murata" => "shinyamurata0122@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/kumanmushi/SwipeDownDismissViewController.git", :tag => "#{s.version}" }
  s.source_files  = "SwipeDownDismissViewController/**/*.{swift}"
  s.swift_version = "5.0"
end
