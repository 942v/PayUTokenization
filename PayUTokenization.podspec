Pod::Spec.new do |s|
  s.name             = 'PayUTokenization'
  s.version          = '0.1.1'
  s.summary          = 'PayUTokenization for iOS is the way to go to tokenize card wiith PayU API'
  s.description      = "PayUTokenization for iOS is the way to go to tokenize card wiith PayU API, this SDK handles the conection and errors that can happen connecting to PayU API"

  s.homepage         = 'https://github.com/942v/PayUTokenization'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '942v' => 'gsaenz@proatomicdev.com' }
  s.source           = { :git => 'https://github.com/942v/PayUTokenization.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'PayUTokenization/Classes/**/*'
  s.dependency 'AFNetworking'
end
