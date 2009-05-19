require 'rubygems'

gem 'relax', '~> 0.1.1'
require 'relax'

module NECO
  class API < Relax::Service
    endpoint 'http://localhost:3000/v1', :authenticator => :http_basic do
      defaults do
        parameter :per_page
        parameter :page
      end

      action :categories, :url => '/catalog/categories.xml' do
        parser :xml do
          element :categories do
            elements :category do
              element 'id', :type => Integer
              element 'ticket-network-id', :type => Integer
              element 'parent-id', :type => Integer
              element 'name'
              element 'level', :type => Integer
              element 'created-at', :type => DateTime
              element 'updated-at', :type => DateTime
            end
          end
        end
      end

      action :events, :url => '/catalog/events.xml' do
        parser :xml do
          element :events do
            elements :event do
              element 'id', :type => Integer
              element 'ticket-network-id', :type => Integer
              element 'category-id', :type => Integer
              element 'venue-id', :type => Integer
              element 'venue-configuration-id', :type => Integer
              element 'name'
              element 'occurs-at', :type => DateTime
              element 'created-at', :type => DateTime
              element 'updated-at', :type => DateTime
            end
          end
        end
      end

      action :performers, :url => '/catalog/performers.xml' do
        parser :xml do
          element :performers do
            elements :performer do
              element 'id', :type => Integer
              element 'ticket-network-id', :type => Integer
              element 'venue-id', :type => Integer
              element 'name'
              element 'created-at', :type => DateTime
              element 'updated-at', :type => DateTime
            end
          end
        end
      end

      action :tickets, :url => '/catalog/tickets.xml' do
        parser :xml do
          element :tickets do
            elements :ticket do
              element 'id', :type => Integer
              element 'ticket-network-id', :type => Integer
              element 'event-id', :type => Integer
              element 'price', :type => Float
              element 'quantity', :type => Integer
              element 'section'
              element 'row'
              element 'notes'
              elements 'splits' do
                element 'split', :type => Integer
              end
              element 'created-at', :type => DateTime
              element 'updated-at', :type => DateTime
            end
          end
        end
      end

      action :venues, :url => '/catalog/venues.xml' do
        parser :xml do
          element :venues do
            elements :venue do
              element 'id', :type => Integer
              element 'ticket-network-id', :type => Integer
              element 'name'
              element 'street-address'
              element 'extended-address'
              element 'locality'
              element 'region'
              element 'postal-code'
              element 'country-code'
              element 'created-at', :type => DateTime
              element 'updated-at', :type => DateTime
            end
          end
        end
      end

      action :venue_configurations, :url => '/catalog/venue_configurations.xml' do
        parser :xml do
          element :venue_configurations do
            elements :venue_configuration do
              element 'id', :type => Integer
              element 'ticket-network-id', :type => Integer
              element 'venue-id', :type => Integer
              element 'name'
              element 'image-url'
              element 'created-at', :type => DateTime
              element 'updated-at', :type => DateTime
            end
          end
        end
      end
    end
  end
end
