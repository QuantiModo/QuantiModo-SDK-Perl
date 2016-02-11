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
                                  class => 'Vote',
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
    'client_id' => {
    	datatype => 'string',
    	base_name => 'client_id',
    	description => 'client_id',
    	format => '',
    	read_only => '',
    		},
    'user_id' => {
    	datatype => 'int',
    	base_name => 'user_id',
    	description => 'ID of User',
    	format => '',
    	read_only => '',
    		},
    'cause_id' => {
    	datatype => 'int',
    	base_name => 'cause_id',
    	description => 'ID of the predictor variable',
    	format => '',
    	read_only => '',
    		},
    'effect_id' => {
    	datatype => 'int',
    	base_name => 'effect_id',
    	description => 'ID of effect variable',
    	format => '',
    	read_only => '',
    		},
    'value' => {
    	datatype => 'int',
    	base_name => 'value',
    	description => 'Value of Vote',
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
    
});

__PACKAGE__->swagger_types( {
    'id' => 'int',
    'client_id' => 'string',
    'user_id' => 'int',
    'cause_id' => 'int',
    'effect_id' => 'int',
    'value' => 'int',
    'created_at' => 'DateTime',
    'updated_at' => 'DateTime'
} );

__PACKAGE__->attribute_map( {
    'id' => 'id',
    'client_id' => 'client_id',
    'user_id' => 'user_id',
    'cause_id' => 'cause_id',
    'effect_id' => 'effect_id',
    'value' => 'value',
    'created_at' => 'created_at',
    'updated_at' => 'updated_at'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
