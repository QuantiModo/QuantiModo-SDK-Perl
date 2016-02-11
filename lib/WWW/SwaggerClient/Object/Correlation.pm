package WWW::SwaggerClient::Object::Correlation;

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

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#
#
#NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
#

__PACKAGE__->mk_classdata('attribute_map' => {});
__PACKAGE__->mk_classdata('swagger_types' => {});
__PACKAGE__->mk_classdata('method_documentation' => {}); 
__PACKAGE__->mk_classdata('class_documentation' => {});

# new object
sub new { 
    my ($class, %args) = @_; 

	my $self = bless {}, $class;
	
	foreach my $attribute (keys %{$class->attribute_map}) {
		my $args_key = $class->attribute_map->{$attribute};
		$self->$attribute( $args{ $args_key } );
	}
	
	return $self;
}  

# return perl hash
sub to_hash {
    return decode_json(JSON->new->convert_blessed->encode( shift ));
}

# used by JSON for serialization
sub TO_JSON { 
    my $self = shift;
    my $_data = {};
    foreach my $_key (keys %{$self->attribute_map}) {
        if (defined $self->{$_key}) {
            $_data->{$self->attribute_map->{$_key}} = $self->{$_key};
        }
    }
    return $_data;
}

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use swagger_types to deserialize the data
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize($_subclass, $_element);
            }
            $self->{$_key} = \@_array;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } else {
        	$log->debugf("Warning: %s (%s) does not exist in input hash\n", $_key, $_json_attribute);
        }
    }
  
    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
    $log->debugf("deserializing %s with %s",Dumper($data), $type);
        
    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $_instance = eval "WWW::SwaggerClient::Object::$type->new()";
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => '',
                                  class => 'Correlation',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'id' => {
    	datatype => 'int',
    	base_name => 'id',
    	description => 'id',
    	format => '',
    	read_only => '',
    		},
    'timestamp' => {
    	datatype => 'int',
    	base_name => 'timestamp',
    	description => 'Time at which correlation was calculated',
    	format => '',
    	read_only => '',
    		},
    'user_id' => {
    	datatype => 'int',
    	base_name => 'user_id',
    	description => 'ID of user that owns this correlation',
    	format => '',
    	read_only => '',
    		},
    'correlation' => {
    	datatype => 'double',
    	base_name => 'correlation',
    	description => 'Pearson correlation coefficient between cause and effect measurements',
    	format => '',
    	read_only => '',
    		},
    'cause_id' => {
    	datatype => 'int',
    	base_name => 'cause_id',
    	description => 'variable ID of the cause variable for which the user desires correlations',
    	format => '',
    	read_only => '',
    		},
    'effect_id' => {
    	datatype => 'int',
    	base_name => 'effect_id',
    	description => 'variable ID of the effect variable for which the user desires correlations',
    	format => '',
    	read_only => '',
    		},
    'onset_delay' => {
    	datatype => 'int',
    	base_name => 'onset_delay',
    	description => 'User estimated or default time after cause measurement before a perceivable effect is observed',
    	format => '',
    	read_only => '',
    		},
    'duration_of_action' => {
    	datatype => 'int',
    	base_name => 'duration_of_action',
    	description => 'Time over which the cause is expected to produce a perceivable effect following the onset delay',
    	format => '',
    	read_only => '',
    		},
    'number_of_pairs' => {
    	datatype => 'int',
    	base_name => 'number_of_pairs',
    	description => 'Number of points that went into the correlation calculation',
    	format => '',
    	read_only => '',
    		},
    'value_predicting_high_outcome' => {
    	datatype => 'double',
    	base_name => 'value_predicting_high_outcome',
    	description => 'cause value that predicts an above average effect value (in default unit for cause variable)',
    	format => '',
    	read_only => '',
    		},
    'value_predicting_low_outcome' => {
    	datatype => 'double',
    	base_name => 'value_predicting_low_outcome',
    	description => 'cause value that predicts a below average effect value (in default unit for cause variable)',
    	format => '',
    	read_only => '',
    		},
    'optimal_pearson_product' => {
    	datatype => 'double',
    	base_name => 'optimal_pearson_product',
    	description => 'Optimal Pearson Product',
    	format => '',
    	read_only => '',
    		},
    'vote' => {
    	datatype => 'double',
    	base_name => 'vote',
    	description => 'Vote',
    	format => '',
    	read_only => '',
    		},
    'statistical_significance' => {
    	datatype => 'double',
    	base_name => 'statistical_significance',
    	description => 'A function of the effect size and sample size',
    	format => '',
    	read_only => '',
    		},
    'cause_unit' => {
    	datatype => 'string',
    	base_name => 'cause_unit',
    	description => 'Unit of the predictor variable',
    	format => '',
    	read_only => '',
    		},
    'cause_unit_id' => {
    	datatype => 'int',
    	base_name => 'cause_unit_id',
    	description => 'Unit ID of the predictor variable',
    	format => '',
    	read_only => '',
    		},
    'cause_changes' => {
    	datatype => 'int',
    	base_name => 'cause_changes',
    	description => 'Cause changes',
    	format => '',
    	read_only => '',
    		},
    'effect_changes' => {
    	datatype => 'int',
    	base_name => 'effect_changes',
    	description => 'Effect changes',
    	format => '',
    	read_only => '',
    		},
    'qm_score' => {
    	datatype => 'double',
    	base_name => 'qm_score',
    	description => 'QM Score',
    	format => '',
    	read_only => '',
    		},
    'error' => {
    	datatype => 'string',
    	base_name => 'error',
    	description => 'error',
    	format => '',
    	read_only => '',
    		},
    'created_at' => {
    	datatype => 'DateTime',
    	base_name => 'created_at',
    	description => 'When the record was first created. Use ISO 8601 datetime format',
    	format => '',
    	read_only => '',
    		},
    'updated_at' => {
    	datatype => 'DateTime',
    	base_name => 'updated_at',
    	description => 'When the record in the database was last updated. Use ISO 8601 datetime format',
    	format => '',
    	read_only => '',
    		},
    'reverse_pearson_correlation_coefficient' => {
    	datatype => 'double',
    	base_name => 'reverse_pearson_correlation_coefficient',
    	description => 'Correlation when cause and effect are reversed. For any causal relationship, the forward correlation should exceed the reverse correlation',
    	format => '',
    	read_only => '',
    		},
    'predictive_pearson_correlation_coefficient' => {
    	datatype => 'double',
    	base_name => 'predictive_pearson_correlation_coefficient',
    	description => 'Predictive Pearson Correlation Coefficient',
    	format => '',
    	read_only => '',
    		},
    
});

