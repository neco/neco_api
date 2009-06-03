require 'rubygems'

gem 'relax', '~> 0.1.1'
require 'relax'

module NECO
  class API < Relax::Service
    endpoint 'http://:host/v1', :authenticator => :http_basic do
      defaults do
        parameter :per_page
        parameter :page
      end

      action :categories, :url => '/catalog/categories.xml' do
        parser :xml do
          elements 'category', :as => :categories do
            element 'id', :type => Integer
            element 'ticket-network-id', :type => Integer
            element 'parent-id', :type => Integer
            element 'name'
            element 'level', :type => Integer
            element 'created-at', :type => Time
            element 'updated-at', :type => Time
          end
        end
      end

      action :events, :url => '/catalog/events.xml' do
        parser :xml do
          elements 'event', :as => :events do
            element 'id', :type => Integer
            element 'ticket-network-id', :type => Integer
            element 'category-id', :type => Integer
            element 'venue-id', :type => Integer
            element 'venue-configuration-id', :type => Integer
            element 'name'
            element 'occurs-at', :type => Time
            element 'occurs-at', :as => 'occurs-at-raw'
            elements 'performer-id', :as => 'performer-ids', :type => Integer
            element 'created-at', :type => Time
            element 'updated-at', :type => Time
          end
        end
      end

      action :performers, :url => '/catalog/performers.xml' do
        parser :xml do
          elements 'performer', :as => :performers do
            element 'id', :type => Integer
            element 'ticket-network-id', :type => Integer
            element 'venue-id', :type => Integer
            element 'name'
            element 'sales-percent', :type => Float
            elements 'category-id', :as => 'category-ids', :type => Integer
            element 'created-at', :type => Time
            element 'updated-at', :type => Time
          end
        end
      end

      action :tickets, :url => '/catalog/events/:event_id/tickets.xml' do
        parser :xml do
          elements 'ticket', :as => :tickets do
            element 'id', :type => Integer
            element 'ticket-network-id', :type => Integer
            element 'event-id', :type => Integer
            element 'price', :type => Float
            element 'quantity', :type => Integer
            element 'section'
            element 'row'
            element 'notes'
            elements 'split', :as => 'splits', :type => Integer
            element 'is-mine'
            element 'created-at', :type => Time
            element 'updated-at', :type => Time
          end
        end
      end

      action :venues, :url => '/catalog/venues.xml' do
        parser :xml do
          elements 'venue', :as => :venues do
            element 'id', :type => Integer
            element 'ticket-network-id', :type => Integer
            element 'name'
            element 'street-address'
            element 'extended-address'
            element 'locality'
            element 'region'
            element 'postal-code'
            element 'country-code'
            element 'country-name'
            element 'created-at', :type => Time
            element 'updated-at', :type => Time
          end
        end
      end

      action :configurations, :url => '/catalog/venues/:venue_id/venue_configurations.xml' do
        parser :xml do
          elements 'venue-configuration', :as => :configurations do
            element 'id', :type => Integer
            element 'ticket-network-id', :type => Integer
            element 'venue-id', :type => Integer
            element 'name'
            element 'image-url'
            element 'created-at', :type => Time
            element 'updated-at', :type => Time
          end
        end
      end
    end
  end
end
