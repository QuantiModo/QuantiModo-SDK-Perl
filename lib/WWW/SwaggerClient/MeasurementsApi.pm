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
package WWW::SwaggerClient::MeasurementsApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use WWW::SwaggerClient::ApiClient;
use WWW::SwaggerClient::Configuration;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class   = shift;
    my (%self) = (
        'api_client' => WWW::SwaggerClient::ApiClient->instance,
        @_
    );

    #my $self = {
    #    #api_client => $options->{api_client}
    #    api_client => $default_api_client
    #}; 

    bless \%self, $class;

}


#
# v1_measurement_sources_get
#
# Get measurement sources
# 
{
    my $params = {
    };
    __PACKAGE__->method_documentation->{ v1_measurement_sources_get } = { 
    	summary => 'Get measurement sources',
        params => $params,
        returns => 'MeasurementSource',
        };
}
# @return MeasurementSource
#
sub v1_measurement_sources_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/measurementSources';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('MeasurementSource', $response);
    return $_response_object;
}

#
# v1_measurement_sources_post
#
# Add a data source
# 
# @param MeasurementSource $body An array of names of data sources you want to add. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'body' => {
        data_type => 'MeasurementSource',
        description => 'An array of names of data sources you want to add.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_measurement_sources_post } = { 
    	summary => 'Add a data source',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_measurement_sources_post {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling v1_measurement_sources_post");
    }

    # parse inputs
    my $_resource_path = '/v1/measurementSources';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# v1_measurements_daily_get