__PACKAGE__->swagger_types( {
    'id' => 'int',
    'timestamp' => 'int',
    'user_id' => 'int',
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
    'statistical_significance' => 'double',
    'cause_unit' => 'string',
    'cause_unit_id' => 'int',
    'cause_changes' => 'int',
    'effect_changes' => 'int',
    'qm_score' => 'double',
    'error' => 'string',
    'created_at' => 'DateTime',
    'updated_at' => 'DateTime',
    'reverse_pearson_correlation_coefficient' => 'double',
    'predictive_pearson_correlation_coefficient' => 'double'
} );

__PACKAGE__->attribute_map( {
    'id' => 'id',
    'timestamp' => 'timestamp',
    'user_id' => 'user_id',
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
    'statistical_significance' => 'statistical_significance',
    'cause_unit' => 'cause_unit',
    'cause_unit_id' => 'cause_unit_id',
    'cause_changes' => 'cause_changes',
    'effect_changes' => 'effect_changes',
    'qm_score' => 'qm_score',
    'error' => 'error',
    'created_at' => 'created_at',
    'updated_at' => 'updated_at',
    'reverse_pearson_correlation_coefficient' => 'reverse_pearson_correlation_coefficient',
    'predictive_pearson_correlation_coefficient' => 'predictive_pearson_correlation_coefficient'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
