# Copyright © 2012 The Pennsylvania State University
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

class AddGroupsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :group_list, :string
    add_column :users, :groups_last_update, :datetime
    add_column :users, :ldap_available, :boolean
    add_column :users, :ldap_last_update, :datetime
  end

  def self.down
    remove_column :users, :group_list
    remove_column :users, :groups_last_update
    remove_column :users, :ldap_available
    remove_column :users, :ldap_last_update
  end
end