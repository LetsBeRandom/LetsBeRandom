# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "rubygems"
require 'bundler'
Bundler.require

$short_version = '0.0'
$version = '0.%s' % Time.now.strftime('%y%m.%d%H%M')
$version_fingerprint = '%s/%s/%s' % [$short_version, $version, `git log -1 --format='format:%h'`.strip]

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = File.basename(File.dirname __FILE__)
  app.identifier = 'cc.mib.%s' % app.name
  app.info_plist['VersionFingerprint'] = $version_fingerprint
end

Motion::SettingsBundle.setup do |app|
  app.group 'App', footer: "Version: %s" % $version_fingerprint.split('/').join(' - '), titles: 'titles'
  app.child "Acknowledgements" do |ack|
    ack.child "CocoaPods", Title: 'CocoaPods' do end
  end
end
