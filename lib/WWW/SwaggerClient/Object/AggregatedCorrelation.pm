package WWW::SwaggerClient::Object::AggregatedCorrelation;

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
    'correlation' => 'double',
    'cause_id' => 'int',
    'effect_id' => 'int',
    'onset_delay' => 'int',
    'duration_of_action' => 'int',
    'number_of_pairs' => 'int',
    'value_predicting_high_outcome' => 'double',
    'value_predicting_low_outcome' => 'double',
    'optimal_pearson_product' => 'double',
    'vote' => 'double',
    'number_of_users' => 'int',
    'number_of_correlations' => 'int',
    'statistical_significance' => 'double',
    'cause_unit' => 'string',
    'cause_unit_id' => 'int',
    'cause_changes' => 'int',
    'effect_changes' => 'int',
    'aggregate_qm_score' => 'double',
    'created_at' => 'DateTime',
    'updated_at' => 'DateTime',
    'status' => 'string',
    'error_message' => 'string',
    'last_successful_update_time' => 'DateTime',
    'reverse_pearson_correlation_coefficient' => 'double',
    'predictive_pearson_correlation_coefficient' => 'double'
};

my $attribute_map = {
    'id' => 'id',
    'correlation' => 'correlation',
    'cause_id' => 'cause_id',
    'effect_id' => 'effect_id',
    'onset_delay' => 'onset_delay',
    'duration_of_action' => 'duration_of_action',
    'number_of_pairs' => 'number_of_pairs',
    'value_predicting_high_outcome' => 'value_predicting_high_outcome',
    'value_predicting_low_outcome' => 'value_predicting_low_outcome',
    'optimal_pearson_product' => 'optimal_pearson_product',
    'vote' => 'vote',
    'number_of_users' => 'number_of_users',
    'number_of_correlations' => 'number_of_correlations',
    'statistical_significance' => 'statistical_significance',
    'cause_unit' => 'cause_unit',
    'cause_unit_id' => 'cause_unit_id',
    'cause_changes' => 'cause_changes',
    'effect_changes' => 'effect_changes',
    'aggregate_qm_score' => 'aggregate_qm_score',
    'created_at' => 'created_at',
    'updated_at' => 'updated_at',
    'status' => 'status',
    'error_message' => 'error_message',
    'last_successful_update_time' => 'last_successful_update_time',
    'reverse_pearson_correlation_coefficient' => 'reverse_pearson_correlation_coefficient',
    'predictive_pearson_correlation_coefficient' => 'predictive_pearson_correlation_coefficient'
};

# new object
sub new { 
    my ($class, %args) = @_; 
    my $self = { 
        #id
        'id' => $args{'id'}, 
        #correlation
        'correlation' => $args{'correlation'}, 
        #cause_id
        'cause_id' => $args{'cause_id'}, 
        #effect_id
        'effect_id' => $args{'effect_id'}, 
        #onset_delay
        'onset_delay' => $args{'onset_delay'}, 
        #duration_of_action
        'duration_of_action' => $args{'duration_of_action'}, 
        #number_of_pairs
        'number_of_pairs' => $args{'number_of_pairs'}, 
        #value_predicting_high_outcome
        'value_predicting_high_outcome' => $args{'value_predicting_high_outcome'}, 
        #value_predicting_low_outcome
        'value_predicting_low_outcome' => $args{'value_predicting_low_outcome'}, 
        #optimal_pearson_product
        'optimal_pearson_product' => $args{'optimal_pearson_product'}, 
        #vote
        'vote' => $args{'vote'}, 
        #number_of_users
        'number_of_users' => $args{'number_of_users'}, 
        #number_of_correlations
        'number_of_correlations' => $args{'number_of_correlations'}, 
        #statistical_significance
        'statistical_significance' => $args{'statistical_significance'}, 
        #cause_unit
        'cause_unit' => $args{'cause_unit'}, 
        #cause_unit_id
        'cause_unit_id' => $args{'cause_unit_id'}, 
        #cause_changes
        'cause_changes' => $args{'cause_changes'}, 
        #effect_changes
        'effect_changes' => $args{'effect_changes'}, 
        #aggregate_qm_score
        'aggregate_qm_score' => $args{'aggregate_qm_score'}, 
        #created_at
        'created_at' => $args{'created_at'}, 
        #updated_at
        'updated_at' => $args{'updated_at'}, 
        #status
        'status' => $args{'status'}, 
        #error_message
        'error_message' => $args{'error_message'}, 
        #last_successful_update_time
        'last_successful_update_time' => $args{'last_successful_update_time'}, 
        #reverse_pearson_correlation_coefficient
        'reverse_pearson_correlation_coefficient' => $args{'reverse_pearson_correlation_coefficient'}, 
        #predictive_pearson_correlation_coefficient
        'predictive_pearson_correlation_coefficient' => $args{'predictive_pearson_correlation_coefficient'}
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
