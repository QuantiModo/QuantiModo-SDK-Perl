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
package WWW::SwaggerClient::Object::Variable;

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
                                  class => 'Variable',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'id' => {
    	datatype => 'int',
    	base_name => 'id',
    	description => 'Variable ID',
    	format => '',
    	read_only => '',
    		},
    'name' => {
    	datatype => 'string',
    	base_name => 'name',
    	description => 'User-defined variable display name.',
    	format => '',
    	read_only => '',
    		},
    'original_name' => {
    	datatype => 'string',
    	base_name => 'originalName',
    	description => 'Name used when the variable was originally created in the &#x60;variables&#x60; table.',
    	format => '',
    	read_only => '',
    		},
    'category' => {
    	datatype => 'string',
    	base_name => 'category',
    	description => 'Variable category like Mood, Sleep, Physical Activity, Treatment, Symptom, etc.',
    	format => '',
    	read_only => '',
    		},
    'abbreviated_unit_name' => {
    	datatype => 'string',
    	base_name => 'abbreviatedUnitName',
    	description => 'Abbreviated name of the default unit for the variable',
    	format => '',
    	read_only => '',
    		},
    'abbreviated_unit_id' => {
    	datatype => 'int',
    	base_name => 'abbreviatedUnitId',
    	description => 'Id of the default unit for the variable',
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
    'minimum_value' => {
    	datatype => 'double',
    	base_name => 'minimumValue',
    	description => 'Minimum reasonable value for this variable (uses default unit)',
    	format => '',
    	read_only => '',
    		},
    'maximum_value' => {
    	datatype => 'double',
    	base_name => 'maximumValue',
    	description => 'Maximum reasonable value for this variable (uses default unit)',
    	format => '',
    	read_only => '',
    		},
    'combination_operation' => {
    	datatype => 'string',
    	base_name => 'combinationOperation',
    	description => 'Way to aggregate measurements over time. Options are \&quot;MEAN\&quot; or \&quot;SUM\&quot;.  SUM should be used for things like minutes of exercise.  If you use MEAN for exercise, then a person might exercise more minutes in one day but add separate measurements that were smaller.  So when we are doing correlational analysis, we would think that the person exercised less that day even though they exercised more.  Conversely, we must use MEAN for things such as ratings which cannot be SUMMED.',
    	format => '',
    	read_only => '',
    		},
    'filling_value' => {
    	datatype => 'double',
    	base_name => 'fillingValue',
    	description => 'Value for replacing null measurements',
    	format => '',
    	read_only => '',
    		},
    'join_with' => {
    	datatype => 'string',
    	base_name => 'joinWith',
    	description => 'The Variable this Variable should be joined with. If the variable is joined with some other variable then it is not shown to user in the list of variables.',
    	format => '',
    	read_only => '',
    		},
    'joined_variables' => {
    	datatype => 'ARRAY[Variable]',
    	base_name => 'joinedVariables',
    	description => 'Array of Variables that are joined with this Variable',
    	format => '',
    	read_only => '',
    		},
    'parent' => {
    	datatype => 'int',
    	base_name => 'parent',
    	description => 'Id of the parent variable if this variable has any parent',
    	format => '',
    	read_only => '',
    		},
    'sub_variables' => {
    	datatype => 'ARRAY[Variable]',
    	base_name => 'subVariables',
    	description => 'Array of Variables that are sub variables to this Variable',
    	format => '',
    	read_only => '',
    		},
    'onset_delay' => {
    	datatype => 'int',
    	base_name => 'onsetDelay',
    	description => 'How long it takes for a measurement in this variable to take effect',
    	format => '',
    	read_only => '',
    		},
    'duration_of_action' => {
    	datatype => 'int',
    	base_name => 'durationOfAction',
    	description => 'How long the effect of a measurement in this variable lasts',
    	format => '',
    	read_only => '',
    		},
    'earliest_measurement_time' => {
    	datatype => 'int',
    	base_name => 'earliestMeasurementTime',
    	description => 'Earliest measurement time',
    	format => '',
    	read_only => '',
    		},
    'latest_measurement_time' => {
    	datatype => 'int',
    	base_name => 'latestMeasurementTime',
    	description => 'Latest measurement time',
    	format => '',
    	read_only => '',
    		},
    'updated' => {
    	datatype => 'int',
    	base_name => 'updated',
    	description => 'When this variable or its settings were last updated',
    	format => '',
    	read_only => '',
    		},
    'cause_only' => {
    	datatype => 'int',
    	base_name => 'causeOnly',
    	description => 'A value of 1 indicates that this variable is generally a cause in a causal relationship.  An example of a causeOnly variable would be a variable such as Cloud Cover which would generally not be influenced by the behaviour of the user.',
    	format => '',
    	read_only => '',
    		},
    'number_of_correlations' => {
    	datatype => 'int',
    	base_name => 'numberOfCorrelations',
    	description => 'Number of correlations',
    	format => '',
    	read_only => '',
    		},
    'outcome' => {
    	datatype => 'int',
    	base_name => 'outcome',
    	description => 'Outcome variables (those with &#x60;outcome&#x60; &#x3D;&#x3D; 1) are variables for which a human would generally want to identify the influencing factors.  These include symptoms of illness, physique, mood, cognitive performance, etc.  Generally correlation calculations are only performed on outcome variables.',
    	format => '',
    	read_only => '',
    		},
    'measurements_at_last_analysis' => {
    	datatype => 'int',
    	base_name => 'measurementsAtLastAnalysis',
    	description => 'The number of measurements that a given user had for this variable the last time a correlation calculation was performed. Generally correlation values are only updated once the current number of measurements for a variable is more than 10% greater than the measurementsAtLastAnalysis.  This avoids a computationally-demanding recalculation when there&#39;s not enough new data to make a significant difference in the correlation.',
    	format => '',
    	read_only => '',
    		},
    'number_of_measurements' => {
    	datatype => 'int',
    	base_name => 'numberOfMeasurements',
    	description => 'Number of measurements',
    	format => '',
    	read_only => '',
    		},
    'last_unit' => {
    	datatype => 'string',
    	base_name => 'lastUnit',
    	description => 'Last unit',
    	format => '',
    	read_only => '',
    		},
    'last_value' => {
    	datatype => 'int',
    	base_name => 'lastValue',
    	description => 'Last value',
    	format => '',
    	read_only => '',
    		},
    'most_common_value' => {
    	datatype => 'int',
    	base_name => 'mostCommonValue',
    	description => 'Most common value',
    	format => '',
    	read_only => '',
    		},
    'most_common_unit' => {
    	datatype => 'string',
    	base_name => 'mostCommonUnit',
    	description => 'Most common unit',
    	format => '',
    	read_only => '',
    		},
    'last_source' => {
    	datatype => 'int',
    	base_name => 'lastSource',
    	description => 'Last source',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'id' => 'int',
    'name' => 'string',
    'original_name' => 'string',
    'category' => 'string',
    'abbreviated_unit_name' => 'string',
    'abbreviated_unit_id' => 'int',
    'sources' => 'string',
    'minimum_value' => 'double',
    'maximum_value' => 'double',
    'combination_operation' => 'string',
    'filling_value' => 'double',
    'join_with' => 'string',
    'joined_variables' => 'ARRAY[Variable]',
    'parent' => 'int',
    'sub_variables' => 'ARRAY[Variable]',
    'onset_delay' => 'int',
    'duration_of_action' => 'int',
    'earliest_measurement_time' => 'int',
    'latest_measurement_time' => 'int',
    'updated' => 'int',
    'cause_only' => 'int',
    'number_of_correlations' => 'int',
    'outcome' => 'int',
    'measurements_at_last_analysis' => 'int',
    'number_of_measurements' => 'int',
    'last_unit' => 'string',
    'last_value' => 'int',
    'most_common_value' => 'int',
    'most_common_unit' => 'string',
    'last_source' => 'int'
} );

