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
package WWW::SwaggerClient::CorrelationsApi;

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
# v1_aggregated_correlations_get
#
# Get aggregated correlations
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $effect ORIGINAL variable name of the effect variable for which the user desires correlations (optional)
# @param string $cause ORIGINAL variable name of the cause variable for which the user desires correlations (optional)
# @param string $correlation_coefficient Pearson correlation coefficient between cause and effect after lagging by onset delay and grouping by duration of action (optional)
# @param string $onset_delay The number of seconds which pass following a cause measurement before an effect would likely be observed. (optional)
# @param string $duration_of_action The time in seconds over which the cause would be expected to exert a measurable effect. We have selected a default value for each variable. This default value may be replaced by a user specified by adjusting their variable user settings. (optional)
# @param string $last_updated The time that this measurement was last updated in the UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot; (optional)
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
    'effect' => {
        data_type => 'string',
        description => 'ORIGINAL variable name of the effect variable for which the user desires correlations',
        required => '0',
    },
    'cause' => {
        data_type => 'string',
        description => 'ORIGINAL variable name of the cause variable for which the user desires correlations',
        required => '0',
    },
    'correlation_coefficient' => {
        data_type => 'string',
        description => 'Pearson correlation coefficient between cause and effect after lagging by onset delay and grouping by duration of action',
        required => '0',
    },
    'onset_delay' => {
        data_type => 'string',
        description => 'The number of seconds which pass following a cause measurement before an effect would likely be observed.',
        required => '0',
    },
    'duration_of_action' => {
        data_type => 'string',
        description => 'The time in seconds over which the cause would be expected to exert a measurable effect. We have selected a default value for each variable. This default value may be replaced by a user specified by adjusting their variable user settings.',
        required => '0',
    },
    'last_updated' => {
        data_type => 'string',
        description => 'The time that this measurement was last updated in the UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot;',
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
    __PACKAGE__->method_documentation->{ v1_aggregated_correlations_get } = { 
    	summary => 'Get aggregated correlations',
        params => $params,
        returns => 'ARRAY[Correlation]',
        };
}
# @return ARRAY[Correlation]
#
sub v1_aggregated_correlations_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/aggregatedCorrelations';
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
    if ( exists $args{'effect'}) {
        $query_params->{'effect'} = $self->{api_client}->to_query_value($args{'effect'});
    }

    # query params
    if ( exists $args{'cause'}) {
        $query_params->{'cause'} = $self->{api_client}->to_query_value($args{'cause'});
    }

    # query params
    if ( exists $args{'correlation_coefficient'}) {
        $query_params->{'correlationCoefficient'} = $self->{api_client}->to_query_value($args{'correlation_coefficient'});
    }

    # query params
    if ( exists $args{'onset_delay'}) {
        $query_params->{'onsetDelay'} = $self->{api_client}->to_query_value($args{'onset_delay'});
    }

    # query params
    if ( exists $args{'duration_of_action'}) {
        $query_params->{'durationOfAction'} = $self->{api_client}->to_query_value($args{'duration_of_action'});
    }

    # query params
    if ( exists $args{'last_updated'}) {
        $query_params->{'lastUpdated'} = $self->{api_client}->to_query_value($args{'last_updated'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Correlation]', $response);
    return $_response_object;
}

#
# v1_aggregated_correlations_post
#
# Store or Update a Correlation
# 
# @param PostCorrelation $body Provides correlation data (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'body' => {
        data_type => 'PostCorrelation',
        description => 'Provides correlation data',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_aggregated_correlations_post } = { 
    	summary => 'Store or Update a Correlation',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_aggregated_correlations_post {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling v1_aggregated_correlations_post");
    }

    # parse inputs
    my $_resource_path = '/v1/aggregatedCorrelations';
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
# v1_correlations_get
#
# Get correlations
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $effect ORIGINAL variable name of the effect variable for which the user desires correlations (optional)
# @param string $cause ORIGINAL variable name of the cause variable for which the user desires correlations (optional)
# @param string $correlation_coefficient Pearson correlation coefficient between cause and effect after lagging by onset delay and grouping by duration of action (optional)
# @param string $onset_delay The number of seconds which pass following a cause measurement before an effect would likely be observed. (optional)
# @param string $duration_of_action The time in seconds over which the cause would be expected to exert a measurable effect. We have selected a default value for each variable. This default value may be replaced by a user specified by adjusting their variable user settings. (optional)
# @param string $last_updated The time that this measurement was last updated in the UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot; (optional)
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
    'effect' => {
        data_type => 'string',
        description => 'ORIGINAL variable name of the effect variable for which the user desires correlations',
        required => '0',
    },
    'cause' => {
        data_type => 'string',
        description => 'ORIGINAL variable name of the cause variable for which the user desires correlations',
        required => '0',
    },
    'correlation_coefficient' => {
        data_type => 'string',
        description => 'Pearson correlation coefficient between cause and effect after lagging by onset delay and grouping by duration of action',
        required => '0',
    },
    'onset_delay' => {
        data_type => 'string',
        description => 'The number of seconds which pass following a cause measurement before an effect would likely be observed.',
        required => '0',
    },
    'duration_of_action' => {
        data_type => 'string',
        description => 'The time in seconds over which the cause would be expected to exert a measurable effect. We have selected a default value for each variable. This default value may be replaced by a user specified by adjusting their variable user settings.',
        required => '0',
    },
    'last_updated' => {
        data_type => 'string',
        description => 'The time that this measurement was last updated in the UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot;',
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
    __PACKAGE__->method_documentation->{ v1_correlations_get } = { 
    	summary => 'Get correlations',
        params => $params,
        returns => 'ARRAY[Correlation]',
        };
}
# @return ARRAY[Correlation]
#
sub v1_correlations_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/correlations';
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
    if ( exists $args{'effect'}) {
        $query_params->{'effect'} = $self->{api_client}->to_query_value($args{'effect'});
    }

    # query params
    if ( exists $args{'cause'}) {
        $query_params->{'cause'} = $self->{api_client}->to_query_value($args{'cause'});
    }

    # query params
    if ( exists $args{'correlation_coefficient'}) {
        $query_params->{'correlationCoefficient'} = $self->{api_client}->to_query_value($args{'correlation_coefficient'});
    }

    # query params
    if ( exists $args{'onset_delay'}) {
        $query_params->{'onsetDelay'} = $self->{api_client}->to_query_value($args{'onset_delay'});
    }

    # query params
    if ( exists $args{'duration_of_action'}) {
        $query_params->{'durationOfAction'} = $self->{api_client}->to_query_value($args{'duration_of_action'});
    }

    # query params
    if ( exists $args{'last_updated'}) {
        $query_params->{'lastUpdated'} = $self->{api_client}->to_query_value($args{'last_updated'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Correlation]', $response);
    return $_response_object;
}

#
# v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get
#
# Search user correlations for a given cause
# 
# @param int $organization_id Organization ID (required)
# @param int $user_id User id (required)
# @param string $variable_name Effect variable name (required)
# @param string $organization_token Organization access token (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $include_public Include public correlations, Can be \&quot;1\&quot; or empty. (optional)
{
    my $params = {
    'organization_id' => {
        data_type => 'int',
        description => 'Organization ID',
        required => '1',
    },
    'user_id' => {
        data_type => 'int',
        description => 'User id',
        required => '1',
    },
    'variable_name' => {
        data_type => 'string',
        description => 'Effect variable name',
        required => '1',
    },
    'organization_token' => {
        data_type => 'string',
        description => 'Organization access token',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'include_public' => {
        data_type => 'string',
        description => 'Include public correlations, Can be \&quot;1\&quot; or empty.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get } = { 
    	summary => 'Search user correlations for a given cause',
        params => $params,
        returns => 'ARRAY[Correlation]',
        };
}
# @return ARRAY[Correlation]
#
sub v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get {
    my ($self, %args) = @_;

    # verify the required parameter 'organization_id' is set
    unless (exists $args{'organization_id'}) {
      croak("Missing the required parameter 'organization_id' when calling v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get");
    }

    # verify the required parameter 'user_id' is set
    unless (exists $args{'user_id'}) {
      croak("Missing the required parameter 'user_id' when calling v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get");
    }

    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get");
    }

    # verify the required parameter 'organization_token' is set
    unless (exists $args{'organization_token'}) {
      croak("Missing the required parameter 'organization_token' when calling v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get");
    }

    # parse inputs
    my $_resource_path = '/v1/organizations/{organizationId}/users/{userId}/variables/{variableName}/causes';
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
    if ( exists $args{'organization_token'}) {
        $query_params->{'organization_token'} = $self->{api_client}->to_query_value($args{'organization_token'});
    }

    # query params
    if ( exists $args{'include_public'}) {
        $query_params->{'includePublic'} = $self->{api_client}->to_query_value($args{'include_public'});
    }

    # path params
    if ( exists $args{'organization_id'}) {
        my $_base_variable = "{" . "organizationId" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'organization_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'user_id'}) {
        my $_base_variable = "{" . "userId" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'user_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'variable_name'}) {
        my $_base_variable = "{" . "variableName" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'variable_name'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Correlation]', $response);
    return $_response_object;
}

#
# v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get
#
# Search user correlations for a given cause
# 
# @param int $organization_id Organization ID (required)
# @param int $user_id User id (required)
# @param string $variable_name Cause variable name (required)
# @param string $organization_token Organization access token (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $include_public Include public correlations, Can be \&quot;1\&quot; or empty. (optional)
{
    my $params = {
    'organization_id' => {
        data_type => 'int',
        description => 'Organization ID',
        required => '1',
    },
    'user_id' => {
        data_type => 'int',
        description => 'User id',
        required => '1',
    },
    'variable_name' => {
        data_type => 'string',
        description => 'Cause variable name',
        required => '1',
    },
    'organization_token' => {
        data_type => 'string',
        description => 'Organization access token',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'include_public' => {
        data_type => 'string',
        description => 'Include public correlations, Can be \&quot;1\&quot; or empty.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get } = { 
    	summary => 'Search user correlations for a given cause',
        params => $params,
        returns => 'ARRAY[CommonResponse]',
        };
}
# @return ARRAY[CommonResponse]
#
sub v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get {
    my ($self, %args) = @_;

    # verify the required parameter 'organization_id' is set
    unless (exists $args{'organization_id'}) {
      croak("Missing the required parameter 'organization_id' when calling v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get");
    }

    # verify the required parameter 'user_id' is set
    unless (exists $args{'user_id'}) {
      croak("Missing the required parameter 'user_id' when calling v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get");
    }

    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get");
    }

    # verify the required parameter 'organization_token' is set
    unless (exists $args{'organization_token'}) {
      croak("Missing the required parameter 'organization_token' when calling v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get");
    }

    # parse inputs
    my $_resource_path = '/v1/organizations/{organizationId}/users/{userId}/variables/{variableName}/effects';
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
    if ( exists $args{'organization_token'}) {
        $query_params->{'organization_token'} = $self->{api_client}->to_query_value($args{'organization_token'});
    }

    # query params
    if ( exists $args{'include_public'}) {
        $query_params->{'include_public'} = $self->{api_client}->to_query_value($args{'include_public'});
    }

    # path params
    if ( exists $args{'organization_id'}) {
        my $_base_variable = "{" . "organizationId" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'organization_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'user_id'}) {
        my $_base_variable = "{" . "userId" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'user_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'variable_name'}) {
        my $_base_variable = "{" . "variableName" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'variable_name'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[CommonResponse]', $response);
    return $_response_object;
}

#
# v1_public_correlations_search_search_get
#
# Get average correlations for variables containing search term
# 
# @param string $search Name of the variable that you want to know the causes or effects of. (required)
# @param string $effect_or_cause Setting this to effect indicates that the searched variable is the effect and that the causes of this variable should be returned.  cause indicates that the searched variable is the cause and the effects should be returned. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'search' => {
        data_type => 'string',
        description => 'Name of the variable that you want to know the causes or effects of.',
        required => '1',
    },
    'effect_or_cause' => {
        data_type => 'string',
        description => 'Setting this to effect indicates that the searched variable is the effect and that the causes of this variable should be returned.  cause indicates that the searched variable is the cause and the effects should be returned.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_public_correlations_search_search_get } = { 
    	summary => 'Get average correlations for variables containing search term',
        params => $params,
        returns => 'ARRAY[Correlation]',
        };
}
# @return ARRAY[Correlation]
#
sub v1_public_correlations_search_search_get {
    my ($self, %args) = @_;

    # verify the required parameter 'search' is set
    unless (exists $args{'search'}) {
      croak("Missing the required parameter 'search' when calling v1_public_correlations_search_search_get");
    }

    # verify the required parameter 'effect_or_cause' is set
    unless (exists $args{'effect_or_cause'}) {
      croak("Missing the required parameter 'effect_or_cause' when calling v1_public_correlations_search_search_get");
    }

    # parse inputs
    my $_resource_path = '/v1/public/correlations/search/{search}';
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
    if ( exists $args{'effect_or_cause'}) {
        $query_params->{'effectOrCause'} = $self->{api_client}->to_query_value($args{'effect_or_cause'});
    }

    # path params
    if ( exists $args{'search'}) {
        my $_base_variable = "{" . "search" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'search'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Correlation]', $response);
    return $_response_object;
}

#
# v1_variables_variable_name_causes_get
#
# Search user correlations for a given effect
# 
# @param string $variable_name Effect variable name (required)
{
    my $params = {
    'variable_name' => {
        data_type => 'string',
        description => 'Effect variable name',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ v1_variables_variable_name_causes_get } = { 
    	summary => 'Search user correlations for a given effect',
        params => $params,
        returns => 'ARRAY[Correlation]',
        };
}
# @return ARRAY[Correlation]
#
sub v1_variables_variable_name_causes_get {
    my ($self, %args) = @_;

    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_variables_variable_name_causes_get");
    }

    # parse inputs
    my $_resource_path = '/v1/variables/{variableName}/causes';
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
    if ( exists $args{'variable_name'}) {
        my $_base_variable = "{" . "variableName" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'variable_name'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Correlation]', $response);
    return $_response_object;
}

#
# v1_variables_variable_name_effects_get
#
# Search user correlations for a given cause
# 
# @param string $variable_name Cause variable name (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'variable_name' => {
        data_type => 'string',
        description => 'Cause variable name',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_variables_variable_name_effects_get } = { 
    	summary => 'Search user correlations for a given cause',
        params => $params,
        returns => 'ARRAY[Correlation]',
        };
}
# @return ARRAY[Correlation]
#
sub v1_variables_variable_name_effects_get {
    my ($self, %args) = @_;

    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_variables_variable_name_effects_get");
    }

    # parse inputs
    my $_resource_path = '/v1/variables/{variableName}/effects';
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
    if ( exists $args{'variable_name'}) {
        my $_base_variable = "{" . "variableName" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'variable_name'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Correlation]', $response);
    return $_response_object;
}

