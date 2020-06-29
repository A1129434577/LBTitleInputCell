Pod::Spec.new do |spec|
  spec.name         = "LBTitleInputCell"
  spec.version      = "1.0.0"
  spec.summary      = "左标题右输入框排列样式的LBTitleInputCell"
  spec.description  = "项目中用的比较多的左标题右输入框排列样式的cell，只需要传入一个titleArray，该cell讲自动计算titleArray最长的，以及自动排列输入框的最佳位置。"
  spec.homepage     = "https://github.com/A1129434577/LBTitleInputCell"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "刘彬" => "1129434577@qq.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = '8.0'
  spec.source       = { :git => 'https://github.com/A1129434577/LBTitleInputCell.git', :tag => spec.version.to_s }
  spec.dependency     "LBTextField"
  spec.source_files = "LBTitleInputCell/**/*.{h,m}"
  spec.requires_arc = true
end
#--use-libraries