#
# Get daily measurements for this user
# 
# @param string $variable_name Name of the variable you want measurements for (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $abbreviated_unit_name The unit your want the measurements in (optional)
# @param string $start_time The lower limit of measurements returned (Iso8601) (optional)
# @param string $end_time The upper limit of measurements returned (Iso8601) (optional)
# @param int $grouping_width The time (in seconds) over which measurements are grouped together (optional)
# @param string $grouping_timezone The time (in seconds) over which measurements are grouped together (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. (optional)
# @param int $offset Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. (optional)
# @param int $sort Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. (optional)
{
    my $params = {
    'variable_name' => {
        data_type => 'string',
        description => 'Name of the variable you want measurements for',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'abbreviated_unit_name' => {
        data_type => 'string',
        description => 'The unit your want the measurements in',
        required => '0',
    },
    'start_time' => {
        data_type => 'string',
        description => 'The lower limit of measurements returned (Iso8601)',
        required => '0',
    },
    'end_time' => {
        data_type => 'string',
        description => 'The upper limit of measurements returned (Iso8601)',
        required => '0',
    },
    'grouping_width' => {
        data_type => 'int',
        description => 'The time (in seconds) over which measurements are grouped together',
        required => '0',
    },
    'grouping_timezone' => {
        data_type => 'string',
        description => 'The time (in seconds) over which measurements are grouped together',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10.',
        required => '0',
    },
    'sort' => {
        data_type => 'int',
        description => 'Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_measurements_daily_get } = { 
    	summary => 'Get daily measurements for this user',
        params => $params,
        returns => 'Measurement',
        };
}
# @return Measurement
#
sub v1_measurements_daily_get {
    my ($self, %args) = @_;

    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_measurements_daily_get");
    }

    # parse inputs
    my $_resource_path = '/v1/measurements/daily';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    # query params
    if ( exists $args{'variable_name'}) {
        $query_params->{'variableName'} = $self->{api_client}->to_query_value($args{'variable_name'});
    }

    # query params
    if ( exists $args{'abbreviated_unit_name'}) {
        $query_params->{'abbreviatedUnitName'} = $self->{api_client}->to_query_value($args{'abbreviated_unit_name'});
    }

    # query params
    if ( exists $args{'start_time'}) {
        $query_params->{'startTime'} = $self->{api_client}->to_query_value($args{'start_time'});
    }

    # query params
    if ( exists $args{'end_time'}) {
        $query_params->{'endTime'} = $self->{api_client}->to_query_value($args{'end_time'});
    }

    # query params
    if ( exists $args{'grouping_width'}) {
        $query_params->{'groupingWidth'} = $self->{api_client}->to_query_value($args{'grouping_width'});
    }

    # query params
    if ( exists $args{'grouping_timezone'}) {
        $query_params->{'groupingTimezone'} = $self->{api_client}->to_query_value($args{'grouping_timezone'});
    }

    # query params
    if ( exists $args{'limit'}) {
        $query_params->{'limit'} = $self->{api_client}->to_query_value($args{'limit'});
    }

    # query params
    if ( exists $args{'offset'}) {
        $query_params->{'offset'} = $self->{api_client}->to_query_value($args{'offset'});
    }

    # query params
    if ( exists $args{'sort'}) {
        $query_params->{'sort'} = $self->{api_client}->to_query_value($args{'sort'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Measurement', $response);
    return $_response_object;
}

#
# v1_measurements_delete_post
#
# Delete a measurement
# 
# @param MeasurementDelete $body The startTime and variableId of the measurement to be deleted. (required)
{
    my $params = {
    'body' => {
        data_type => 'MeasurementDelete',
        description => 'The startTime and variableId of the measurement to be deleted.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ v1_measurements_delete_post } = { 
    	summary => 'Delete a measurement',
        params => $params,
        returns => 'CommonResponse',
        };
}
# @return CommonResponse
#
sub v1_measurements_delete_post {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling v1_measurements_delete_post");
    }

    # parse inputs
    my $_resource_path = '/v1/measurements/delete';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('CommonResponse', $response);
    return $_response_object;
}

#
# v1_measurements_get
#
# Get measurements for this user
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $variable_name Name of the variable you want measurements for (optional)
# @param string $variable_category_name Name of the variable category you want measurements for (optional)
# @param string $source Name of the source you want measurements for (supports exact name match only) (optional)
# @param string $value Value of measurement (optional)
# @param string $last_updated The time that this measurement was created or last updated in the format \&quot;YYYY-MM-DDThh:mm:ss\&quot; (optional)
# @param string $unit The unit you want the measurements returned in (optional)
# @param string $start_time The lower limit of measurements returned (Epoch) (optional)
# @param string $created_at The time the measurement record was first created in the format YYYY-MM-DDThh:mm:ss. Time zone should be UTC and not local. (optional)
# @param string $updated_at The time the measurement record was last changed in the format YYYY-MM-DDThh:mm:ss. Time zone should be UTC and not local. (optional)
# @param string $end_time The upper limit of measurements returned (Epoch) (optional)
# @param int $grouping_width The time (in seconds) over which measurements are grouped together (optional)
# @param string $grouping_timezone The time (in seconds) over which measurements are grouped together (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. (optional)
# @param int $offset Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. (optional)
# @param int $sort Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'variable_name' => {
        data_type => 'string',
        description => 'Name of the variable you want measurements for',
        required => '0',
    },
    'variable_category_name' => {
        data_type => 'string',
        description => 'Name of the variable category you want measurements for',
        required => '0',
    },
    'source' => {
        data_type => 'string',
        description => 'Name of the source you want measurements for (supports exact name match only)',
        required => '0',
    },
    'value' => {
        data_type => 'string',
        description => 'Value of measurement',
        required => '0',
    },
    'last_updated' => {
        data_type => 'string',
        description => 'The time that this measurement was created or last updated in the format \&quot;YYYY-MM-DDThh:mm:ss\&quot;',
        required => '0',
    },
    'unit' => {
        data_type => 'string',
        description => 'The unit you want the measurements returned in',
        required => '0',
    },
    'start_time' => {
        data_type => 'string',
        description => 'The lower limit of measurements returned (Epoch)',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'The time the measurement record was first created in the format YYYY-MM-DDThh:mm:ss. Time zone should be UTC and not local.',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'The time the measurement record was last changed in the format YYYY-MM-DDThh:mm:ss. Time zone should be UTC and not local.',
        required => '0',
    },
    'end_time' => {
        data_type => 'string',
        description => 'The upper limit of measurements returned (Epoch)',
        required => '0',
    },
    'grouping_width' => {
        data_type => 'int',
        description => 'The time (in seconds) over which measurements are grouped together',
        required => '0',
    },
    'grouping_timezone' => {
        data_type => 'string',
        description => 'The time (in seconds) over which measurements are grouped together',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10.',
        required => '0',
    },
    'sort' => {
        data_type => 'int',
        description => 'Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_measurements_get } = { 
    	summary => 'Get measurements for this user',
        params => $params,
        returns => 'Measurement',
        };
}
# @return Measurement
#
sub v1_measurements_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/measurements';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    # query params
    if ( exists $args{'variable_name'}) {
        $query_params->{'variableName'} = $self->{api_client}->to_query_value($args{'variable_name'});
    }

    # query params
    if ( exists $args{'variable_category_name'}) {
        $query_params->{'variableCategoryName'} = $self->{api_client}->to_query_value($args{'variable_category_name'});
    }

    # query params
    if ( exists $args{'source'}) {
        $query_params->{'source'} = $self->{api_client}->to_query_value($args{'source'});
    }

    # query params
    if ( exists $args{'value'}) {
        $query_params->{'value'} = $self->{api_client}->to_query_value($args{'value'});
    }

    # query params
    if ( exists $args{'last_updated'}) {
        $query_params->{'lastUpdated'} = $self->{api_client}->to_query_value($args{'last_updated'});
    }

    # query params
    if ( exists $args{'unit'}) {
        $query_params->{'unit'} = $self->{api_client}->to_query_value($args{'unit'});
    }

    # query params
    if ( exists $args{'start_time'}) {
        $query_params->{'startTime'} = $self->{api_client}->to_query_value($args{'start_time'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'createdAt'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updatedAt'} = $self->{api_client}->to_query_value($args{'updated_at'});
    }

    # query params
    if ( exists $args{'end_time'}) {
        $query_params->{'endTime'} = $self->{api_client}->to_query_value($args{'end_time'});
    }

    # query params
    if ( exists $args{'grouping_width'}) {
        $query_params->{'groupingWidth'} = $self->{api_client}->to_query_value($args{'grouping_width'});
    }

    # query params
    if ( exists $args{'grouping_timezone'}) {
        $query_params->{'groupingTimezone'} = $self->{api_client}->to_query_value($args{'grouping_timezone'});
    }

    # query params
    if ( exists $args{'limit'}) {
        $query_params->{'limit'} = $self->{api_client}->to_query_value($args{'limit'});
    }

    # query params
    if ( exists $args{'offset'}) {
        $query_params->{'offset'} = $self->{api_client}->to_query_value($args{'offset'});
    }

    # query params
    if ( exists $args{'sort'}) {
        $query_params->{'sort'} = $self->{api_client}->to_query_value($args{'sort'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Measurement', $response);
    return $_response_object;
}

#
# v1_measurements_post
#
# Post a new set or update existing measurements to the database
# 
# @param MeasurementSet $body An array of measurements you want to insert. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'body' => {
        data_type => 'MeasurementSet',
        description => 'An array of measurements you want to insert.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_measurements_post } = { 
    	summary => 'Post a new set or update existing measurements to the database',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_measurements_post {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling v1_measurements_post");
    }

    # parse inputs
    my $_resource_path = '/v1/measurements';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# v1_measurements_range_get
#
# Get measurements range for this user
# 
# @param string $sources Enter source name to limit to specific source (varchar) (optional)
# @param int $user If not specified, uses currently logged in user (bigint) (optional)
{
    my $params = {
    'sources' => {
        data_type => 'string',
        description => 'Enter source name to limit to specific source (varchar)',
        required => '0',
    },
    'user' => {
        data_type => 'int',
        description => 'If not specified, uses currently logged in user (bigint)',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_measurements_range_get } = { 
    	summary => 'Get measurements range for this user',
        params => $params,
        returns => 'MeasurementRange',
        };
}
# @return MeasurementRange
#
sub v1_measurements_range_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/measurementsRange';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'sources'}) {
        $query_params->{'sources'} = $self->{api_client}->to_query_value($args{'sources'});
    }

    # query params
    if ( exists $args{'user'}) {
        $query_params->{'user'} = $self->{api_client}->to_query_value($args{'user'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('MeasurementRange', $response);
    return $_response_object;
}

#
# v2_measurements_csv_get
#
# Get Measurements CSV
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_measurements_csv_get } = { 
    	summary => 'Get Measurements CSV',
        params => $params,
        returns => 'File',
        };
}
# @return File
#
sub v2_measurements_csv_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/measurements/csv';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('text/csv');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(quantimodo_oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('File', $response);
    return $_response_object;
}

#
# v2_measurements_id_delete
#
# Delete Measurement
# 
# @param int $id id of Measurement (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of Measurement',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_measurements_id_delete } = { 
    	summary => 'Delete Measurement',
        params => $params,
        returns => 'InlineResponse20012',
        };
}
# @return InlineResponse20012
#
sub v2_measurements_id_delete {
    my ($self, %args) = @_;

    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling v2_measurements_id_delete");
    }

    # parse inputs
    my $_resource_path = '/v2/measurements/{id}';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'DELETE';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    # path params
    if ( exists $args{'id'}) {
        my $_base_variable = "{" . "id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(quantimodo_oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse20012', $response);
    return $_response_object;
}

#
# v2_measurements_id_get
#
# Get Measurement
# 
# @param int $id id of Measurement (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of Measurement',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_measurements_id_get } = { 
    	summary => 'Get Measurement',
        params => $params,
        returns => 'InlineResponse20011',
        };
}
# @return InlineResponse20011
#
sub v2_measurements_id_get {
    my ($self, %args) = @_;

    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling v2_measurements_id_get");
    }

    # parse inputs
    my $_resource_path = '/v2/measurements/{id}';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    # path params
    if ( exists $args{'id'}) {
        my $_base_variable = "{" . "id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(quantimodo_oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse20011', $response);
    return $_response_object;
}

#
# v2_measurements_id_put
#
# Update Measurement
# 
# @param int $id id of Measurement (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param Measurement $body Measurement that should be updated (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of Measurement',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'body' => {
        data_type => 'Measurement',
        description => 'Measurement that should be updated',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_measurements_id_put } = { 
    	summary => 'Update Measurement',
        params => $params,
        returns => 'InlineResponse20012',
        };
}
# @return InlineResponse20012
#
sub v2_measurements_id_put {
    my ($self, %args) = @_;

    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling v2_measurements_id_put");
    }

    # parse inputs
    my $_resource_path = '/v2/measurements/{id}';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'PUT';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    # path params
    if ( exists $args{'id'}) {
        my $_base_variable = "{" . "id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(quantimodo_oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse20012', $response);
    return $_response_object;
}

#
# v2_measurements_request_csv_post
#
# Post Request for Measurements CSV
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_measurements_request_csv_post } = { 
    	summary => 'Post Request for Measurements CSV',
        params => $params,
        returns => 'int',
        };
}
# @return int
#
sub v2_measurements_request_csv_post {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/measurements/request_csv';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(quantimodo_oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('int', $response);
    return $_response_object;
}

#
# v2_measurements_request_pdf_post
#
# Post Request for Measurements PDF
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_measurements_request_pdf_post } = { 
    	summary => 'Post Request for Measurements PDF',
        params => $params,
        returns => 'int',
        };
}
# @return int
#
sub v2_measurements_request_pdf_post {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/measurements/request_pdf';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(quantimodo_oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('int', $response);
    return $_response_object;
}

#
# v2_measurements_request_xls_post
#
# Post Request for Measurements XLS
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_measurements_request_xls_post } = { 
    	summary => 'Post Request for Measurements XLS',
        params => $params,
        returns => 'int',
        };
}
# @return int
#
sub v2_measurements_request_xls_post {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/measurements/request_xls';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'access_token'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(quantimodo_oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('int', $response);
    return $_response_object;
}

1;
