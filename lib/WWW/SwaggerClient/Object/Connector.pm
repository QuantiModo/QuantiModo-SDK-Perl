package WWW::SwaggerClient::Object::Connector;

require 5.6.0;
use strict;
use warnings;
use utf8;
use JSON qw(decode_json);
use Data::Dumper;
use Module::Runtime qw(use_module);
use Log::Any qw($log);
use Date::Parse;
use DateTime;

use base "WWW::SwaggerClient::Object::BaseObject";

#
#
#
#NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
#

my $swagger_types = {
      'id' => 'int',
      'name' => 'string',
      'display_name' => 'string',
      'image' => 'string',
      'get_it_url' => 'string',
      'connected' => 'string',
      'connect_instructions' => 'string',
      'last_update' => 'int',
      'latest_data' => 'int',
      'no_data_yet' => 'boolean'
};

my $attribute_map = {
      'id' => 'id',
      'name' => 'name',
      'display_name' => 'displayName',
      'image' => 'image',
      'get_it_url' => 'getItUrl',
      'connected' => 'connected',
      'connect_instructions' => 'connectInstructions',
      'last_update' => 'lastUpdate',
      'latest_data' => 'latestData',
      'no_data_yet' => 'noDataYet'
};

# new object
sub new { 
    my ($class, %args) = @_; 
    my $self = { 
        #Connector ID number
        'id' => $args{'id'}, 
        #Connector lowercase system name
        'name' => $args{'name'}, 
        #Connector pretty display name
        'display_name' => $args{'displayName'}, 
        #URL to the image of the connector logo
        'image' => $args{'image'}, 
        #URL to a site where one can get this device or application
        'get_it_url' => $args{'getItUrl'}, 
        #True if the authenticated user has this connector enabled
        'connected' => $args{'connected'}, 
        #URL and parameters used when connecting to a service
        'connect_instructions' => $args{'connectInstructions'}, 
        #Epoch timestamp of last sync
        'last_update' => $args{'lastUpdate'}, 
        #Number of measurements obtained during latest update
        'latest_data' => $args{'latestData'}, 
        #True if user has no measurements for this connector
        'no_data_yet' => $args{'noDataYet'}
    }; 

    return bless $self, $class; 
}  

# get swagger type of the attribute
sub get_swagger_types {
  return $swagger_types;
}

# get attribute mappping
sub get_attribute_map {
  return $attribute_map;
}

1;