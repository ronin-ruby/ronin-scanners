#
# Ronin Scanners - A Ruby library for Ronin that provides Ruby interfaces to
# various third-party security scanners.
#
# Copyright (c) 2008-2013 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'ronin/scanners/scanner'
require 'ronin/url'

require 'uri'

module Ronin
  module Scanners
    #
    # The {URLScanner} class represents scanners that yield `URI` results
    # and `URL` resources.
    #
    class URLScanner < Scanner

      protected

      #
      # Normalizes the URL.
      #
      # @param [String, URI::Generic] result
      #   The incoming URL.
      #
      # @return [URI::Generic]
      #   The normalized URI.
      #
      # @since 1.0.0
      #
      def normalize_result(result)
        unless result.kind_of?(::URI::Generic)
          begin
            URI.parse(result.to_s)
          rescue URI::InvalidURIError, URI::InvalidComponentError
          end
        else
          result
        end
      end

      #
      # Queries or creates a new Url resource for the given result.
      #
      # @param [URI::Generic] result
      #   The URL.
      #
      # @return [Url]
      #   The Url resource from the Database.
      #
      # @since 1.0.0
      #
      def new_resource(result)
        new_url = URL.from(result)

        new_url.last_scanned_at = Time.now
        return new_url
      end

    end
  end
end
