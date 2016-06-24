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
package WWW::SwaggerClient::AuthenticationApi;

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
# v2_auth_social_authorize_code_get
#
# Second Step in Social Authentication flow with JWT Token
# 
# @param string $code Authorization code obtained from the provider. (required)
# @param string $provider The current options are &#x60;google&#x60; and &#x60;facebook&#x60;. (required)
{
    my $params = {
    'code' => {
        data_type => 'string',
        description => 'Authorization code obtained from the provider.',
        required => '1',
    },
    'provider' => {
        data_type => 'string',
        description => 'The current options are &#x60;google&#x60; and &#x60;facebook&#x60;.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ v2_auth_social_authorize_code_get } = { 
    	summary => 'Second Step in Social Authentication flow with JWT Token',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v2_auth_social_authorize_code_get {
    my ($self, %args) = @_;

    # verify the required parameter 'code' is set
    unless (exists $args{'code'}) {
      croak("Missing the required parameter 'code' when calling v2_auth_social_authorize_code_get");
    }

    # verify the required parameter 'provider' is set
    unless (exists $args{'provider'}) {
      croak("Missing the required parameter 'provider' when calling v2_auth_social_authorize_code_get");
    }

    # parse inputs
    my $_resource_path = '/v2/auth/social/authorizeCode';
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
    if ( exists $args{'code'}) {
        $query_params->{'code'} = $self->{api_client}->to_query_value($args{'code'});
    }

    # query params
    if ( exists $args{'provider'}) {
        $query_params->{'provider'} = $self->{api_client}->to_query_value($args{'provider'});
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
# v2_auth_social_authorize_token_get
#
# Native Social Authentication
# 
# @param string $access_token User&#39;s OAuth2 access token obtained from Google or FB native SDK (required)
# @param string $provider The current options are &#x60;google&#x60; and &#x60;facebook&#x60;. (required)
# @param string $refresh_token Optional refresh token obtained from Google or FB native SDK (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token obtained from Google or FB native SDK',
        required => '1',
    },
    'provider' => {
        data_type => 'string',
        description => 'The current options are &#x60;google&#x60; and &#x60;facebook&#x60;.',
        required => '1',
    },
    'refresh_token' => {
        data_type => 'string',
        description => 'Optional refresh token obtained from Google or FB native SDK',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_auth_social_authorize_token_get } = { 
    	summary => 'Native Social Authentication',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v2_auth_social_authorize_token_get {
    my ($self, %args) = @_;

    # verify the required parameter 'access_token' is set
    unless (exists $args{'access_token'}) {
      croak("Missing the required parameter 'access_token' when calling v2_auth_social_authorize_token_get");
    }

    # verify the required parameter 'provider' is set
    unless (exists $args{'provider'}) {
      croak("Missing the required parameter 'provider' when calling v2_auth_social_authorize_token_get");
    }

    # parse inputs
    my $_resource_path = '/v2/auth/social/authorizeToken';
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
    if ( exists $args{'refresh_token'}) {
        $query_params->{'refreshToken'} = $self->{api_client}->to_query_value($args{'refresh_token'});
    }

    # query params
    if ( exists $args{'access_token'}) {
        $query_params->{'accessToken'} = $self->{api_client}->to_query_value($args{'access_token'});
    }

    # query params
    if ( exists $args{'provider'}) {
        $query_params->{'provider'} = $self->{api_client}->to_query_value($args{'provider'});
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
# v2_auth_social_login_get
#
# First Setp in Social Authentication flow with JWT Token
# 
# @param string $redirect_url The redirect URI is the URL within your client application that will receive the OAuth2 credentials. Url should be registered with our social apps. Facebook and Twitter are fine with any redirect url with the same domain base url but Google needs exact redirect url. (required)
# @param string $provider The current options are &#x60;google&#x60; and &#x60;facebook&#x60;. (required)
{
    my $params = {
    'redirect_url' => {
        data_type => 'string',
        description => 'The redirect URI is the URL within your client application that will receive the OAuth2 credentials. Url should be registered with our social apps. Facebook and Twitter are fine with any redirect url with the same domain base url but Google needs exact redirect url.',
        required => '1',
    },
    'provider' => {
        data_type => 'string',
        description => 'The current options are &#x60;google&#x60; and &#x60;facebook&#x60;.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ v2_auth_social_login_get } = { 
    	summary => 'First Setp in Social Authentication flow with JWT Token',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v2_auth_social_login_get {
    my ($self, %args) = @_;

    # verify the required parameter 'redirect_url' is set
    unless (exists $args{'redirect_url'}) {
      croak("Missing the required parameter 'redirect_url' when calling v2_auth_social_login_get");
    }

    # verify the required parameter 'provider' is set
    unless (exists $args{'provider'}) {
      croak("Missing the required parameter 'provider' when calling v2_auth_social_login_get");
    }

    # parse inputs
    my $_resource_path = '/v2/auth/social/login';
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
    if ( exists $args{'redirect_url'}) {
        $query_params->{'redirectUrl'} = $self->{api_client}->to_query_value($args{'redirect_url'});
    }

    # query params
    if ( exists $args{'provider'}) {
        $query_params->{'provider'} = $self->{api_client}->to_query_value($args{'provider'});
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
# v2_oauth2_access_token_get
#
# Get a user access token
# 
# @param string $client_id This is the unique ID that QuantiModo uses to identify your application. Obtain a client id by emailing info@quantimo.do. (required)
# @param string $client_secret This is the secret for your obtained clientId. QuantiModo uses this to validate that only your application uses the clientId. (required)
# @param string $grant_type Grant Type can be &#39;authorization_code&#39; or &#39;refresh_token&#39; (required)
# @param string $code Authorization code you received with the previous request. (required)
# @param string $response_type If the value is code, launches a Basic flow, requiring a POST to the token endpoint to obtain the tokens. If the value is token id_token or id_token token, launches an Implicit flow, requiring the use of Javascript at the redirect URI to retrieve tokens from the URI #fragment. (optional)
# @param string $scope Scopes include basic, readmeasurements, and writemeasurements. The \&quot;basic\&quot; scope allows you to read user info (displayname, email, etc). The \&quot;readmeasurements\&quot; scope allows one to read a user&#39;s data. The \&quot;writemeasurements\&quot; scope allows you to write user data. Separate multiple scopes by a space. (optional)
# @param string $redirect_uri The redirect URI is the URL within your client application that will receive the OAuth2 credentials. (optional)
# @param string $state An opaque string that is round-tripped in the protocol; that is to say, it is returned as a URI parameter in the Basic flow, and in the URI (optional)
{
    my $params = {
    'client_id' => {
        data_type => 'string',
        description => 'This is the unique ID that QuantiModo uses to identify your application. Obtain a client id by emailing info@quantimo.do.',
        required => '1',
    },
    'client_secret' => {
        data_type => 'string',
        description => 'This is the secret for your obtained clientId. QuantiModo uses this to validate that only your application uses the clientId.',
        required => '1',
    },
    'grant_type' => {
        data_type => 'string',
        description => 'Grant Type can be &#39;authorization_code&#39; or &#39;refresh_token&#39;',
        required => '1',
    },
    'code' => {
        data_type => 'string',
        description => 'Authorization code you received with the previous request.',
        required => '1',
    },
    'response_type' => {
        data_type => 'string',
        description => 'If the value is code, launches a Basic flow, requiring a POST to the token endpoint to obtain the tokens. If the value is token id_token or id_token token, launches an Implicit flow, requiring the use of Javascript at the redirect URI to retrieve tokens from the URI #fragment.',
        required => '0',
    },
    'scope' => {
        data_type => 'string',
        description => 'Scopes include basic, readmeasurements, and writemeasurements. The \&quot;basic\&quot; scope allows you to read user info (displayname, email, etc). The \&quot;readmeasurements\&quot; scope allows one to read a user&#39;s data. The \&quot;writemeasurements\&quot; scope allows you to write user data. Separate multiple scopes by a space.',
        required => '0',
    },
    'redirect_uri' => {
        data_type => 'string',
        description => 'The redirect URI is the URL within your client application that will receive the OAuth2 credentials.',
        required => '0',
    },
    'state' => {
        data_type => 'string',
        description => 'An opaque string that is round-tripped in the protocol; that is to say, it is returned as a URI parameter in the Basic flow, and in the URI',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_oauth2_access_token_get } = { 
    	summary => 'Get a user access token',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v2_oauth2_access_token_get {
    my ($self, %args) = @_;

    # verify the required parameter 'client_id' is set
    unless (exists $args{'client_id'}) {
      croak("Missing the required parameter 'client_id' when calling v2_oauth2_access_token_get");
    }

    # verify the required parameter 'client_secret' is set
    unless (exists $args{'client_secret'}) {
      croak("Missing the required parameter 'client_secret' when calling v2_oauth2_access_token_get");
    }

    # verify the required parameter 'grant_type' is set
    unless (exists $args{'grant_type'}) {
      croak("Missing the required parameter 'grant_type' when calling v2_oauth2_access_token_get");
    }

    # verify the required parameter 'code' is set
    unless (exists $args{'code'}) {
      croak("Missing the required parameter 'code' when calling v2_oauth2_access_token_get");
    }

    # parse inputs
    my $_resource_path = '/v2/oauth2/access_token';
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
    if ( exists $args{'client_id'}) {
        $query_params->{'clientId'} = $self->{api_client}->to_query_value($args{'client_id'});
    }

    # query params
    if ( exists $args{'client_secret'}) {
        $query_params->{'client_secret'} = $self->{api_client}->to_query_value($args{'client_secret'});
    }

    # query params
    if ( exists $args{'grant_type'}) {
        $query_params->{'grant_type'} = $self->{api_client}->to_query_value($args{'grant_type'});
    }

    # query params
    if ( exists $args{'code'}) {
        $query_params->{'code'} = $self->{api_client}->to_query_value($args{'code'});
    }

    # query params
    if ( exists $args{'response_type'}) {
        $query_params->{'response_type'} = $self->{api_client}->to_query_value($args{'response_type'});
    }

    # query params
    if ( exists $args{'scope'}) {
        $query_params->{'scope'} = $self->{api_client}->to_query_value($args{'scope'});
    }

    # query params
    if ( exists $args{'redirect_uri'}) {
        $query_params->{'redirect_uri'} = $self->{api_client}->to_query_value($args{'redirect_uri'});
    }

    # query params
    if ( exists $args{'state'}) {
        $query_params->{'state'} = $self->{api_client}->to_query_value($args{'state'});
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
# v2_oauth_authorize_get
#
# Request Authorization Code
# 
# @param string $client_id This is the unique ID that QuantiModo uses to identify your application. Obtain a client id by creating a free application at [https://admin.quantimo.do](https://admin.quantimo.do). (required)
# @param string $client_secret This is the secret for your obtained clientId. QuantiModo uses this to validate that only your application uses the clientId.  Obtain this by creating a free application at [https://admin.quantimo.do](https://admin.quantimo.do). (required)
# @param string $response_type If the value is code, launches a Basic flow, requiring a POST to the token endpoint to obtain the tokens. If the value is token id_token or id_token token, launches an Implicit flow, requiring the use of Javascript at the redirect URI to retrieve tokens from the URI #fragment. (required)
# @param string $scope Scopes include basic, readmeasurements, and writemeasurements. The \&quot;basic\&quot; scope allows you to read user info (displayname, email, etc). The \&quot;readmeasurements\&quot; scope allows one to read a user&#39;s data. The \&quot;writemeasurements\&quot; scope allows you to write user data. Separate multiple scopes by a space. (required)
# @param string $redirect_uri The redirect URI is the URL within your client application that will receive the OAuth2 credentials. (optional)
# @param string $state An opaque string that is round-tripped in the protocol; that is to say, it is returned as a URI parameter in the Basic flow, and in the URI (optional)
{
    my $params = {
    'client_id' => {
        data_type => 'string',
        description => 'This is the unique ID that QuantiModo uses to identify your application. Obtain a client id by creating a free application at [https://admin.quantimo.do](https://admin.quantimo.do).',
        required => '1',
    },
    'client_secret' => {
        data_type => 'string',
        description => 'This is the secret for your obtained clientId. QuantiModo uses this to validate that only your application uses the clientId.  Obtain this by creating a free application at [https://admin.quantimo.do](https://admin.quantimo.do).',
        required => '1',
    },
    'response_type' => {
        data_type => 'string',
        description => 'If the value is code, launches a Basic flow, requiring a POST to the token endpoint to obtain the tokens. If the value is token id_token or id_token token, launches an Implicit flow, requiring the use of Javascript at the redirect URI to retrieve tokens from the URI #fragment.',
        required => '1',
    },
    'scope' => {
        data_type => 'string',
        description => 'Scopes include basic, readmeasurements, and writemeasurements. The \&quot;basic\&quot; scope allows you to read user info (displayname, email, etc). The \&quot;readmeasurements\&quot; scope allows one to read a user&#39;s data. The \&quot;writemeasurements\&quot; scope allows you to write user data. Separate multiple scopes by a space.',
        required => '1',
    },
    'redirect_uri' => {
        data_type => 'string',
        description => 'The redirect URI is the URL within your client application that will receive the OAuth2 credentials.',
        required => '0',
    },
    'state' => {
        data_type => 'string',
        description => 'An opaque string that is round-tripped in the protocol; that is to say, it is returned as a URI parameter in the Basic flow, and in the URI',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v2_oauth_authorize_get } = { 
    	summary => 'Request Authorization Code',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v2_oauth_authorize_get {
    my ($self, %args) = @_;

    # verify the required parameter 'client_id' is set
    unless (exists $args{'client_id'}) {
      croak("Missing the required parameter 'client_id' when calling v2_oauth_authorize_get");
    }

    # verify the required parameter 'client_secret' is set
    unless (exists $args{'client_secret'}) {
      croak("Missing the required parameter 'client_secret' when calling v2_oauth_authorize_get");
    }

    # verify the required parameter 'response_type' is set
    unless (exists $args{'response_type'}) {
      croak("Missing the required parameter 'response_type' when calling v2_oauth_authorize_get");
    }

    # verify the required parameter 'scope' is set
    unless (exists $args{'scope'}) {
      croak("Missing the required parameter 'scope' when calling v2_oauth_authorize_get");
    }

    # parse inputs
    my $_resource_path = '/v2/oauth/authorize';
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
    if ( exists $args{'client_id'}) {
        $query_params->{'clientId'} = $self->{api_client}->to_query_value($args{'client_id'});
    }

    # query params
    if ( exists $args{'client_secret'}) {
        $query_params->{'client_secret'} = $self->{api_client}->to_query_value($args{'client_secret'});
    }

    # query params
    if ( exists $args{'response_type'}) {
        $query_params->{'response_type'} = $self->{api_client}->to_query_value($args{'response_type'});
    }

    # query params
    if ( exists $args{'scope'}) {
        $query_params->{'scope'} = $self->{api_client}->to_query_value($args{'scope'});
    }

    # query params
    if ( exists $args{'redirect_uri'}) {
        $query_params->{'redirect_uri'} = $self->{api_client}->to_query_value($args{'redirect_uri'});
    }

    # query params
    if ( exists $args{'state'}) {
        $query_params->{'state'} = $self->{api_client}->to_query_value($args{'state'});
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

1;
