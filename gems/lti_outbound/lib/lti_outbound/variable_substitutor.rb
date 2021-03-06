#
# Copyright (C) 2013 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

module LtiOutbound
  class VariableSubstitutor
    #This method changes given data_hash!
    def substitute!(data_hash, substitution_object)
      data_hash.each do |key, val|
        if substitution_object.has_variable_mapping?(val)
          replacement_value = substitution_object.variable_substitution_mapping(val)
          data_hash[key] = replacement_value if replacement_value
        end
      end
    end

    def substitute_all!(data_hash, *substitution_objects)
      substitution_objects.compact.each {|obj| substitute!(data_hash, obj)}
    end
  end
end