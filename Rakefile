# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'README'

  app.deployment_target = '9.0'
  app.device_family = [:iphone]
  app.frameworks << 'SafariServices'
  app.identifier = 'com.liulantao.README'

  app.icons = ['icons/icon-1024.png', 'icons/icon-120.png', 'icons/icon-180.png', 'icons/icon-58.png', 'icons/icon-80.png', 'icons/icon-87.png']
  app.prerendered_icon = false
  app.version = '1.0.0'

  app.development do
    app.provisioning_profile = 'mobileprovision/README_Development.mobileprovision'
  end
end