__PACKAGE__->attribute_map( {
    'id' => 'id',
    'name' => 'name',
    'original_name' => 'originalName',
    'category' => 'category',
    'abbreviated_unit_name' => 'abbreviatedUnitName',
    'abbreviated_unit_id' => 'abbreviatedUnitId',
    'sources' => 'sources',
    'minimum_value' => 'minimumValue',
    'maximum_value' => 'maximumValue',
    'combination_operation' => 'combinationOperation',
    'filling_value' => 'fillingValue',
    'join_with' => 'joinWith',
    'joined_variables' => 'joinedVariables',
    'parent' => 'parent',
    'sub_variables' => 'subVariables',
    'onset_delay' => 'onsetDelay',
    'duration_of_action' => 'durationOfAction',
    'earliest_measurement_time' => 'earliestMeasurementTime',
    'latest_measurement_time' => 'latestMeasurementTime',
    'updated' => 'updated',
    'cause_only' => 'causeOnly',
    'number_of_correlations' => 'numberOfCorrelations',
    'outcome' => 'outcome',
    'measurements_at_last_analysis' => 'measurementsAtLastAnalysis',
    'number_of_measurements' => 'numberOfMeasurements',
    'last_unit' => 'lastUnit',
    'last_value' => 'lastValue',
    'most_common_value' => 'mostCommonValue',
    'most_common_unit' => 'mostCommonUnit',
    'last_source' => 'lastSource'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
