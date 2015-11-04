package WWW::SwaggerClient::Object::VariableUserSource;

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
    'user_id' => 'int',
    'variable_id' => 'int',
    'source_id' => 'int',
    'timestamp' => 'int',
    'earliest_measurement_time' => 'int',
    'latest_measurement_time' => 'int',
    'created_at' => 'DateTime',
    'updated_at' => 'DateTime'
};

my $attribute_map = {
    'user_id' => 'user_id',
    'variable_id' => 'variable_id',
    'source_id' => 'source_id',
    'timestamp' => 'timestamp',
    'earliest_measurement_time' => 'earliest_measurement_time',
    'latest_measurement_time' => 'latest_measurement_time',
    'created_at' => 'created_at',
    'updated_at' => 'updated_at'
};

# new object
sub new { 
    my ($class, %args) = @_; 
    my $self = { 
        #ID of User
        'user_id' => $args{'user_id'}, 
        #ID of variable
        'variable_id' => $args{'variable_id'}, 
        #ID of source
        'source_id' => $args{'source_id'}, 
        #Time that this measurement occurred Uses epoch minute (epoch time divided by 60)
        'timestamp' => $args{'timestamp'}, 
        #Earliest measurement time
        'earliest_measurement_time' => $args{'earliest_measurement_time'}, 
        #Latest measurement time
        'latest_measurement_time' => $args{'latest_measurement_time'}, 
        #created_at
        'created_at' => $args{'created_at'}, 
        #updated_at
        'updated_at' => $args{'updated_at'}
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