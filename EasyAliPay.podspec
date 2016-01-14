Pod::Spec.new do |s|
  s.name         = "EasyAliPay"
  s.version      = "0.0.1"
  s.summary      = "简单封装ali支付"
  s.description  = <<-DESC
					 简单封装ali支付
                   DESC

  s.homepage     = "https://github.com/Wmileo/EasyAliPay"
  s.license      = "MIT"
  s.author             = { "leo" => "work.mileo@gmail.com" }

  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/Wmileo/EasyAliPay.git", :tag => s.version.to_s }
  s.source_files  = "EasyAliPay/AliPay/*"
  #s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
end