#
# v1_variables_variable_name_public_causes_get
#
# Search public correlations for a given effect
# 
# @param string $variable_name Effect variable name (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'variable_name' => {
        data_type => 'string',
        description => 'Effect variable name',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_variables_variable_name_public_causes_get } = { 
    	summary => 'Search public correlations for a given effect',
        params => $params,
        returns => 'ARRAY[Correlation]',
        };
}
# @return ARRAY[Correlation]
#
sub v1_variables_variable_name_public_causes_get {
    my ($self, %args) = @_;

    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_variables_variable_name_public_causes_get");
    }

    # parse inputs
    my $_resource_path = '/v1/variables/{variableName}/public/causes';
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
    if ( exists $args{'variable_name'}) {
        my $_base_variable = "{" . "variableName" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'variable_name'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Correlation]', $response);
    return $_response_object;
}

#
# v1_variables_variable_name_public_effects_get
#
# Search public correlations for a given cause
# 
# @param string $variable_name Cause variable name (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'variable_name' => {
        data_type => 'string',
        description => 'Cause variable name',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_variables_variable_name_public_effects_get } = { 
    	summary => 'Search public correlations for a given cause',
        params => $params,
        returns => 'ARRAY[Correlation]',
        };
}
# @return ARRAY[Correlation]
#
sub v1_variables_variable_name_public_effects_get {
    my ($self, %args) = @_;

    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_variables_variable_name_public_effects_get");
    }

    # parse inputs
    my $_resource_path = '/v1/variables/{variableName}/public/effects';
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
    if ( exists $args{'variable_name'}) {
        my $_base_variable = "{" . "variableName" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'variable_name'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Correlation]', $response);
    return $_response_object;
}

#
# v1_votes_delete_post
#
# Delete vote
# 
# @param VoteDelete $body The cause and effect variable names for the predictor vote to be deleted. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'body' => {
        data_type => 'VoteDelete',
        description => 'The cause and effect variable names for the predictor vote to be deleted.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_votes_delete_post } = { 
    	summary => 'Delete vote',
        params => $params,
        returns => 'CommonResponse',
        };
}
# @return CommonResponse
#
sub v1_votes_delete_post {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling v1_votes_delete_post");
    }

    # parse inputs
    my $_resource_path = '/v1/votes/delete';
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
# v1_votes_post
#
# Post or update vote
# 
# @param PostVote $body Contains the cause variable, effect variable, and vote value. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'body' => {
        data_type => 'PostVote',
        description => 'Contains the cause variable, effect variable, and vote value.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_votes_post } = { 
    	summary => 'Post or update vote',
        params => $params,
        returns => 'CommonResponse',
        };
}
# @return CommonResponse
#
sub v1_votes_post {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling v1_votes_post");
    }

    # parse inputs
    my $_resource_path = '/v1/votes';
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
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('CommonResponse', $response);
    return $_response_object;
}

1;
