package WWW::SwaggerClient::Object::ConnectorInstruction;

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
    'url' => 'string',
    'parameters' => 'ARRAY[string]',
    'use_popup' => 'boolean'
};

my $attribute_map = {
    'url' => 'url',
    'parameters' => 'parameters',
    'use_popup' => 'usePopup'
};

# new object
sub new { 
    my ($class, %args) = @_; 
    my $self = { 
        #url
        'url' => $args{'url'}, 
        #parameters array
        'parameters' => $args{'parameters'}, 
        #usePopup
        'use_popup' => $args{'usePopup'}
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
