#
# Ronin Scanners - A Ruby library for Ronin that provides Ruby interfaces to
# various third-party security scanners.
#
# Copyright (c) 2008-2011 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/ui/cli/scanner_command'
require 'ronin/scanners/ssh'

module Ronin
  module UI
    module CLI
      module Commands
        class SSH < ScannerCommand

          desc 'Performs SSH bruteforcing against a host'

          # The port that SSH is listening on
          class_option :port, :type => :numeric,
                              :default => scanner.port,
                              :aliases => '-p'

          # The path to the user-name wordlist
          class_option :user_list, :type => :string,
                                   :aliases => '-U'

          # The path to the password wordlist
          class_option :password_list, :type => :string,
                                       :aliases => '-P'

          # The host that is running SSH
          argument :host, :required => true

          #
          # Runs the {Ronin::Scanners::SSH} scanner.
          #
          # @since 1.0.0
          #
          def execute
            print_info 'Saving captured SSH credentials ...' if options.saved?

            scan!

            print_info 'All valid SSH credentials saved.' if options.save?
          end

          protected

          #
          # Prints a SSH scan result.
          #
          # @param [Hash{Symbol => String}] credential
          #   The SSH scan result to print.
          #
          # @since 1.0.0
          #
          def print_result(credential)
            puts "#{credential[:username]}:#{credential[:password]}"
          end

          #
          # Prints a Service Credential.
          #
          # @param [ServiceCredential] credential
          #   The Service Credential to print.
          #
          # @since 1.0.0
          #
          def print_resource(credential)
            puts credential
          end
        end
      end
    end
  end
end
