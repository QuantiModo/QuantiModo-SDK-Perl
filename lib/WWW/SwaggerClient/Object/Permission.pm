package WWW::SwaggerClient::Object::Permission;

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
    'target' => 'int',
    'variable_name' => 'string',
    'min_timestamp' => 'int',
    'max_timestamp' => 'int',
    'min_time_of_day' => 'int',
    'max_time_of_day' => 'int',
    'week' => 'string'
};

my $attribute_map = {
    'target' => 'target',
    'variable_name' => 'variableName',
    'min_timestamp' => 'min_timestamp',
    'max_timestamp' => 'max_timestamp',
    'min_time_of_day' => 'min_time_of_day',
    'max_time_of_day' => 'max_time_of_day',
    'week' => 'week'
};

# new object
sub new { 
    my ($class, %args) = @_; 
    my $self = { 
        #Grant permission to target user or public so they may access measurements within the given parameters. TODO: Rename target to something more intuitive.
        'target' => $args{'target'}, 
        #ORIGINAL Variable name
        'variable_name' => $args{'variableName'}, 
        #Earliest time when measurements will be accessible in epoch seconds
        'min_timestamp' => $args{'min_timestamp'}, 
        #Latest time when measurements will be accessible in epoch seconds
        'max_timestamp' => $args{'max_timestamp'}, 
        #Earliest time of day when measurements will be accessible in epoch seconds
        'min_time_of_day' => $args{'min_time_of_day'}, 
        #Latest time of day when measurements will be accessible in epoch seconds
        'max_time_of_day' => $args{'max_time_of_day'}, 
        #Maybe specifies if only weekday measurements should be accessible
        'week' => $args{'week'}
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
