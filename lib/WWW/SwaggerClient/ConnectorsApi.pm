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
package WWW::SwaggerClient::ConnectorsApi;

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
# v1_connect_js_get
#
# Get embeddable connect javascript
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
    __PACKAGE__->method_documentation->{ v1_connect_js_get } = { 
    	summary => 'Get embeddable connect javascript',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_connect_js_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/connect.js';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/x-javascript');
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# v1_connect_mobile_get
#
# Mobile connect page
# 
# @param string $access_token User OAuth access token (required)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User OAuth access token',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ v1_connect_mobile_get } = { 
    	summary => 'Mobile connect page',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_connect_mobile_get {
    my ($self, %args) = @_;

    # verify the required parameter 'access_token' is set
    unless (exists $args{'access_token'}) {
      croak("Missing the required parameter 'access_token' when calling v1_connect_mobile_get");
    }

    # parse inputs
    my $_resource_path = '/v1/connect/mobile';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('text/html');
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
    my $auth_settings = [qw(oauth2 internalApiKey )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# v1_connectors_connector_connect_get
#
# Obtain a token from 3rd party data source
# 
# @param string $connector Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'connector' => {
        data_type => 'string',
        description => 'Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_connectors_connector_connect_get } = { 
    	summary => 'Obtain a token from 3rd party data source',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_connectors_connector_connect_get {
    my ($self, %args) = @_;

    # verify the required parameter 'connector' is set
    unless (exists $args{'connector'}) {
      croak("Missing the required parameter 'connector' when calling v1_connectors_connector_connect_get");
    }

    # parse inputs
    my $_resource_path = '/v1/connectors/{connector}/connect';
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
    if ( exists $args{'connector'}) {
        my $_base_variable = "{" . "connector" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'connector'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# v1_connectors_connector_connect_instructions_get
#
# Connection Instructions
# 
# @param string $connector Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. (required)
# @param string $parameters JSON Array of Parameters for the request to enable connector. (required)
# @param string $url URL which should be used to enable the connector. (required)
# @param boolean $use_popup Should use popup when enabling connector (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'connector' => {
        data_type => 'string',
        description => 'Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.',
        required => '1',
    },
    'parameters' => {
        data_type => 'string',
        description => 'JSON Array of Parameters for the request to enable connector.',
        required => '1',
    },
    'url' => {
        data_type => 'string',
        description => 'URL which should be used to enable the connector.',
        required => '1',
    },
    'use_popup' => {
        data_type => 'boolean',
        description => 'Should use popup when enabling connector',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_connectors_connector_connect_instructions_get } = { 
    	summary => 'Connection Instructions',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_connectors_connector_connect_instructions_get {
    my ($self, %args) = @_;

    # verify the required parameter 'connector' is set
    unless (exists $args{'connector'}) {
      croak("Missing the required parameter 'connector' when calling v1_connectors_connector_connect_instructions_get");
    }

    # verify the required parameter 'parameters' is set
    unless (exists $args{'parameters'}) {
      croak("Missing the required parameter 'parameters' when calling v1_connectors_connector_connect_instructions_get");
    }

    # verify the required parameter 'url' is set
    unless (exists $args{'url'}) {
      croak("Missing the required parameter 'url' when calling v1_connectors_connector_connect_instructions_get");
    }

    # verify the required parameter 'use_popup' is set
    unless (exists $args{'use_popup'}) {
      croak("Missing the required parameter 'use_popup' when calling v1_connectors_connector_connect_instructions_get");
    }

    # parse inputs
    my $_resource_path = '/v1/connectors/{connector}/connectInstructions';
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
    if ( exists $args{'parameters'}) {
        $query_params->{'parameters'} = $self->{api_client}->to_query_value($args{'parameters'});
    }

    # query params
    if ( exists $args{'url'}) {
        $query_params->{'url'} = $self->{api_client}->to_query_value($args{'url'});
    }

    # query params
    if ( exists $args{'use_popup'}) {
        $query_params->{'usePopup'} = $self->{api_client}->to_query_value($args{'use_popup'});
    }

    # path params
    if ( exists $args{'connector'}) {
        my $_base_variable = "{" . "connector" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'connector'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# v1_connectors_connector_connect_parameter_get
#
# Connect Parameter
# 
# @param string $connector Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. (required)
# @param string $display_name Name of the parameter that is user visible in the form (required)
# @param string $key Name of the property that the user has to enter such as username or password Connector (used in HTTP request) (required)
# @param string $placeholder Placeholder hint value for the parameter input tag. (required)
# @param string $type Type of input field such as those found here http://www.w3schools.com/tags/tag_input.asp (required)
# @param boolean $use_popup Should use popup when enabling connector (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $default_value Default parameter value (optional)
{
    my $params = {
    'connector' => {
        data_type => 'string',
        description => 'Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.',
        required => '1',
    },
    'display_name' => {
        data_type => 'string',
        description => 'Name of the parameter that is user visible in the form',
        required => '1',
    },
    'key' => {
        data_type => 'string',
        description => 'Name of the property that the user has to enter such as username or password Connector (used in HTTP request)',
        required => '1',
    },
    'placeholder' => {
        data_type => 'string',
        description => 'Placeholder hint value for the parameter input tag.',
        required => '1',
    },
    'type' => {
        data_type => 'string',
        description => 'Type of input field such as those found here http://www.w3schools.com/tags/tag_input.asp',
        required => '1',
    },
    'use_popup' => {
        data_type => 'boolean',
        description => 'Should use popup when enabling connector',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'default_value' => {
        data_type => 'string',
        description => 'Default parameter value',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_connectors_connector_connect_parameter_get } = { 
    	summary => 'Connect Parameter',
        params => $params,
        returns => 'ConnectorInstruction',
        };
}
# @return ConnectorInstruction
#
sub v1_connectors_connector_connect_parameter_get {
    my ($self, %args) = @_;

    # verify the required parameter 'connector' is set
    unless (exists $args{'connector'}) {
      croak("Missing the required parameter 'connector' when calling v1_connectors_connector_connect_parameter_get");
    }

    # verify the required parameter 'display_name' is set
    unless (exists $args{'display_name'}) {
      croak("Missing the required parameter 'display_name' when calling v1_connectors_connector_connect_parameter_get");
    }

    # verify the required parameter 'key' is set
    unless (exists $args{'key'}) {
      croak("Missing the required parameter 'key' when calling v1_connectors_connector_connect_parameter_get");
    }

    # verify the required parameter 'placeholder' is set
    unless (exists $args{'placeholder'}) {
      croak("Missing the required parameter 'placeholder' when calling v1_connectors_connector_connect_parameter_get");
    }

    # verify the required parameter 'type' is set
    unless (exists $args{'type'}) {
      croak("Missing the required parameter 'type' when calling v1_connectors_connector_connect_parameter_get");
    }

    # verify the required parameter 'use_popup' is set
    unless (exists $args{'use_popup'}) {
      croak("Missing the required parameter 'use_popup' when calling v1_connectors_connector_connect_parameter_get");
    }

    # parse inputs
    my $_resource_path = '/v1/connectors/{connector}/connectParameter';
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
    if ( exists $args{'default_value'}) {
        $query_params->{'defaultValue'} = $self->{api_client}->to_query_value($args{'default_value'});
    }

    # query params
    if ( exists $args{'display_name'}) {
        $query_params->{'displayName'} = $self->{api_client}->to_query_value($args{'display_name'});
    }

    # query params
    if ( exists $args{'key'}) {
        $query_params->{'key'} = $self->{api_client}->to_query_value($args{'key'});
    }

    # query params
    if ( exists $args{'placeholder'}) {
        $query_params->{'placeholder'} = $self->{api_client}->to_query_value($args{'placeholder'});
    }

    # query params
    if ( exists $args{'type'}) {
        $query_params->{'type'} = $self->{api_client}->to_query_value($args{'type'});
    }

    # query params
    if ( exists $args{'use_popup'}) {
        $query_params->{'usePopup'} = $self->{api_client}->to_query_value($args{'use_popup'});
    }

    # path params
    if ( exists $args{'connector'}) {
        my $_base_variable = "{" . "connector" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'connector'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
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
    my $_response_object = $self->{api_client}->deserialize('ConnectorInstruction', $response);
    return $_response_object;
}

#
# v1_connectors_connector_disconnect_get
#
# Delete stored connection info
# 
# @param string $connector Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. (required)
{
    my $params = {
    'connector' => {
        data_type => 'string',
        description => 'Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ v1_connectors_connector_disconnect_get } = { 
    	summary => 'Delete stored connection info',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_connectors_connector_disconnect_get {
    my ($self, %args) = @_;

    # verify the required parameter 'connector' is set
    unless (exists $args{'connector'}) {
      croak("Missing the required parameter 'connector' when calling v1_connectors_connector_disconnect_get");
    }

    # parse inputs
    my $_resource_path = '/v1/connectors/{connector}/disconnect';
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

    # path params
    if ( exists $args{'connector'}) {
        my $_base_variable = "{" . "connector" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'connector'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# v1_connectors_connector_info_get
#
# Get connector info for user
# 
# @param string $connector Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'connector' => {
        data_type => 'string',
        description => 'Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_connectors_connector_info_get } = { 
    	summary => 'Get connector info for user',
        params => $params,
        returns => 'ConnectorInfo',
        };
}
# @return ConnectorInfo
#
sub v1_connectors_connector_info_get {
    my ($self, %args) = @_;

    # verify the required parameter 'connector' is set
    unless (exists $args{'connector'}) {
      croak("Missing the required parameter 'connector' when calling v1_connectors_connector_info_get");
    }

    # parse inputs
    my $_resource_path = '/v1/connectors/{connector}/info';
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
    if ( exists $args{'connector'}) {
        my $_base_variable = "{" . "connector" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'connector'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
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
    my $_response_object = $self->{api_client}->deserialize('ConnectorInfo', $response);
    return $_response_object;
}

#
# v1_connectors_connector_update_get
#
# Sync with data source
# 
# @param string $connector Lowercase system name of the source application or device (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'connector' => {
        data_type => 'string',
        description => 'Lowercase system name of the source application or device',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_connectors_connector_update_get } = { 
    	summary => 'Sync with data source',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_connectors_connector_update_get {
    my ($self, %args) = @_;

    # verify the required parameter 'connector' is set
    unless (exists $args{'connector'}) {
      croak("Missing the required parameter 'connector' when calling v1_connectors_connector_update_get");
    }

    # parse inputs
    my $_resource_path = '/v1/connectors/{connector}/update';
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
    if ( exists $args{'connector'}) {
        my $_base_variable = "{" . "connector" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'connector'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(oauth2 )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# v1_connectors_list_get
#
# List of Connectors
# 
{
    my $params = {
    };
    __PACKAGE__->method_documentation->{ v1_connectors_list_get } = { 
    	summary => 'List of Connectors',
        params => $params,
        returns => 'ARRAY[Connector]',
        };
}
# @return ARRAY[Connector]
#
sub v1_connectors_list_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/connectors/list';
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Connector]', $response);
    return $_response_object;
}

1;
