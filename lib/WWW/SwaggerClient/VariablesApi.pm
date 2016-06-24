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
package WWW::SwaggerClient::VariablesApi;

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
# v1_public_variables_get
#
# Get public variables
# 
{
    my $params = {
    };
    __PACKAGE__->method_documentation->{ v1_public_variables_get } = { 
    	summary => 'Get public variables',
        params => $params,
        returns => 'Variable',
        };
}
# @return Variable
#
sub v1_public_variables_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/public/variables';
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
    my $_response_object = $self->{api_client}->deserialize('Variable', $response);
    return $_response_object;
}

#
# v1_public_variables_search_search_get
#
# Get top 5 PUBLIC variables with the most correlations
# 
# @param string $search Search query can be some fraction of a variable name. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $category_name Filter variables by category name. The variable categories include Activity, Causes of Illness, Cognitive Performance, Conditions, Environment, Foods, Location, Miscellaneous, Mood, Nutrition, Physical Activity, Physique, Sleep, Social Interactions, Symptoms, Treatments, Vital Signs, and Work. (optional)
# @param string $source Specify a data source name to only return variables from a specific data source. (optional)
# @param string $effect_or_cause Indicate if you only want variables that have user correlations.  Possible values are effect and cause. (optional)
# @param string $public_effect_or_cause Indicate if you only want variables that have aggregated correlations.  Possible values are effect and cause. (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. (optional)
# @param int $offset Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. (optional)
# @param int $sort Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. (optional)
{
    my $params = {
    'search' => {
        data_type => 'string',
        description => 'Search query can be some fraction of a variable name.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'category_name' => {
        data_type => 'string',
        description => 'Filter variables by category name. The variable categories include Activity, Causes of Illness, Cognitive Performance, Conditions, Environment, Foods, Location, Miscellaneous, Mood, Nutrition, Physical Activity, Physique, Sleep, Social Interactions, Symptoms, Treatments, Vital Signs, and Work.',
        required => '0',
    },
    'source' => {
        data_type => 'string',
        description => 'Specify a data source name to only return variables from a specific data source.',
        required => '0',
    },
    'effect_or_cause' => {
        data_type => 'string',
        description => 'Indicate if you only want variables that have user correlations.  Possible values are effect and cause.',
        required => '0',
    },
    'public_effect_or_cause' => {
        data_type => 'string',
        description => 'Indicate if you only want variables that have aggregated correlations.  Possible values are effect and cause.',
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
    __PACKAGE__->method_documentation->{ v1_public_variables_search_search_get } = { 
    	summary => 'Get top 5 PUBLIC variables with the most correlations',
        params => $params,
        returns => 'Variable',
        };
}
# @return Variable
#
sub v1_public_variables_search_search_get {
    my ($self, %args) = @_;

    # verify the required parameter 'search' is set
    unless (exists $args{'search'}) {
      croak("Missing the required parameter 'search' when calling v1_public_variables_search_search_get");
    }

    # parse inputs
    my $_resource_path = '/v1/public/variables/search/{search}';
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
    if ( exists $args{'category_name'}) {
        $query_params->{'categoryName'} = $self->{api_client}->to_query_value($args{'category_name'});
    }

    # query params
    if ( exists $args{'source'}) {
        $query_params->{'source'} = $self->{api_client}->to_query_value($args{'source'});
    }

    # query params
    if ( exists $args{'effect_or_cause'}) {
        $query_params->{'effectOrCause'} = $self->{api_client}->to_query_value($args{'effect_or_cause'});
    }

    # query params
    if ( exists $args{'public_effect_or_cause'}) {
        $query_params->{'publicEffectOrCause'} = $self->{api_client}->to_query_value($args{'public_effect_or_cause'});
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
    my $_response_object = $self->{api_client}->deserialize('Variable', $response);
    return $_response_object;
}

#
# v1_user_variables_post
#
# Update User Settings for a Variable
# 
# @param UserVariables $user_variables Variable user settings data (required)
{
    my $params = {
    'user_variables' => {
        data_type => 'UserVariables',
        description => 'Variable user settings data',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ v1_user_variables_post } = { 
    	summary => 'Update User Settings for a Variable',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_user_variables_post {
    my ($self, %args) = @_;

    # verify the required parameter 'user_variables' is set
    unless (exists $args{'user_variables'}) {
      croak("Missing the required parameter 'user_variables' when calling v1_user_variables_post");
    }

    # parse inputs
    my $_resource_path = '/v1/userVariables';
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
    if ( exists $args{'user_variables'}) {
        $_body_data = $args{'user_variables'};
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
# v1_variable_categories_get
#
# Variable categories
# 
{
    my $params = {
    };
    __PACKAGE__->method_documentation->{ v1_variable_categories_get } = { 
    	summary => 'Variable categories',
        params => $params,
        returns => 'ARRAY[VariableCategory]',
        };
}
# @return ARRAY[VariableCategory]
#
sub v1_variable_categories_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/variableCategories';
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[VariableCategory]', $response);
    return $_response_object;
}

#
# v1_variables_get
#
# Get variables by the category name
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param int $id Common variable id (optional)
# @param int $user_id User id (optional)
# @param string $category Filter data by category (optional)
# @param string $name Original name of the variable (supports exact name match only) (optional)
# @param string $last_updated Filter by the last time any of the properties of the variable were changed. Uses UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot; (optional)
# @param string $source The name of the data source that created the variable (supports exact name match only). So if you have a client application and you only want variables that were last updated by your app, you can include the name of your app here (optional)
# @param string $latest_measurement_time Filter variables based on the last time a measurement for them was created or updated in the UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot; (optional)
# @param string $number_of_measurements Filter variables by the total number of measurements that they have. This could be used of you want to filter or sort by popularity. (optional)
# @param string $last_source Limit variables to those which measurements were last submitted by a specific source. So if you have a client application and you only want variables that were last updated by your app, you can include the name of your app here. (supports exact name match only) (optional)
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
    'id' => {
        data_type => 'int',
        description => 'Common variable id',
        required => '0',
    },
    'user_id' => {
        data_type => 'int',
        description => 'User id',
        required => '0',
    },
    'category' => {
        data_type => 'string',
        description => 'Filter data by category',
        required => '0',
    },
    'name' => {
        data_type => 'string',
        description => 'Original name of the variable (supports exact name match only)',
        required => '0',
    },
    'last_updated' => {
        data_type => 'string',
        description => 'Filter by the last time any of the properties of the variable were changed. Uses UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot;',
        required => '0',
    },
    'source' => {
        data_type => 'string',
        description => 'The name of the data source that created the variable (supports exact name match only). So if you have a client application and you only want variables that were last updated by your app, you can include the name of your app here',
        required => '0',
    },
    'latest_measurement_time' => {
        data_type => 'string',
        description => 'Filter variables based on the last time a measurement for them was created or updated in the UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot;',
        required => '0',
    },
    'number_of_measurements' => {
        data_type => 'string',
        description => 'Filter variables by the total number of measurements that they have. This could be used of you want to filter or sort by popularity.',
        required => '0',
    },
    'last_source' => {
        data_type => 'string',
        description => 'Limit variables to those which measurements were last submitted by a specific source. So if you have a client application and you only want variables that were last updated by your app, you can include the name of your app here. (supports exact name match only)',
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
    __PACKAGE__->method_documentation->{ v1_variables_get } = { 
    	summary => 'Get variables by the category name',
        params => $params,
        returns => 'Variable',
        };
}
# @return Variable
#
sub v1_variables_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/v1/variables';
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
    if ( exists $args{'user_id'}) {
        $query_params->{'userId'} = $self->{api_client}->to_query_value($args{'user_id'});
    }

    # query params
    if ( exists $args{'category'}) {
        $query_params->{'category'} = $self->{api_client}->to_query_value($args{'category'});
    }

    # query params
    if ( exists $args{'name'}) {
        $query_params->{'name'} = $self->{api_client}->to_query_value($args{'name'});
    }

    # query params
    if ( exists $args{'last_updated'}) {
        $query_params->{'lastUpdated'} = $self->{api_client}->to_query_value($args{'last_updated'});
    }

    # query params
    if ( exists $args{'source'}) {
        $query_params->{'source'} = $self->{api_client}->to_query_value($args{'source'});
    }

    # query params
    if ( exists $args{'latest_measurement_time'}) {
        $query_params->{'latestMeasurementTime'} = $self->{api_client}->to_query_value($args{'latest_measurement_time'});
    }

    # query params
    if ( exists $args{'number_of_measurements'}) {
        $query_params->{'numberOfMeasurements'} = $self->{api_client}->to_query_value($args{'number_of_measurements'});
    }

    # query params
    if ( exists $args{'last_source'}) {
        $query_params->{'lastSource'} = $self->{api_client}->to_query_value($args{'last_source'});
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
    my $auth_settings = [qw(oauth2 basicAuth )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Variable', $response);
    return $_response_object;
}

#
# v1_variables_post
#
# Create Variables
# 
# @param VariablesNew $body Original name for the variable. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'body' => {
        data_type => 'VariablesNew',
        description => 'Original name for the variable.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_variables_post } = { 
    	summary => 'Create Variables',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub v1_variables_post {
    my ($self, %args) = @_;

    # verify the required parameter 'body' is set
    unless (exists $args{'body'}) {
      croak("Missing the required parameter 'body' when calling v1_variables_post");
    }

    # parse inputs
    my $_resource_path = '/v1/variables';
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
# v1_variables_search_search_get
#
# Get variables by search query
# 
# @param string $search Search query which may be an entire variable name or a fragment of one. (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $category_name Filter variables by category name. The variable categories include Activity, Causes of Illness, Cognitive Performance, Conditions, Environment, Foods, Location, Miscellaneous, Mood, Nutrition, Physical Activity, Physique, Sleep, Social Interactions, Symptoms, Treatments, Vital Signs, and Work. (optional)
# @param boolean $include_public Set to true if you would like to include public variables when no user variables are found. (optional)
# @param boolean $manual_tracking Set to true if you would like to exlude variables like apps and website names. (optional)
# @param string $source Specify a data source name to only return variables from a specific data source. (optional)
# @param string $effect_or_cause Indicate if you only want variables that have user correlations.  Possible values are effect and cause. (optional)
# @param string $public_effect_or_cause Indicate if you only want variables that have aggregated correlations.  Possible values are effect and cause. (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. (optional)
# @param int $offset Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. (optional)
{
    my $params = {
    'search' => {
        data_type => 'string',
        description => 'Search query which may be an entire variable name or a fragment of one.',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'category_name' => {
        data_type => 'string',
        description => 'Filter variables by category name. The variable categories include Activity, Causes of Illness, Cognitive Performance, Conditions, Environment, Foods, Location, Miscellaneous, Mood, Nutrition, Physical Activity, Physique, Sleep, Social Interactions, Symptoms, Treatments, Vital Signs, and Work.',
        required => '0',
    },
    'include_public' => {
        data_type => 'boolean',
        description => 'Set to true if you would like to include public variables when no user variables are found.',
        required => '0',
    },
    'manual_tracking' => {
        data_type => 'boolean',
        description => 'Set to true if you would like to exlude variables like apps and website names.',
        required => '0',
    },
    'source' => {
        data_type => 'string',
        description => 'Specify a data source name to only return variables from a specific data source.',
        required => '0',
    },
    'effect_or_cause' => {
        data_type => 'string',
        description => 'Indicate if you only want variables that have user correlations.  Possible values are effect and cause.',
        required => '0',
    },
    'public_effect_or_cause' => {
        data_type => 'string',
        description => 'Indicate if you only want variables that have aggregated correlations.  Possible values are effect and cause.',
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
    };
    __PACKAGE__->method_documentation->{ v1_variables_search_search_get } = { 
    	summary => 'Get variables by search query',
        params => $params,
        returns => 'ARRAY[Variable]',
        };
}
# @return ARRAY[Variable]
#
sub v1_variables_search_search_get {
    my ($self, %args) = @_;

    # verify the required parameter 'search' is set
    unless (exists $args{'search'}) {
      croak("Missing the required parameter 'search' when calling v1_variables_search_search_get");
    }

    # parse inputs
    my $_resource_path = '/v1/variables/search/{search}';
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
    if ( exists $args{'category_name'}) {
        $query_params->{'categoryName'} = $self->{api_client}->to_query_value($args{'category_name'});
    }

    # query params
    if ( exists $args{'include_public'}) {
        $query_params->{'includePublic'} = $self->{api_client}->to_query_value($args{'include_public'});
    }

    # query params
    if ( exists $args{'manual_tracking'}) {
        $query_params->{'manualTracking'} = $self->{api_client}->to_query_value($args{'manual_tracking'});
    }

    # query params
    if ( exists $args{'source'}) {
        $query_params->{'source'} = $self->{api_client}->to_query_value($args{'source'});
    }

    # query params
    if ( exists $args{'effect_or_cause'}) {
        $query_params->{'effectOrCause'} = $self->{api_client}->to_query_value($args{'effect_or_cause'});
    }

    # query params
    if ( exists $args{'public_effect_or_cause'}) {
        $query_params->{'publicEffectOrCause'} = $self->{api_client}->to_query_value($args{'public_effect_or_cause'});
    }

    # query params
    if ( exists $args{'limit'}) {
        $query_params->{'limit'} = $self->{api_client}->to_query_value($args{'limit'});
    }

    # query params
    if ( exists $args{'offset'}) {
        $query_params->{'offset'} = $self->{api_client}->to_query_value($args{'offset'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Variable]', $response);
    return $_response_object;
}

#
# v1_variables_variable_name_get
#
# Get info about a variable
# 
# @param string $variable_name Variable name (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'variable_name' => {
        data_type => 'string',
        description => 'Variable name',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ v1_variables_variable_name_get } = { 
    	summary => 'Get info about a variable',
        params => $params,
        returns => 'Variable',
        };
}
# @return Variable
#
sub v1_variables_variable_name_get {
    my ($self, %args) = @_;

    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_variables_variable_name_get");
    }

    # parse inputs
    my $_resource_path = '/v1/variables/{variableName}';
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
    my $_response_object = $self->{api_client}->deserialize('Variable', $response);
    return $_response_object;
}

1;
