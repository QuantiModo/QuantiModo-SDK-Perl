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
package WWW::SwaggerClient::ApplicationEndpointsApi;

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
# v2_application_connections_get
#
# Get all Connections
# 
# @param string $access_token Application&#39;s OAuth2 access token (optional)
# @param int $connector_id The id for the connector data source for which the connection is connected (optional)
# @param string $connect_status Indicates whether a connector is currently connected to a service for a user. (optional)
# @param string $connect_error Error message if there is a problem with authorizing this connection. (optional)
# @param string $update_requested_at Time at which an update was requested by a user. (optional)
# @param string $update_status Indicates whether a connector is currently updated. (optional)
# @param string $update_error Indicates if there was an error during the update. (optional)
# @param string $last_successful_updated_at The time at which the connector was last successfully updated. (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format  (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format  (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'Application&#39;s OAuth2 access token',
        required => '0',
    },
    'connector_id' => {
        data_type => 'int',
        description => 'The id for the connector data source for which the connection is connected',
        required => '0',
    },
    'connect_status' => {
        data_type => 'string',
        description => 'Indicates whether a connector is currently connected to a service for a user.',
        required => '0',
    },
    'connect_error' => {
        data_type => 'string',
        description => 'Error message if there is a problem with authorizing this connection.',
        required => '0',
    },
    'update_requested_at' => {
        data_type => 'string',
        description => 'Time at which an update was requested by a user.',
        required => '0',
    },
    'update_status' => {
        data_type => 'string',
        description => 'Indicates whether a connector is currently updated.',
        required => '0',
    },
    'update_error' => {
        data_type => 'string',
        description => 'Indicates if there was an error during the update.',
        required => '0',
    },
    'last_successful_updated_at' => {
        data_type => 'string',
        description => 'The time at which the connector was last successfully updated.',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format ',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format ',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_connections_get } = { 
    	summary => 'Get all Connections',
        params => $params,
        returns => 'InlineResponse2003',
        };
}
# @return InlineResponse2003
#
sub v2_application_connections_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/connections';
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
    if ( exists $args{'connector_id'}) {
        $query_params->{'connector_id'} = $self->{api_client}->to_query_value($args{'connector_id'});
    }

    # query params
    if ( exists $args{'connect_status'}) {
        $query_params->{'connect_status'} = $self->{api_client}->to_query_value($args{'connect_status'});
    }

    # query params
    if ( exists $args{'connect_error'}) {
        $query_params->{'connect_error'} = $self->{api_client}->to_query_value($args{'connect_error'});
    }

    # query params
    if ( exists $args{'update_requested_at'}) {
        $query_params->{'update_requested_at'} = $self->{api_client}->to_query_value($args{'update_requested_at'});
    }

    # query params
    if ( exists $args{'update_status'}) {
        $query_params->{'update_status'} = $self->{api_client}->to_query_value($args{'update_status'});
    }

    # query params
    if ( exists $args{'update_error'}) {
        $query_params->{'update_error'} = $self->{api_client}->to_query_value($args{'update_error'});
    }

    # query params
    if ( exists $args{'last_successful_updated_at'}) {
        $query_params->{'last_successful_updated_at'} = $self->{api_client}->to_query_value($args{'last_successful_updated_at'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse2003', $response);
    return $_response_object;
}

#
# v2_application_credentials_get
#
# Get all Credentials
# 
# @param string $access_token Application&#39;s OAuth2 access token (optional)
# @param int $connector_id The id for the connector data source from which the credential was obtained (optional)
# @param string $attr_key Attribute name such as token, userid, username, or password (optional)
# @param string $attr_value Encrypted value for the attribute specified (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format  (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format  (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'Application&#39;s OAuth2 access token',
        required => '0',
    },
    'connector_id' => {
        data_type => 'int',
        description => 'The id for the connector data source from which the credential was obtained',
        required => '0',
    },
    'attr_key' => {
        data_type => 'string',
        description => 'Attribute name such as token, userid, username, or password',
        required => '0',
    },
    'attr_value' => {
        data_type => 'string',
        description => 'Encrypted value for the attribute specified',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format ',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format ',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_credentials_get } = { 
    	summary => 'Get all Credentials',
        params => $params,
        returns => 'InlineResponse2004',
        };
}
# @return InlineResponse2004
#
sub v2_application_credentials_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/credentials';
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
    if ( exists $args{'connector_id'}) {
        $query_params->{'connector_id'} = $self->{api_client}->to_query_value($args{'connector_id'});
    }

    # query params
    if ( exists $args{'attr_key'}) {
        $query_params->{'attr_key'} = $self->{api_client}->to_query_value($args{'attr_key'});
    }

    # query params
    if ( exists $args{'attr_value'}) {
        $query_params->{'attr_value'} = $self->{api_client}->to_query_value($args{'attr_value'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse2004', $response);
    return $_response_object;
}

#
# v2_application_measurements_get
#
# Get measurements for all users using your application
# 
# @param string $access_token Application&#39;s OAuth2 access token (optional)
# @param string $client_id The ID of the client application which originally stored the measurement (optional)
# @param int $connector_id The id for the connector data source from which the measurement was obtained (optional)
# @param int $variable_id ID of the variable for which we are creating the measurement records (optional)
# @param int $source_id Application or device used to record the measurement values (optional)
# @param string $start_time start time for the measurement event. Use ISO 8601 datetime format  (optional)
# @param Number $value The value of the measurement after conversion to the default unit for that variable (optional)
# @param int $unit_id The default unit id for the variable (optional)
# @param Number $original_value Unconverted value of measurement as originally posted (before conversion to default unit) (optional)
# @param int $original_unit_id Unit id of the measurement as originally submitted (optional)
# @param int $duration Duration of the event being measurement in seconds (optional)
# @param string $note An optional note the user may include with their measurement (optional)
# @param Number $latitude Latitude at which the measurement was taken (optional)
# @param Number $longitude Longitude at which the measurement was taken (optional)
# @param string $location Optional human readable name for the location where the measurement was recorded (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format  (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format  (optional)
# @param string $error An error message if there is a problem with the measurement (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'Application&#39;s OAuth2 access token',
        required => '0',
    },
    'client_id' => {
        data_type => 'string',
        description => 'The ID of the client application which originally stored the measurement',
        required => '0',
    },
    'connector_id' => {
        data_type => 'int',
        description => 'The id for the connector data source from which the measurement was obtained',
        required => '0',
    },
    'variable_id' => {
        data_type => 'int',
        description => 'ID of the variable for which we are creating the measurement records',
        required => '0',
    },
    'source_id' => {
        data_type => 'int',
        description => 'Application or device used to record the measurement values',
        required => '0',
    },
    'start_time' => {
        data_type => 'string',
        description => 'start time for the measurement event. Use ISO 8601 datetime format ',
        required => '0',
    },
    'value' => {
        data_type => 'Number',
        description => 'The value of the measurement after conversion to the default unit for that variable',
        required => '0',
    },
    'unit_id' => {
        data_type => 'int',
        description => 'The default unit id for the variable',
        required => '0',
    },
    'original_value' => {
        data_type => 'Number',
        description => 'Unconverted value of measurement as originally posted (before conversion to default unit)',
        required => '0',
    },
    'original_unit_id' => {
        data_type => 'int',
        description => 'Unit id of the measurement as originally submitted',
        required => '0',
    },
    'duration' => {
        data_type => 'int',
        description => 'Duration of the event being measurement in seconds',
        required => '0',
    },
    'note' => {
        data_type => 'string',
        description => 'An optional note the user may include with their measurement',
        required => '0',
    },
    'latitude' => {
        data_type => 'Number',
        description => 'Latitude at which the measurement was taken',
        required => '0',
    },
    'longitude' => {
        data_type => 'Number',
        description => 'Longitude at which the measurement was taken',
        required => '0',
    },
    'location' => {
        data_type => 'string',
        description => 'Optional human readable name for the location where the measurement was recorded',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format ',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format ',
        required => '0',
    },
    'error' => {
        data_type => 'string',
        description => 'An error message if there is a problem with the measurement',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_measurements_get } = { 
    	summary => 'Get measurements for all users using your application',
        params => $params,
        returns => 'InlineResponse2005',
        };
}
# @return InlineResponse2005
#
sub v2_application_measurements_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/measurements';
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
    if ( exists $args{'client_id'}) {
        $query_params->{'client_id'} = $self->{api_client}->to_query_value($args{'client_id'});
    }

    # query params
    if ( exists $args{'connector_id'}) {
        $query_params->{'connector_id'} = $self->{api_client}->to_query_value($args{'connector_id'});
    }

    # query params
    if ( exists $args{'variable_id'}) {
        $query_params->{'variable_id'} = $self->{api_client}->to_query_value($args{'variable_id'});
    }

    # query params
    if ( exists $args{'source_id'}) {
        $query_params->{'source_id'} = $self->{api_client}->to_query_value($args{'source_id'});
    }

    # query params
    if ( exists $args{'start_time'}) {
        $query_params->{'start_time'} = $self->{api_client}->to_query_value($args{'start_time'});
    }

    # query params
    if ( exists $args{'value'}) {
        $query_params->{'value'} = $self->{api_client}->to_query_value($args{'value'});
    }

    # query params
    if ( exists $args{'unit_id'}) {
        $query_params->{'unit_id'} = $self->{api_client}->to_query_value($args{'unit_id'});
    }

    # query params
    if ( exists $args{'original_value'}) {
        $query_params->{'original_value'} = $self->{api_client}->to_query_value($args{'original_value'});
    }

    # query params
    if ( exists $args{'original_unit_id'}) {
        $query_params->{'original_unit_id'} = $self->{api_client}->to_query_value($args{'original_unit_id'});
    }

    # query params
    if ( exists $args{'duration'}) {
        $query_params->{'duration'} = $self->{api_client}->to_query_value($args{'duration'});
    }

    # query params
    if ( exists $args{'note'}) {
        $query_params->{'note'} = $self->{api_client}->to_query_value($args{'note'});
    }

    # query params
    if ( exists $args{'latitude'}) {
        $query_params->{'latitude'} = $self->{api_client}->to_query_value($args{'latitude'});
    }

    # query params
    if ( exists $args{'longitude'}) {
        $query_params->{'longitude'} = $self->{api_client}->to_query_value($args{'longitude'});
    }

    # query params
    if ( exists $args{'location'}) {
        $query_params->{'location'} = $self->{api_client}->to_query_value($args{'location'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
    }

    # query params
    if ( exists $args{'error'}) {
        $query_params->{'error'} = $self->{api_client}->to_query_value($args{'error'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse2005', $response);
    return $_response_object;
}

#
# v2_application_tracking_reminders_get
#
# Get tracking reminders
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $client_id The ID of the client application which last created or updated this trackingReminder (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format  (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format  (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'client_id' => {
        data_type => 'string',
        description => 'The ID of the client application which last created or updated this trackingReminder',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format ',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format ',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_tracking_reminders_get } = { 
    	summary => 'Get tracking reminders',
        params => $params,
        returns => 'InlineResponse2001',
        };
}
# @return InlineResponse2001
#
sub v2_application_tracking_reminders_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/trackingReminders';
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
    if ( exists $args{'client_id'}) {
        $query_params->{'client_id'} = $self->{api_client}->to_query_value($args{'client_id'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse2001', $response);
    return $_response_object;
}

#
# v2_application_updates_get
#
# Get all Updates
# 
# @param string $access_token Application&#39;s OAuth2 access token (optional)
# @param int $connector_id connector_id (optional)
# @param int $number_of_measurements number_of_measurements (optional)
# @param boolean $success success (optional)
# @param string $message message (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format  (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format  (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'Application&#39;s OAuth2 access token',
        required => '0',
    },
    'connector_id' => {
        data_type => 'int',
        description => 'connector_id',
        required => '0',
    },
    'number_of_measurements' => {
        data_type => 'int',
        description => 'number_of_measurements',
        required => '0',
    },
    'success' => {
        data_type => 'boolean',
        description => 'success',
        required => '0',
    },
    'message' => {
        data_type => 'string',
        description => 'message',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format ',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format ',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_updates_get } = { 
    	summary => 'Get all Updates',
        params => $params,
        returns => 'InlineResponse2006',
        };
}
# @return InlineResponse2006
#
sub v2_application_updates_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/updates';
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
    if ( exists $args{'connector_id'}) {
        $query_params->{'connector_id'} = $self->{api_client}->to_query_value($args{'connector_id'});
    }

    # query params
    if ( exists $args{'number_of_measurements'}) {
        $query_params->{'number_of_measurements'} = $self->{api_client}->to_query_value($args{'number_of_measurements'});
    }

    # query params
    if ( exists $args{'success'}) {
        $query_params->{'success'} = $self->{api_client}->to_query_value($args{'success'});
    }

    # query params
    if ( exists $args{'message'}) {
        $query_params->{'message'} = $self->{api_client}->to_query_value($args{'message'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse2006', $response);
    return $_response_object;
}

#
# v2_application_user_variable_relationships_get
#
# Get all UserVariableRelationships
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param int $id id (optional)
# @param string $confidence_level Our confidence that a consistent predictive relationship exists based on the amount of evidence, reproducibility, and other factors (optional)
# @param Number $confidence_score A quantitative representation of our confidence that a consistent predictive relationship exists based on the amount of evidence, reproducibility, and other factors (optional)
# @param string $direction Direction is positive if higher predictor values generally precede higher outcome values. Direction is negative if higher predictor values generally precede lower outcome values. (optional)
# @param int $duration_of_action Estimated number of seconds following the onset delay in which a stimulus produces a perceivable effect (optional)
# @param string $error_message error_message (optional)
# @param int $onset_delay Estimated number of seconds that pass before a stimulus produces a perceivable effect (optional)
# @param int $outcome_variable_id Variable ID for the outcome variable (optional)
# @param int $predictor_variable_id Variable ID for the predictor variable (optional)
# @param int $predictor_unit_id ID for default unit of the predictor variable (optional)
# @param Number $sinn_rank A value representative of the relevance of this predictor relative to other predictors of this outcome.  Usually used for relevancy sorting. (optional)
# @param string $strength_level Can be weak, medium, or strong based on the size of the effect which the predictor appears to have on the outcome relative to other variable relationship strength scores. (optional)
# @param Number $strength_score A value represented to the size of the effect which the predictor appears to have on the outcome. (optional)
# @param string $vote vote (optional)
# @param Number $value_predicting_high_outcome Value for the predictor variable (in it&#39;s default unit) which typically precedes an above average outcome value (optional)
# @param Number $value_predicting_low_outcome Value for the predictor variable (in it&#39;s default unit) which typically precedes a below average outcome value (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'id' => {
        data_type => 'int',
        description => 'id',
        required => '0',
    },
    'confidence_level' => {
        data_type => 'string',
        description => 'Our confidence that a consistent predictive relationship exists based on the amount of evidence, reproducibility, and other factors',
        required => '0',
    },
    'confidence_score' => {
        data_type => 'Number',
        description => 'A quantitative representation of our confidence that a consistent predictive relationship exists based on the amount of evidence, reproducibility, and other factors',
        required => '0',
    },
    'direction' => {
        data_type => 'string',
        description => 'Direction is positive if higher predictor values generally precede higher outcome values. Direction is negative if higher predictor values generally precede lower outcome values.',
        required => '0',
    },
    'duration_of_action' => {
        data_type => 'int',
        description => 'Estimated number of seconds following the onset delay in which a stimulus produces a perceivable effect',
        required => '0',
    },
    'error_message' => {
        data_type => 'string',
        description => 'error_message',
        required => '0',
    },
    'onset_delay' => {
        data_type => 'int',
        description => 'Estimated number of seconds that pass before a stimulus produces a perceivable effect',
        required => '0',
    },
    'outcome_variable_id' => {
        data_type => 'int',
        description => 'Variable ID for the outcome variable',
        required => '0',
    },
    'predictor_variable_id' => {
        data_type => 'int',
        description => 'Variable ID for the predictor variable',
        required => '0',
    },
    'predictor_unit_id' => {
        data_type => 'int',
        description => 'ID for default unit of the predictor variable',
        required => '0',
    },
    'sinn_rank' => {
        data_type => 'Number',
        description => 'A value representative of the relevance of this predictor relative to other predictors of this outcome.  Usually used for relevancy sorting.',
        required => '0',
    },
    'strength_level' => {
        data_type => 'string',
        description => 'Can be weak, medium, or strong based on the size of the effect which the predictor appears to have on the outcome relative to other variable relationship strength scores.',
        required => '0',
    },
    'strength_score' => {
        data_type => 'Number',
        description => 'A value represented to the size of the effect which the predictor appears to have on the outcome.',
        required => '0',
    },
    'vote' => {
        data_type => 'string',
        description => 'vote',
        required => '0',
    },
    'value_predicting_high_outcome' => {
        data_type => 'Number',
        description => 'Value for the predictor variable (in it&#39;s default unit) which typically precedes an above average outcome value',
        required => '0',
    },
    'value_predicting_low_outcome' => {
        data_type => 'Number',
        description => 'Value for the predictor variable (in it&#39;s default unit) which typically precedes a below average outcome value',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_user_variable_relationships_get } = { 
    	summary => 'Get all UserVariableRelationships',
        params => $params,
        returns => 'InlineResponse2007',
        };
}
# @return InlineResponse2007
#
sub v2_application_user_variable_relationships_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/userVariableRelationships';
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
    if ( exists $args{'id'}) {
        $query_params->{'id'} = $self->{api_client}->to_query_value($args{'id'});
    }

    # query params
    if ( exists $args{'confidence_level'}) {
        $query_params->{'confidence_level'} = $self->{api_client}->to_query_value($args{'confidence_level'});
    }

    # query params
    if ( exists $args{'confidence_score'}) {
        $query_params->{'confidence_score'} = $self->{api_client}->to_query_value($args{'confidence_score'});
    }

    # query params
    if ( exists $args{'direction'}) {
        $query_params->{'direction'} = $self->{api_client}->to_query_value($args{'direction'});
    }

    # query params
    if ( exists $args{'duration_of_action'}) {
        $query_params->{'duration_of_action'} = $self->{api_client}->to_query_value($args{'duration_of_action'});
    }

    # query params
    if ( exists $args{'error_message'}) {
        $query_params->{'error_message'} = $self->{api_client}->to_query_value($args{'error_message'});
    }

    # query params
    if ( exists $args{'onset_delay'}) {
        $query_params->{'onset_delay'} = $self->{api_client}->to_query_value($args{'onset_delay'});
    }

    # query params
    if ( exists $args{'outcome_variable_id'}) {
        $query_params->{'outcome_variable_id'} = $self->{api_client}->to_query_value($args{'outcome_variable_id'});
    }

    # query params
    if ( exists $args{'predictor_variable_id'}) {
        $query_params->{'predictor_variable_id'} = $self->{api_client}->to_query_value($args{'predictor_variable_id'});
    }

    # query params
    if ( exists $args{'predictor_unit_id'}) {
        $query_params->{'predictor_unit_id'} = $self->{api_client}->to_query_value($args{'predictor_unit_id'});
    }

    # query params
    if ( exists $args{'sinn_rank'}) {
        $query_params->{'sinn_rank'} = $self->{api_client}->to_query_value($args{'sinn_rank'});
    }

    # query params
    if ( exists $args{'strength_level'}) {
        $query_params->{'strength_level'} = $self->{api_client}->to_query_value($args{'strength_level'});
    }

    # query params
    if ( exists $args{'strength_score'}) {
        $query_params->{'strength_score'} = $self->{api_client}->to_query_value($args{'strength_score'});
    }

    # query params
    if ( exists $args{'vote'}) {
        $query_params->{'vote'} = $self->{api_client}->to_query_value($args{'vote'});
    }

    # query params
    if ( exists $args{'value_predicting_high_outcome'}) {
        $query_params->{'value_predicting_high_outcome'} = $self->{api_client}->to_query_value($args{'value_predicting_high_outcome'});
    }

    # query params
    if ( exists $args{'value_predicting_low_outcome'}) {
        $query_params->{'value_predicting_low_outcome'} = $self->{api_client}->to_query_value($args{'value_predicting_low_outcome'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse2007', $response);
    return $_response_object;
}

#
# v2_application_user_variables_get
#
# Get all UserVariables
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $client_id The ID of the client application which last created or updated this user variable (optional)
# @param int $parent_id ID of the parent variable if this variable has any parent (optional)
# @param int $variable_id ID of variable (optional)
# @param int $default_unit_id D of unit to use for this variable (optional)
# @param Number $minimum_allowed_value Minimum reasonable value for this variable (uses default unit) (optional)
# @param Number $maximum_allowed_value Maximum reasonable value for this variable (uses default unit) (optional)
# @param Number $filling_value Value for replacing null measurements (optional)
# @param int $join_with The Variable this Variable should be joined with. If the variable is joined with some other variable then it is not shown to user in the list of variables (optional)
# @param int $onset_delay Estimated number of seconds that pass before a stimulus produces a perceivable effect (optional)
# @param int $duration_of_action Estimated duration of time following the onset delay in which a stimulus produces a perceivable effect (optional)
# @param int $variable_category_id ID of variable category (optional)
# @param int $updated updated (optional)
# @param int $public Is variable public (optional)
# @param boolean $cause_only A value of 1 indicates that this variable is generally a cause in a causal relationship.  An example of a causeOnly variable would be a variable such as Cloud Cover which would generally not be influenced by the behaviour of the user (optional)
# @param string $filling_type 0 -&gt; No filling, 1 -&gt; Use filling-value (optional)
# @param int $number_of_measurements Number of measurements (optional)
# @param int $number_of_processed_measurements Number of processed measurements (optional)
# @param int $measurements_at_last_analysis Number of measurements at last analysis (optional)
# @param int $last_unit_id ID of last Unit (optional)
# @param int $last_original_unit_id ID of last original Unit (optional)
# @param int $last_original_value Last original value which is stored (optional)
# @param Number $last_value Last Value (optional)
# @param int $last_source_id ID of last source (optional)
# @param int $number_of_correlations Number of correlations for this variable (optional)
# @param string $status status (optional)
# @param string $error_message error_message (optional)
# @param string $last_successful_update_time When this variable or its settings were last updated (optional)
# @param Number $standard_deviation Standard deviation (optional)
# @param Number $variance Variance (optional)
# @param Number $minimum_recorded_value Minimum recorded value of this variable (optional)
# @param Number $maximum_recorded_value Maximum recorded value of this variable (optional)
# @param Number $mean Mean (optional)
# @param Number $median Median (optional)
# @param int $most_common_unit_id Most common Unit ID (optional)
# @param Number $most_common_value Most common value (optional)
# @param Number $number_of_unique_daily_values Number of unique daily values (optional)
# @param int $number_of_changes Number of changes (optional)
# @param Number $skewness Skewness (optional)
# @param Number $kurtosis Kurtosis (optional)
# @param Number $latitude Latitude (optional)
# @param Number $longitude Longitude (optional)
# @param string $location Location (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format  (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format  (optional)
# @param boolean $outcome Outcome variables (those with &#x60;outcome&#x60; &#x3D;&#x3D; 1) are variables for which a human would generally want to identify the influencing factors.  These include symptoms of illness, physique, mood, cognitive performance, etc.  Generally correlation calculations are only performed on outcome variables (optional)
# @param string $sources Comma-separated list of source names to limit variables to those sources (optional)
# @param int $earliest_source_time Earliest source time (optional)
# @param int $latest_source_time Latest source time (optional)
# @param int $earliest_measurement_time Earliest measurement time (optional)
# @param int $latest_measurement_time Latest measurement time (optional)
# @param int $earliest_filling_time Earliest filling time (optional)
# @param int $latest_filling_time Latest filling time (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'client_id' => {
        data_type => 'string',
        description => 'The ID of the client application which last created or updated this user variable',
        required => '0',
    },
    'parent_id' => {
        data_type => 'int',
        description => 'ID of the parent variable if this variable has any parent',
        required => '0',
    },
    'variable_id' => {
        data_type => 'int',
        description => 'ID of variable',
        required => '0',
    },
    'default_unit_id' => {
        data_type => 'int',
        description => 'D of unit to use for this variable',
        required => '0',
    },
    'minimum_allowed_value' => {
        data_type => 'Number',
        description => 'Minimum reasonable value for this variable (uses default unit)',
        required => '0',
    },
    'maximum_allowed_value' => {
        data_type => 'Number',
        description => 'Maximum reasonable value for this variable (uses default unit)',
        required => '0',
    },
    'filling_value' => {
        data_type => 'Number',
        description => 'Value for replacing null measurements',
        required => '0',
    },
    'join_with' => {
        data_type => 'int',
        description => 'The Variable this Variable should be joined with. If the variable is joined with some other variable then it is not shown to user in the list of variables',
        required => '0',
    },
    'onset_delay' => {
        data_type => 'int',
        description => 'Estimated number of seconds that pass before a stimulus produces a perceivable effect',
        required => '0',
    },
    'duration_of_action' => {
        data_type => 'int',
        description => 'Estimated duration of time following the onset delay in which a stimulus produces a perceivable effect',
        required => '0',
    },
    'variable_category_id' => {
        data_type => 'int',
        description => 'ID of variable category',
        required => '0',
    },
    'updated' => {
        data_type => 'int',
        description => 'updated',
        required => '0',
    },
    'public' => {
        data_type => 'int',
        description => 'Is variable public',
        required => '0',
    },
    'cause_only' => {
        data_type => 'boolean',
        description => 'A value of 1 indicates that this variable is generally a cause in a causal relationship.  An example of a causeOnly variable would be a variable such as Cloud Cover which would generally not be influenced by the behaviour of the user',
        required => '0',
    },
    'filling_type' => {
        data_type => 'string',
        description => '0 -&gt; No filling, 1 -&gt; Use filling-value',
        required => '0',
    },
    'number_of_measurements' => {
        data_type => 'int',
        description => 'Number of measurements',
        required => '0',
    },
    'number_of_processed_measurements' => {
        data_type => 'int',
        description => 'Number of processed measurements',
        required => '0',
    },
    'measurements_at_last_analysis' => {
        data_type => 'int',
        description => 'Number of measurements at last analysis',
        required => '0',
    },
    'last_unit_id' => {
        data_type => 'int',
        description => 'ID of last Unit',
        required => '0',
    },
    'last_original_unit_id' => {
        data_type => 'int',
        description => 'ID of last original Unit',
        required => '0',
    },
    'last_original_value' => {
        data_type => 'int',
        description => 'Last original value which is stored',
        required => '0',
    },
    'last_value' => {
        data_type => 'Number',
        description => 'Last Value',
        required => '0',
    },
    'last_source_id' => {
        data_type => 'int',
        description => 'ID of last source',
        required => '0',
    },
    'number_of_correlations' => {
        data_type => 'int',
        description => 'Number of correlations for this variable',
        required => '0',
    },
    'status' => {
        data_type => 'string',
        description => 'status',
        required => '0',
    },
    'error_message' => {
        data_type => 'string',
        description => 'error_message',
        required => '0',
    },
    'last_successful_update_time' => {
        data_type => 'string',
        description => 'When this variable or its settings were last updated',
        required => '0',
    },
    'standard_deviation' => {
        data_type => 'Number',
        description => 'Standard deviation',
        required => '0',
    },
    'variance' => {
        data_type => 'Number',
        description => 'Variance',
        required => '0',
    },
    'minimum_recorded_value' => {
        data_type => 'Number',
        description => 'Minimum recorded value of this variable',
        required => '0',
    },
    'maximum_recorded_value' => {
        data_type => 'Number',
        description => 'Maximum recorded value of this variable',
        required => '0',
    },
    'mean' => {
        data_type => 'Number',
        description => 'Mean',
        required => '0',
    },
    'median' => {
        data_type => 'Number',
        description => 'Median',
        required => '0',
    },
    'most_common_unit_id' => {
        data_type => 'int',
        description => 'Most common Unit ID',
        required => '0',
    },
    'most_common_value' => {
        data_type => 'Number',
        description => 'Most common value',
        required => '0',
    },
    'number_of_unique_daily_values' => {
        data_type => 'Number',
        description => 'Number of unique daily values',
        required => '0',
    },
    'number_of_changes' => {
        data_type => 'int',
        description => 'Number of changes',
        required => '0',
    },
    'skewness' => {
        data_type => 'Number',
        description => 'Skewness',
        required => '0',
    },
    'kurtosis' => {
        data_type => 'Number',
        description => 'Kurtosis',
        required => '0',
    },
    'latitude' => {
        data_type => 'Number',
        description => 'Latitude',
        required => '0',
    },
    'longitude' => {
        data_type => 'Number',
        description => 'Longitude',
        required => '0',
    },
    'location' => {
        data_type => 'string',
        description => 'Location',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format ',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format ',
        required => '0',
    },
    'outcome' => {
        data_type => 'boolean',
        description => 'Outcome variables (those with &#x60;outcome&#x60; &#x3D;&#x3D; 1) are variables for which a human would generally want to identify the influencing factors.  These include symptoms of illness, physique, mood, cognitive performance, etc.  Generally correlation calculations are only performed on outcome variables',
        required => '0',
    },
    'sources' => {
        data_type => 'string',
        description => 'Comma-separated list of source names to limit variables to those sources',
        required => '0',
    },
    'earliest_source_time' => {
        data_type => 'int',
        description => 'Earliest source time',
        required => '0',
    },
    'latest_source_time' => {
        data_type => 'int',
        description => 'Latest source time',
        required => '0',
    },
    'earliest_measurement_time' => {
        data_type => 'int',
        description => 'Earliest measurement time',
        required => '0',
    },
    'latest_measurement_time' => {
        data_type => 'int',
        description => 'Latest measurement time',
        required => '0',
    },
    'earliest_filling_time' => {
        data_type => 'int',
        description => 'Earliest filling time',
        required => '0',
    },
    'latest_filling_time' => {
        data_type => 'int',
        description => 'Latest filling time',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_user_variables_get } = { 
    	summary => 'Get all UserVariables',
        params => $params,
        returns => 'InlineResponse2008',
        };
}
# @return InlineResponse2008
#
sub v2_application_user_variables_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/userVariables';
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
    if ( exists $args{'client_id'}) {
        $query_params->{'client_id'} = $self->{api_client}->to_query_value($args{'client_id'});
    }

    # query params
    if ( exists $args{'parent_id'}) {
        $query_params->{'parent_id'} = $self->{api_client}->to_query_value($args{'parent_id'});
    }

    # query params
    if ( exists $args{'variable_id'}) {
        $query_params->{'variable_id'} = $self->{api_client}->to_query_value($args{'variable_id'});
    }

    # query params
    if ( exists $args{'default_unit_id'}) {
        $query_params->{'default_unit_id'} = $self->{api_client}->to_query_value($args{'default_unit_id'});
    }

    # query params
    if ( exists $args{'minimum_allowed_value'}) {
        $query_params->{'minimum_allowed_value'} = $self->{api_client}->to_query_value($args{'minimum_allowed_value'});
    }

    # query params
    if ( exists $args{'maximum_allowed_value'}) {
        $query_params->{'maximum_allowed_value'} = $self->{api_client}->to_query_value($args{'maximum_allowed_value'});
    }

    # query params
    if ( exists $args{'filling_value'}) {
        $query_params->{'filling_value'} = $self->{api_client}->to_query_value($args{'filling_value'});
    }

    # query params
    if ( exists $args{'join_with'}) {
        $query_params->{'join_with'} = $self->{api_client}->to_query_value($args{'join_with'});
    }

    # query params
    if ( exists $args{'onset_delay'}) {
        $query_params->{'onset_delay'} = $self->{api_client}->to_query_value($args{'onset_delay'});
    }

    # query params
    if ( exists $args{'duration_of_action'}) {
        $query_params->{'duration_of_action'} = $self->{api_client}->to_query_value($args{'duration_of_action'});
    }

    # query params
    if ( exists $args{'variable_category_id'}) {
        $query_params->{'variable_category_id'} = $self->{api_client}->to_query_value($args{'variable_category_id'});
    }

    # query params
    if ( exists $args{'updated'}) {
        $query_params->{'updated'} = $self->{api_client}->to_query_value($args{'updated'});
    }

    # query params
    if ( exists $args{'public'}) {
        $query_params->{'public'} = $self->{api_client}->to_query_value($args{'public'});
    }

    # query params
    if ( exists $args{'cause_only'}) {
        $query_params->{'cause_only'} = $self->{api_client}->to_query_value($args{'cause_only'});
    }

    # query params
    if ( exists $args{'filling_type'}) {
        $query_params->{'filling_type'} = $self->{api_client}->to_query_value($args{'filling_type'});
    }

    # query params
    if ( exists $args{'number_of_measurements'}) {
        $query_params->{'number_of_measurements'} = $self->{api_client}->to_query_value($args{'number_of_measurements'});
    }

    # query params
    if ( exists $args{'number_of_processed_measurements'}) {
        $query_params->{'number_of_processed_measurements'} = $self->{api_client}->to_query_value($args{'number_of_processed_measurements'});
    }

    # query params
    if ( exists $args{'measurements_at_last_analysis'}) {
        $query_params->{'measurements_at_last_analysis'} = $self->{api_client}->to_query_value($args{'measurements_at_last_analysis'});
    }

    # query params
    if ( exists $args{'last_unit_id'}) {
        $query_params->{'last_unit_id'} = $self->{api_client}->to_query_value($args{'last_unit_id'});
    }

    # query params
    if ( exists $args{'last_original_unit_id'}) {
        $query_params->{'last_original_unit_id'} = $self->{api_client}->to_query_value($args{'last_original_unit_id'});
    }

    # query params
    if ( exists $args{'last_original_value'}) {
        $query_params->{'last_original_value'} = $self->{api_client}->to_query_value($args{'last_original_value'});
    }

    # query params
    if ( exists $args{'last_value'}) {
        $query_params->{'last_value'} = $self->{api_client}->to_query_value($args{'last_value'});
    }

    # query params
    if ( exists $args{'last_source_id'}) {
        $query_params->{'last_source_id'} = $self->{api_client}->to_query_value($args{'last_source_id'});
    }

    # query params
    if ( exists $args{'number_of_correlations'}) {
        $query_params->{'number_of_correlations'} = $self->{api_client}->to_query_value($args{'number_of_correlations'});
    }

    # query params
    if ( exists $args{'status'}) {
        $query_params->{'status'} = $self->{api_client}->to_query_value($args{'status'});
    }

    # query params
    if ( exists $args{'error_message'}) {
        $query_params->{'error_message'} = $self->{api_client}->to_query_value($args{'error_message'});
    }

    # query params
    if ( exists $args{'last_successful_update_time'}) {
        $query_params->{'last_successful_update_time'} = $self->{api_client}->to_query_value($args{'last_successful_update_time'});
    }

    # query params
    if ( exists $args{'standard_deviation'}) {
        $query_params->{'standard_deviation'} = $self->{api_client}->to_query_value($args{'standard_deviation'});
    }

    # query params
    if ( exists $args{'variance'}) {
        $query_params->{'variance'} = $self->{api_client}->to_query_value($args{'variance'});
    }

    # query params
    if ( exists $args{'minimum_recorded_value'}) {
        $query_params->{'minimum_recorded_value'} = $self->{api_client}->to_query_value($args{'minimum_recorded_value'});
    }

    # query params
    if ( exists $args{'maximum_recorded_value'}) {
        $query_params->{'maximum_recorded_value'} = $self->{api_client}->to_query_value($args{'maximum_recorded_value'});
    }

    # query params
    if ( exists $args{'mean'}) {
        $query_params->{'mean'} = $self->{api_client}->to_query_value($args{'mean'});
    }

    # query params
    if ( exists $args{'median'}) {
        $query_params->{'median'} = $self->{api_client}->to_query_value($args{'median'});
    }

    # query params
    if ( exists $args{'most_common_unit_id'}) {
        $query_params->{'most_common_unit_id'} = $self->{api_client}->to_query_value($args{'most_common_unit_id'});
    }

    # query params
    if ( exists $args{'most_common_value'}) {
        $query_params->{'most_common_value'} = $self->{api_client}->to_query_value($args{'most_common_value'});
    }

    # query params
    if ( exists $args{'number_of_unique_daily_values'}) {
        $query_params->{'number_of_unique_daily_values'} = $self->{api_client}->to_query_value($args{'number_of_unique_daily_values'});
    }

    # query params
    if ( exists $args{'number_of_changes'}) {
        $query_params->{'number_of_changes'} = $self->{api_client}->to_query_value($args{'number_of_changes'});
    }

    # query params
    if ( exists $args{'skewness'}) {
        $query_params->{'skewness'} = $self->{api_client}->to_query_value($args{'skewness'});
    }

    # query params
    if ( exists $args{'kurtosis'}) {
        $query_params->{'kurtosis'} = $self->{api_client}->to_query_value($args{'kurtosis'});
    }

    # query params
    if ( exists $args{'latitude'}) {
        $query_params->{'latitude'} = $self->{api_client}->to_query_value($args{'latitude'});
    }

    # query params
    if ( exists $args{'longitude'}) {
        $query_params->{'longitude'} = $self->{api_client}->to_query_value($args{'longitude'});
    }

    # query params
    if ( exists $args{'location'}) {
        $query_params->{'location'} = $self->{api_client}->to_query_value($args{'location'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
    }

    # query params
    if ( exists $args{'outcome'}) {
        $query_params->{'outcome'} = $self->{api_client}->to_query_value($args{'outcome'});
    }

    # query params
    if ( exists $args{'sources'}) {
        $query_params->{'sources'} = $self->{api_client}->to_query_value($args{'sources'});
    }

    # query params
    if ( exists $args{'earliest_source_time'}) {
        $query_params->{'earliest_source_time'} = $self->{api_client}->to_query_value($args{'earliest_source_time'});
    }

    # query params
    if ( exists $args{'latest_source_time'}) {
        $query_params->{'latest_source_time'} = $self->{api_client}->to_query_value($args{'latest_source_time'});
    }

    # query params
    if ( exists $args{'earliest_measurement_time'}) {
        $query_params->{'earliest_measurement_time'} = $self->{api_client}->to_query_value($args{'earliest_measurement_time'});
    }

    # query params
    if ( exists $args{'latest_measurement_time'}) {
        $query_params->{'latest_measurement_time'} = $self->{api_client}->to_query_value($args{'latest_measurement_time'});
    }

    # query params
    if ( exists $args{'earliest_filling_time'}) {
        $query_params->{'earliest_filling_time'} = $self->{api_client}->to_query_value($args{'earliest_filling_time'});
    }

    # query params
    if ( exists $args{'latest_filling_time'}) {
        $query_params->{'latest_filling_time'} = $self->{api_client}->to_query_value($args{'latest_filling_time'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse2008', $response);
    return $_response_object;
}

#
# v2_application_variable_user_sources_get
#
# Get all VariableUserSources
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param int $variable_id ID of variable (optional)
# @param int $timestamp Time that this measurement occurred Uses epoch minute (epoch time divided by 60) (optional)
# @param int $earliest_measurement_time Earliest measurement time (optional)
# @param int $latest_measurement_time Latest measurement time (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format  (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format  (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'variable_id' => {
        data_type => 'int',
        description => 'ID of variable',
        required => '0',
    },
    'timestamp' => {
        data_type => 'int',
        description => 'Time that this measurement occurred Uses epoch minute (epoch time divided by 60)',
        required => '0',
    },
    'earliest_measurement_time' => {
        data_type => 'int',
        description => 'Earliest measurement time',
        required => '0',
    },
    'latest_measurement_time' => {
        data_type => 'int',
        description => 'Latest measurement time',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format ',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format ',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_variable_user_sources_get } = { 
    	summary => 'Get all VariableUserSources',
        params => $params,
        returns => 'InlineResponse2009',
        };
}
# @return InlineResponse2009
#
sub v2_application_variable_user_sources_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/variableUserSources';
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
    if ( exists $args{'variable_id'}) {
        $query_params->{'variable_id'} = $self->{api_client}->to_query_value($args{'variable_id'});
    }

    # query params
    if ( exists $args{'timestamp'}) {
        $query_params->{'timestamp'} = $self->{api_client}->to_query_value($args{'timestamp'});
    }

    # query params
    if ( exists $args{'earliest_measurement_time'}) {
        $query_params->{'earliest_measurement_time'} = $self->{api_client}->to_query_value($args{'earliest_measurement_time'});
    }

    # query params
    if ( exists $args{'latest_measurement_time'}) {
        $query_params->{'latest_measurement_time'} = $self->{api_client}->to_query_value($args{'latest_measurement_time'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse2009', $response);
    return $_response_object;
}

#
# v2_application_votes_get
#
# Get all Votes
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $client_id The ID of the client application which last created or updated this vote (optional)
# @param int $cause_id ID of predictor variable (optional)
# @param int $effect_id ID of outcome variable (optional)
# @param int $value Value of Vote. 1 is for upvote. 0 is for downvote.  Otherwise, there is no vote. (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format  (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format  (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'client_id' => {
        data_type => 'string',
        description => 'The ID of the client application which last created or updated this vote',
        required => '0',
    },
    'cause_id' => {
        data_type => 'int',
        description => 'ID of predictor variable',
        required => '0',
    },
    'effect_id' => {
        data_type => 'int',
        description => 'ID of outcome variable',
        required => '0',
    },
    'value' => {
        data_type => 'int',
        description => 'Value of Vote. 1 is for upvote. 0 is for downvote.  Otherwise, there is no vote.',
        required => '0',
    },
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format ',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format ',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.',
        required => '0',
    },
    'sort' => {
        data_type => 'string',
        description => 'Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_application_votes_get } = { 
    	summary => 'Get all Votes',
        params => $params,
        returns => 'InlineResponse20010',
        };
}
# @return InlineResponse20010
#
sub v2_application_votes_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v2/application/votes';
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
    if ( exists $args{'client_id'}) {
        $query_params->{'client_id'} = $self->{api_client}->to_query_value($args{'client_id'});
    }

    # query params
    if ( exists $args{'cause_id'}) {
        $query_params->{'cause_id'} = $self->{api_client}->to_query_value($args{'cause_id'});
    }

    # query params
    if ( exists $args{'effect_id'}) {
        $query_params->{'effect_id'} = $self->{api_client}->to_query_value($args{'effect_id'});
    }

    # query params
    if ( exists $args{'value'}) {
        $query_params->{'value'} = $self->{api_client}->to_query_value($args{'value'});
    }

    # query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }

    # query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('InlineResponse20010', $response);
    return $_response_object;
}

1;
