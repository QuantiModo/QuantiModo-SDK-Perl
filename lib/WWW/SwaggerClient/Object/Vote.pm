package WWW::SwaggerClient::Object::Vote;

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
    'client_id' => 'string',
    'user_id' => 'int',
    'cause_id' => 'int',
    'effect_id' => 'int',
    'value' => 'int',
    'created_at' => 'DateTime',
    'updated_at' => 'DateTime'
};

my $attribute_map = {
    'id' => 'id',
    'client_id' => 'client_id',
    'user_id' => 'user_id',
    'cause_id' => 'cause_id',
    'effect_id' => 'effect_id',
    'value' => 'value',
    'created_at' => 'created_at',
    'updated_at' => 'updated_at'
};

# new object
sub new { 
    my ($class, %args) = @_; 
    my $self = { 
        #id
        'id' => $args{'id'}, 
        #client_id
        'client_id' => $args{'client_id'}, 
        #ID of User
        'user_id' => $args{'user_id'}, 
        #ID of cause variable
        'cause_id' => $args{'cause_id'}, 
        #ID of effect variable
        'effect_id' => $args{'effect_id'}, 
        #Value of Vote
        'value' => $args{'value'}, 
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
