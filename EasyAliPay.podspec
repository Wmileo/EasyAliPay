Pod::Spec.new do |s|
  s.name         = "EasyAliPay"
  s.version      = "0.0.1"
  s.summary      = "简单封装ali支付"
  s.description  = <<-DESC
					 简单封装ali支付
           支付宝(中国)网络技术有限公司
                   DESC

  s.homepage     = "https://github.com/Wmileo/EasyAliPay"
  s.license      = "MIT"
  s.author             = { "leo" => "work.mileo@gmail.com" }

  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/Wmileo/EasyAliPay.git", :tag => s.version.to_s }
  s.source_files  = "EasyAliPay/AliPay/*"
  s.frameworks   = 'SystemConfiguration'
  s.exclude_files = "EasyAliPay/AliPay/AliPay/*"
  s.requires_arc = true

  s.resource = "EasyAliPay/AliPay/*.bundle"
  s.vendored_frameworks = 'EasyAliPay/AliPay/*.{framework}'

  s.subspec "Core" do |core|
    core.source_files = 'EasyAliPay/AliPay/AliPay/*'
    core.private_header_files = "EasyAliPay/AliPay/AliPay/openssl/*.h"
    core.exclude_files = "EasyAliPay/AliPay/AliPay/Util/*"
  end

end
