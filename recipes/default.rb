#
# Author:: Doug MacEachern <dougm@vmware.com>
# Cookbook Name:: windows
# Recipe:: default
#
# Copyright 2010, VMware, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# You want to get the offline installers from here: 
# http://www.oracle.com/technetwork/java/javase/downloads/jre7-downloads-1880261.html

installer = ["jre", node[:java][:release], "windows", node[:java][:jdk_arch]].join("-") + ".exe"

java_home = node[:java][:jdk_dir]
jre_home = node[:java][:jre_dir]

dst = "#{java_home}\\#{installer}"

directory java_home do
  action :create
end

remote_file dst do
  source "#{node[:java][:mirror]}/#{installer}"
  checksum node[:java][:checksum][node[:java][:jdk_arch]]
  not_if { File.exists?(dst) }
end

execute "install #{installer}" do
  command "#{dst} /s STATIC=0 WEB_JAVA=0 INSTALLDIR=#{jre_home}"
  not_if { File.exists?("#{jre_home}/bin/javaws.exe") }
end

env "JAVA_HOME" do
  action :create
  value jre_home
end

env "PATH" do
  action :modify
  delim File::PATH_SEPARATOR
  value "%JAVA_HOME%\\bin"
end
