#
# Author:: Adam Jacob (<adam@opscode.com>)
# Copyright:: Copyright (c) 2008 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/resource/package'
require 'chef/provider/package/apt'

class Chef
  class Resource
    class AptPackage < Chef::Resource::Package

      provides :apt_package
      provides :package, os: "linux", platform_family: [ "debian" ]

      def initialize(name, run_context=nil)
        super
        @resource_name = :apt_package
        @default_release = nil
      end

      def default_release(arg=nil)
        set_or_return(
          :default_release,
          arg,
          :kind_of => [ String ]
        )
      end

    end
  end
end
