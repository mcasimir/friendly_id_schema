#  Author::    Maurizio Casimirri (mailto:maurizio.cas@gmail.com)
#  Copyright:: Copyright (c) 2012 Maurizio Casimirri
#  
#  Permission is hereby granted, free of charge, to any person obtaining
#  a copy of this software and associated documentation files (the
#  "Software"), to deal in the Software without restriction, including
#  without limitation the rights to use, copy, modify, merge, publish,
#  distribute, sublicense, and/or sell copies of the Software, and to
#  permit persons to whom the Software is furnished to do so, subject to
#  the following conditions:
#  
#  The above copyright notice and this permission notice shall be
#  included in all copies or substantial portions of the Software.
#  
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'friendly_id'

module FriendlyIdSchema
  extend ActiveSupport::Concern
  
  module ClassMethods
    def permalink(method, options = {})
      use = options[:history] ? :history : :slugged
      
      field :slug, :index => { :unique => true }
      validates :slug, :presence => true, :uniqueness => true
      
      if ActiveRecord::Base.connection.table_exists?(self.table_name)
        self.send :extend, FriendlyId
        friendly_id method, :use => use        
      end
    end
  end
  
end

ActiveRecord::Base.send :include, FriendlyIdSchema