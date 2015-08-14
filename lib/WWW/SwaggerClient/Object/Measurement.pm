package WWW::SwaggerClient::Object::Measurement;

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
    'variable' => 'string',
    'source' => 'string',
    'timestamp' => 'int',
    'value' => 'double',
    'unit' => 'string',
    'stored_value' => 'double',
    'stored_unit' => 'string'
};

my $attribute_map = {
    'variable' => 'variable',
    'source' => 'source',
    'timestamp' => 'timestamp',
    'value' => 'value',
    'unit' => 'unit',
    'stored_value' => 'storedValue',
    'stored_unit' => 'storedUnit'
};

# new object
sub new { 
    my ($class, %args) = @_; 
    my $self = { 
        #ORIGINAL Name of the variable for which we are creating the measurement records
        'variable' => $args{'variable'}, 
        #Application or device used to record the measurement values
        'source' => $args{'source'}, 
        #Timestamp for the measurement event in epoch time
        'timestamp' => $args{'timestamp'}, 
        #Converted measurement value in requested unit
        'value' => $args{'value'}, 
        #Unit of measurement as requested in GET request
        'unit' => $args{'unit'}, 
        #Measurement value in the unit as orignally submitted
        'stored_value' => $args{'storedValue'}, 
        #Unit of measurement as originally submitted
        'stored_unit' => $args{'storedUnit'}
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
