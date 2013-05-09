#
# Cookbook Name:: windows
# Attributes:: java
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

default[:java][:release] = "7u21"
if node[:kernel][:machine] == "x86_64"
  default[:java][:jdk_arch] = "x64"
else
  default[:java][:jdk_arch] = "i586"
end
default[:java][:jdk_dir] = "C:\\jdk"
default[:java][:jre_dir] = "C:\\jre"

set[:java][:checksum]["x64"] = "edc6386ca81233d3a2e179d7351c98ebea017c7e323633c42a76c9bf511ab990"
set[:java][:checksum]["i586"] = "dd172f6dd38f0d5ba1df17cb9ebfdb28f96f5e20c8d1961374671498d417cc2c"
