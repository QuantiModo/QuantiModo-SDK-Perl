=begin comment

QuantiModo

Welcome to QuantiModo API! QuantiModo makes it easy to retrieve normalized user data from a wide array of devices and applications. [Learn about QuantiModo](https://quantimo.do) or contact us at <api@quantimo.do>.         Before you get started, you will need to: * Sign in/Sign up, and add some data at [https://app.quantimo.do/api/v2/account/connectors](https://app.quantimo.do/api/v2/account/connectors) to try out the API for yourself * Create an app to get your client id and secret at [https://app.quantimo.do/api/v2/apps](https://app.quantimo.do/api/v2/apps) * As long as you're signed in, it will use your browser's cookie for authentication.  However, client applications must use OAuth2 tokens to access the API.     ## Application Endpoints These endpoints give you access to all authorized users' data for that application. ### Getting Application Token Make a `POST` request to `/api/v2/oauth/access_token`         * `grant_type` Must be `client_credentials`.         * `clientId` Your application's clientId.         * `client_secret` Your application's client_secret.         * `redirect_uri` Your application's redirect url.                ## Example Queries ### Query Options The standard query options for QuantiModo API are as described in the table below. These are the available query options in QuantiModo API: <table>            <thead>                <tr>                    <th>Parameter</th>                    <th>Description</th>                </tr>            </thead>            <tbody>                <tr>                    <td>limit</td>                    <td>The LIMIT is used to limit the number of results returned.  So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.</td>                </tr>                <tr>                    <td>offset</td>                    <td>Suppose you wanted to show results 11-20. You'd set the    offset to 10 and the limit to 10.</td>                </tr>                <tr>                    <td>sort</td>                    <td>Sort by given field. If the field is prefixed with '-', it    will sort in descending order.</td>                </tr>            </tbody>        </table>         ### Pagination Conventions Since the maximum limit is 200 records, to get more than that you'll have to make multiple API calls and page through the results. To retrieve all the data, you can iterate through data by using the `limit` and `offset` query parameters.For example, if you want to retrieve data from 61-80 then you can use a query with the following parameters,         `/v2/variables?limit=20&offset=60`         Generally, you'll be retrieving new or updated user data. To avoid unnecessary API calls, you'll want to store your last refresh time locally.  Initially, it should be set to 0. Then whenever you make a request to get new data, you should limit the returned results to those updated since your last refresh by appending append         `?lastUpdated=(ge)&quot2013-01-D01T01:01:01&quot`         to your request.         Also for better pagination, you can get link to the records of first, last, next and previous page from response headers: * `Total-Count` - Total number of results for given query * `Link-First` - Link to get first page records * `Link-Last` - Link to get last page records * `Link-Prev` - Link to get previous records set * `Link-Next` - Link to get next records set         Remember, response header will be only sent when the record set is available. e.g. You will not get a ```Link-Last``` & ```Link-Next``` when you query for the last page.         ### Filter operators support API supports the following operators with filter parameters: <br> **Comparison operators**         Comparison operators allow you to limit results to those greater than, less than, or equal to a specified value for a specified attribute. These operators can be used with strings, numbers, and dates. The following comparison operators are available: * `gt` for `greater than` comparison * `ge` for `greater than or equal` comparison * `lt` for `less than` comparison * `le` for `less than or equal` comparison         They are included in queries using the following format:         `(<operator>)<value>`         For example, in order to filter value which is greater than 21, the following query parameter should be used:         `?value=(gt)21` <br><br> **Equals/In Operators**         It also allows filtering by the exact value of an attribute or by a set of values, depending on the type of value passed as a query parameter. If the value contains commas, the parameter is split on commas and used as array input for `IN` filtering, otherwise the exact match is applied. In order to only show records which have the value 42, the following query should be used:         `?value=42`         In order to filter records which have value 42 or 43, the following query should be used:         `?value=42,43` <br><br> **Like operators**         Like operators allow filtering using `LIKE` query. This operator is triggered if exact match operator is used, but value contains `%` sign as the first or last character. In order to filter records which category that start with `Food`, the following query should be used:         `?category=Food%` <br><br> **Negation operator**         It is possible to get negated results of a query by prefixed the operator with `!`. Some examples:         `//filter records except those with value are not 42 or 43`<br> `?value=!42,43`         `//filter records with value not greater than 21`<br> `?value=!(ge)21` <br><br> **Multiple constraints for single attribute**         It is possible to apply multiple constraints by providing an array of query filters:         Filter all records which value is greater than 20.2 and less than 20.3<br> `?value[]=(gt)20.2&value[]=(lt)20.3`         Filter all records which value is greater than 20.2 and less than 20.3 but not 20.2778<br> `?value[]=(gt)20.2&value[]=(lt)20.3&value[]=!20.2778`<br><br> 

OpenAPI spec version: 2.0.6

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
package WWW::SwaggerClient::Object::UserVariable;

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
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

=begin comment

QuantiModo

Welcome to QuantiModo API! QuantiModo makes it easy to retrieve normalized user data from a wide array of devices and applications. [Learn about QuantiModo](https://quantimo.do) or contact us at <api@quantimo.do>.         Before you get started, you will need to: * Sign in/Sign up, and add some data at [https://app.quantimo.do/api/v2/account/connectors](https://app.quantimo.do/api/v2/account/connectors) to try out the API for yourself * Create an app to get your client id and secret at [https://app.quantimo.do/api/v2/apps](https://app.quantimo.do/api/v2/apps) * As long as you're signed in, it will use your browser's cookie for authentication.  However, client applications must use OAuth2 tokens to access the API.     ## Application Endpoints These endpoints give you access to all authorized users' data for that application. ### Getting Application Token Make a `POST` request to `/api/v2/oauth/access_token`         * `grant_type` Must be `client_credentials`.         * `clientId` Your application's clientId.         * `client_secret` Your application's client_secret.         * `redirect_uri` Your application's redirect url.                ## Example Queries ### Query Options The standard query options for QuantiModo API are as described in the table below. These are the available query options in QuantiModo API: <table>            <thead>                <tr>                    <th>Parameter</th>                    <th>Description</th>                </tr>            </thead>            <tbody>                <tr>                    <td>limit</td>                    <td>The LIMIT is used to limit the number of results returned.  So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.</td>                </tr>                <tr>                    <td>offset</td>                    <td>Suppose you wanted to show results 11-20. You'd set the    offset to 10 and the limit to 10.</td>                </tr>                <tr>                    <td>sort</td>                    <td>Sort by given field. If the field is prefixed with '-', it    will sort in descending order.</td>                </tr>            </tbody>        </table>         ### Pagination Conventions Since the maximum limit is 200 records, to get more than that you'll have to make multiple API calls and page through the results. To retrieve all the data, you can iterate through data by using the `limit` and `offset` query parameters.For example, if you want to retrieve data from 61-80 then you can use a query with the following parameters,         `/v2/variables?limit=20&offset=60`         Generally, you'll be retrieving new or updated user data. To avoid unnecessary API calls, you'll want to store your last refresh time locally.  Initially, it should be set to 0. Then whenever you make a request to get new data, you should limit the returned results to those updated since your last refresh by appending append         `?lastUpdated=(ge)&quot2013-01-D01T01:01:01&quot`         to your request.         Also for better pagination, you can get link to the records of first, last, next and previous page from response headers: * `Total-Count` - Total number of results for given query * `Link-First` - Link to get first page records * `Link-Last` - Link to get last page records * `Link-Prev` - Link to get previous records set * `Link-Next` - Link to get next records set         Remember, response header will be only sent when the record set is available. e.g. You will not get a ```Link-Last``` & ```Link-Next``` when you query for the last page.         ### Filter operators support API supports the following operators with filter parameters: <br> **Comparison operators**         Comparison operators allow you to limit results to those greater than, less than, or equal to a specified value for a specified attribute. These operators can be used with strings, numbers, and dates. The following comparison operators are available: * `gt` for `greater than` comparison * `ge` for `greater than or equal` comparison * `lt` for `less than` comparison * `le` for `less than or equal` comparison         They are included in queries using the following format:         `(<operator>)<value>`         For example, in order to filter value which is greater than 21, the following query parameter should be used:         `?value=(gt)21` <br><br> **Equals/In Operators**         It also allows filtering by the exact value of an attribute or by a set of values, depending on the type of value passed as a query parameter. If the value contains commas, the parameter is split on commas and used as array input for `IN` filtering, otherwise the exact match is applied. In order to only show records which have the value 42, the following query should be used:         `?value=42`         In order to filter records which have value 42 or 43, the following query should be used:         `?value=42,43` <br><br> **Like operators**         Like operators allow filtering using `LIKE` query. This operator is triggered if exact match operator is used, but value contains `%` sign as the first or last character. In order to filter records which category that start with `Food`, the following query should be used:         `?category=Food%` <br><br> **Negation operator**         It is possible to get negated results of a query by prefixed the operator with `!`. Some examples:         `//filter records except those with value are not 42 or 43`<br> `?value=!42,43`         `//filter records with value not greater than 21`<br> `?value=!(ge)21` <br><br> **Multiple constraints for single attribute**         It is possible to apply multiple constraints by providing an array of query filters:         Filter all records which value is greater than 20.2 and less than 20.3<br> `?value[]=(gt)20.2&value[]=(lt)20.3`         Filter all records which value is greater than 20.2 and less than 20.3 but not 20.2778<br> `?value[]=(gt)20.2&value[]=(lt)20.3&value[]=!20.2778`<br><br> 

OpenAPI spec version: 2.0.6

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
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
                                  class => 'UserVariable',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'parent_id' => {
    	datatype => 'int',
    	base_name => 'parent_id',
    	description => 'ID of the parent variable if this variable has any parent',
    	format => '',
    	read_only => '',
    		},
    'user_id' => {
    	datatype => 'int',
    	base_name => 'user_id',
    	description => 'User ID',
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
    'variable_id' => {
    	datatype => 'int',
    	base_name => 'variable_id',
    	description => 'ID of variable',
    	format => '',
    	read_only => '',
    		},
    'default_unit_id' => {
    	datatype => 'int',
    	base_name => 'default_unit_id',
    	description => 'ID of unit to use for this variable',
    	format => '',
    	read_only => '',
    		},
    'minimum_allowed_value' => {
    	datatype => 'double',
    	base_name => 'minimum_allowed_value',
    	description => 'Minimum reasonable value for this variable (uses default unit)',
    	format => '',
    	read_only => '',
    		},
    'maximum_allowed_value' => {
    	datatype => 'double',
    	base_name => 'maximum_allowed_value',
    	description => 'Maximum reasonable value for this variable (uses default unit)',
    	format => '',
    	read_only => '',
    		},
    'filling_value' => {
    	datatype => 'double',
    	base_name => 'filling_value',
    	description => 'Value for replacing null measurements',
    	format => '',
    	read_only => '',
    		},
    'join_with' => {
    	datatype => 'int',
    	base_name => 'join_with',
    	description => 'The Variable this Variable should be joined with. If the variable is joined with some other variable then it is not shown to user in the list of variables',
    	format => '',
    	read_only => '',
    		},
    'onset_delay' => {
    	datatype => 'int',
    	base_name => 'onset_delay',
    	description => 'How long it takes for a measurement in this variable to take effect',
    	format => '',
    	read_only => '',
    		},
    'duration_of_action' => {
    	datatype => 'int',
    	base_name => 'duration_of_action',
    	description => 'Estimated duration of time following the onset delay in which a stimulus produces a perceivable effect',
    	format => '',
    	read_only => '',
    		},
    'variable_category_id' => {
    	datatype => 'int',
    	base_name => 'variable_category_id',
    	description => 'ID of variable category',
    	format => '',
    	read_only => '',
    		},
    'updated' => {
    	datatype => 'int',
    	base_name => 'updated',
    	description => 'updated',
    	format => '',
    	read_only => '',
    		},
    'public' => {
    	datatype => 'int',
    	base_name => 'public',
    	description => 'Is variable public',
    	format => '',
    	read_only => '',
    		},
    'cause_only' => {
    	datatype => 'boolean',
    	base_name => 'cause_only',
    	description => 'A value of 1 indicates that this variable is generally a cause in a causal relationship.  An example of a causeOnly variable would be a variable such as Cloud Cover which would generally not be influenced by the behaviour of the user',
    	format => '',
    	read_only => '',
    		},
    'filling_type' => {
    	datatype => 'string',
    	base_name => 'filling_type',
    	description => '0 -&gt; No filling, 1 -&gt; Use filling-value',
    	format => '',
    	read_only => '',
    		},
    'number_of_measurements' => {
    	datatype => 'int',
    	base_name => 'number_of_measurements',
    	description => 'Number of measurements',
    	format => '',
    	read_only => '',
    		},
    'number_of_processed_measurements' => {
    	datatype => 'int',
    	base_name => 'number_of_processed_measurements',
    	description => 'Number of processed measurements',
    	format => '',
    	read_only => '',
    		},
    'measurements_at_last_analysis' => {
    	datatype => 'int',
    	base_name => 'measurements_at_last_analysis',
    	description => 'Number of measurements at last analysis',
    	format => '',
    	read_only => '',
    		},
    'last_unit_id' => {
    	datatype => 'int',
    	base_name => 'last_unit_id',
    	description => 'ID of last Unit',
    	format => '',
    	read_only => '',
    		},
    'last_original_unit_id' => {
    	datatype => 'int',
    	base_name => 'last_original_unit_id',
    	description => 'ID of last original Unit',
    	format => '',
    	read_only => '',
    		},
    'last_value' => {
    	datatype => 'double',
    	base_name => 'last_value',
    	description => 'Last Value',
    	format => '',
    	read_only => '',
    		},
    'last_original_value' => {
    	datatype => 'int',
    	base_name => 'last_original_value',
    	description => 'Last original value which is stored',
    	format => '',
    	read_only => '',
    		},
    'last_source_id' => {
    	datatype => 'int',
    	base_name => 'last_source_id',
    	description => 'ID of last source',
    	format => '',
    	read_only => '',
    		},
    'number_of_correlations' => {
    	datatype => 'int',
    	base_name => 'number_of_correlations',
    	description => 'Number of correlations for this variable',
    	format => '',
    	read_only => '',
    		},
    'status' => {
    	datatype => 'string',
    	base_name => 'status',
    	description => 'status',
    	format => '',
    	read_only => '',
    		},
    'error_message' => {
    	datatype => 'string',
    	base_name => 'error_message',
    	description => 'error_message',
    	format => '',
    	read_only => '',
    		},
    'last_successful_update_time' => {
    	datatype => 'DateTime',
    	base_name => 'last_successful_update_time',
    	description => 'When this variable or its settings were last updated',
    	format => '',
    	read_only => '',
    		},
    'standard_deviation' => {
    	datatype => 'double',
    	base_name => 'standard_deviation',
    	description => 'Standard deviation',
    	format => '',
    	read_only => '',
    		},
    'variance' => {
    	datatype => 'double',
    	base_name => 'variance',
    	description => 'Variance',
    	format => '',
    	read_only => '',
    		},
    'minimum_recorded_value' => {
    	datatype => 'double',
    	base_name => 'minimum_recorded_value',
    	description => 'Minimum recorded value of this variable',
    	format => '',
    	read_only => '',
    		},
    'maximum_recorded_daily_value' => {
    	datatype => 'double',
    	base_name => 'maximum_recorded_daily_value',
    	description => 'Maximum recorded daily value of this variable',
    	format => '',
    	read_only => '',
    		},
    'mean' => {
    	datatype => 'double',
    	base_name => 'mean',
    	description => 'Mean',
    	format => '',
    	read_only => '',
    		},
    'median' => {
    	datatype => 'double',
    	base_name => 'median',
    	description => 'Median',
    	format => '',
    	read_only => '',
    		},
    'most_common_unit_id' => {
    	datatype => 'int',
    	base_name => 'most_common_unit_id',
    	description => 'Most common Unit ID',
    	format => '',
    	read_only => '',
    		},
    'most_common_value' => {
    	datatype => 'double',
    	base_name => 'most_common_value',
    	description => 'Most common value',
    	format => '',
    	read_only => '',
    		},
    'number_of_unique_daily_values' => {
    	datatype => 'double',
    	base_name => 'number_of_unique_daily_values',
    	description => 'Number of unique daily values',
    	format => '',
    	read_only => '',
    		},
    'number_of_changes' => {
    	datatype => 'int',
    	base_name => 'number_of_changes',
    	description => 'Number of changes',
    	format => '',
    	read_only => '',
    		},
    'skewness' => {
    	datatype => 'double',
    	base_name => 'skewness',
    	description => 'Skewness',
    	format => '',
    	read_only => '',
    		},
    'kurtosis' => {
    	datatype => 'double',
    	base_name => 'kurtosis',
    	description => 'Kurtosis',
    	format => '',
    	read_only => '',
    		},
    'latitude' => {
    	datatype => 'double',
    	base_name => 'latitude',
    	description => 'Latitude',
    	format => '',
    	read_only => '',
    		},
    'longitude' => {
    	datatype => 'double',
    	base_name => 'longitude',
    	description => 'Longitude',
    	format => '',
    	read_only => '',
    		},
    'location' => {
    	datatype => 'string',
    	base_name => 'location',
    	description => 'Location',
    	format => '',
    	read_only => '',
    		},
    'experiment_start_time' => {
    	datatype => 'DateTime',
    	base_name => 'experiment_start_time',
    	description => 'Earliest measurement start_time to be used in analysis. Use ISO 8601 datetime format',
    	format => '',
    	read_only => '',
    		},
    'experiment_end_time' => {
    	datatype => 'DateTime',
    	base_name => 'experiment_end_time',
    	description => 'Latest measurement start_time to be used in analysis. Use ISO 8601 datetime format',
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
    'outcome' => {
    	datatype => 'boolean',
    	base_name => 'outcome',
    	description => 'Outcome variables (those with &#x60;outcome&#x60; &#x3D;&#x3D; 1) are variables for which a human would generally want to identify the influencing factors.  These include symptoms of illness, physique, mood, cognitive performance, etc.  Generally correlation calculations are only performed on outcome variables',
    	format => '',
    	read_only => '',
    		},
    'sources' => {
    	datatype => 'string',
    	base_name => 'sources',
    	description => 'Comma-separated list of source names to limit variables to those sources',
    	format => '',
    	read_only => '',
    		},
    'earliest_source_time' => {
    	datatype => 'int',
    	base_name => 'earliest_source_time',
    	description => 'Earliest source time',
    	format => '',
    	read_only => '',
    		},
    'latest_source_time' => {
    	datatype => 'int',
    	base_name => 'latest_source_time',
    	description => 'Latest source time',
    	format => '',
    	read_only => '',
    		},
    'earliest_measurement_time' => {
    	datatype => 'int',
    	base_name => 'earliest_measurement_time',
    	description => 'Earliest measurement time',
    	format => '',
    	read_only => '',
    		},
    'latest_measurement_time' => {
    	datatype => 'int',
    	base_name => 'latest_measurement_time',
    	description => 'Latest measurement time',
    	format => '',
    	read_only => '',
    		},
    'earliest_filling_time' => {
    	datatype => 'int',
    	base_name => 'earliest_filling_time',
    	description => 'Earliest filling time',
    	format => '',
    	read_only => '',
    		},
    'latest_filling_time' => {
    	datatype => 'int',
    	base_name => 'latest_filling_time',
    	description => 'Latest filling time',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'parent_id' => 'int',
    'user_id' => 'int',
    'client_id' => 'string',
    'variable_id' => 'int',
    'default_unit_id' => 'int',
    'minimum_allowed_value' => 'double',
    'maximum_allowed_value' => 'double',
    'filling_value' => 'double',
    'join_with' => 'int',
    'onset_delay' => 'int',
    'duration_of_action' => 'int',
    'variable_category_id' => 'int',
    'updated' => 'int',
    'public' => 'int',
    'cause_only' => 'boolean',
    'filling_type' => 'string',
    'number_of_measurements' => 'int',
    'number_of_processed_measurements' => 'int',
    'measurements_at_last_analysis' => 'int',
    'last_unit_id' => 'int',
    'last_original_unit_id' => 'int',
    'last_value' => 'double',
    'last_original_value' => 'int',
    'last_source_id' => 'int',
    'number_of_correlations' => 'int',
    'status' => 'string',
    'error_message' => 'string',
    'last_successful_update_time' => 'DateTime',
    'standard_deviation' => 'double',
    'variance' => 'double',
    'minimum_recorded_value' => 'double',
    'maximum_recorded_daily_value' => 'double',
    'mean' => 'double',
    'median' => 'double',
    'most_common_unit_id' => 'int',
    'most_common_value' => 'double',
    'number_of_unique_daily_values' => 'double',
    'number_of_changes' => 'int',
    'skewness' => 'double',
    'kurtosis' => 'double',
    'latitude' => 'double',
    'longitude' => 'double',
    'location' => 'string',
    'experiment_start_time' => 'DateTime',
    'experiment_end_time' => 'DateTime',
    'created_at' => 'DateTime',
    'updated_at' => 'DateTime',
    'outcome' => 'boolean',
    'sources' => 'string',
    'earliest_source_time' => 'int',
    'latest_source_time' => 'int',
    'earliest_measurement_time' => 'int',
    'latest_measurement_time' => 'int',
    'earliest_filling_time' => 'int',
    'latest_filling_time' => 'int'
} );

__PACKAGE__->attribute_map( {
    'parent_id' => 'parent_id',
    'user_id' => 'user_id',
    'client_id' => 'client_id',
    'variable_id' => 'variable_id',
    'default_unit_id' => 'default_unit_id',
    'minimum_allowed_value' => 'minimum_allowed_value',
    'maximum_allowed_value' => 'maximum_allowed_value',
    'filling_value' => 'filling_value',
    'join_with' => 'join_with',
    'onset_delay' => 'onset_delay',
    'duration_of_action' => 'duration_of_action',
    'variable_category_id' => 'variable_category_id',
    'updated' => 'updated',
    'public' => 'public',
    'cause_only' => 'cause_only',
    'filling_type' => 'filling_type',
    'number_of_measurements' => 'number_of_measurements',
    'number_of_processed_measurements' => 'number_of_processed_measurements',
    'measurements_at_last_analysis' => 'measurements_at_last_analysis',
    'last_unit_id' => 'last_unit_id',
    'last_original_unit_id' => 'last_original_unit_id',
    'last_value' => 'last_value',
    'last_original_value' => 'last_original_value',
    'last_source_id' => 'last_source_id',
    'number_of_correlations' => 'number_of_correlations',
    'status' => 'status',
    'error_message' => 'error_message',
    'last_successful_update_time' => 'last_successful_update_time',
    'standard_deviation' => 'standard_deviation',
    'variance' => 'variance',
    'minimum_recorded_value' => 'minimum_recorded_value',
    'maximum_recorded_daily_value' => 'maximum_recorded_daily_value',
    'mean' => 'mean',
    'median' => 'median',
    'most_common_unit_id' => 'most_common_unit_id',
    'most_common_value' => 'most_common_value',
    'number_of_unique_daily_values' => 'number_of_unique_daily_values',
    'number_of_changes' => 'number_of_changes',
    'skewness' => 'skewness',
    'kurtosis' => 'kurtosis',
    'latitude' => 'latitude',
    'longitude' => 'longitude',
    'location' => 'location',
    'experiment_start_time' => 'experiment_start_time',
    'experiment_end_time' => 'experiment_end_time',
    'created_at' => 'created_at',
    'updated_at' => 'updated_at',
    'outcome' => 'outcome',
    'sources' => 'sources',
    'earliest_source_time' => 'earliest_source_time',
    'latest_source_time' => 'latest_source_time',
    'earliest_measurement_time' => 'earliest_measurement_time',
    'latest_measurement_time' => 'latest_measurement_time',
    'earliest_filling_time' => 'earliest_filling_time',
    'latest_filling_time' => 'latest_filling_time'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
