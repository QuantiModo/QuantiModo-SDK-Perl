package WWW::SwaggerClient::Object::VariableCategory;

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
    'filling_value' => 'double',
    'maximum_allowed_value' => 'double',
    'minimum_allowed_value' => 'double',
    'duration_of_action' => 'int',
    'onset_delay' => 'int',
    'combination_operation' => 'string',
    'updated' => 'int',
    'cause_only' => 'boolean',
    'public' => 'int',
    'outcome' => 'boolean',
    'created_at' => 'DateTime',
    'updated_at' => 'DateTime',
    'image_url' => 'string',
    'default_unit_id' => 'int'
};

my $attribute_map = {
    'id' => 'id',
    'name' => 'name',
    'filling_value' => 'filling_value',
    'maximum_allowed_value' => 'maximum_allowed_value',
    'minimum_allowed_value' => 'minimum_allowed_value',
    'duration_of_action' => 'duration_of_action',
    'onset_delay' => 'onset_delay',
    'combination_operation' => 'combination_operation',
    'updated' => 'updated',
    'cause_only' => 'cause_only',
    'public' => 'public',
    'outcome' => 'outcome',
    'created_at' => 'created_at',
    'updated_at' => 'updated_at',
    'image_url' => 'image_url',
    'default_unit_id' => 'default_unit_id'
};

# new object
sub new { 
    my ($class, %args) = @_; 
    my $self = { 
        #id
        'id' => $args{'id'}, 
        #Name of the category
        'name' => $args{'name'}, 
        #Value for replacing null measurements
        'filling_value' => $args{'filling_value'}, 
        #Maximum recorded value of this category
        'maximum_allowed_value' => $args{'maximum_allowed_value'}, 
        #Minimum recorded value of this category
        'minimum_allowed_value' => $args{'minimum_allowed_value'}, 
        #How long the effect of a measurement in this variable lasts
        'duration_of_action' => $args{'duration_of_action'}, 
        #How long it takes for a measurement in this variable to take effect
        'onset_delay' => $args{'onset_delay'}, 
        #How to combine values of this variable (for instance, to see a summary of the values over a month) 0 for sum OR 1 for mean
        'combination_operation' => $args{'combination_operation'}, 
        #updated
        'updated' => $args{'updated'}, 
        #A value of 1 indicates that this category is generally a cause in a causal relationship.  An example of a causeOnly category would be a category such as Work which would generally not be influenced by the behaviour of the user
        'cause_only' => $args{'cause_only'}, 
        #Is category public
        'public' => $args{'public'}, 
        #outcome
        'outcome' => $args{'outcome'}, 
        #created_at
        'created_at' => $args{'created_at'}, 
        #updated_at
        'updated_at' => $args{'updated_at'}, 
        #Image URL
        'image_url' => $args{'image_url'}, 
        #ID of the default unit for the category
        'default_unit_id' => $args{'default_unit_id'}
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
