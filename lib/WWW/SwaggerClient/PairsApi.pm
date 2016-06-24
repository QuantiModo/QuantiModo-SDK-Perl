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
package WWW::SwaggerClient::PairsApi;

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
# v1_pairs_csv_get
#
# Get pairs
# 
# @param string $cause Original variable name for the explanatory or independent variable (required)
# @param string $effect Original variable name for the outcome or dependent variable (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $cause_source Name of data source that the cause measurements should come from (optional)
# @param string $cause_unit Abbreviated name for the unit cause measurements to be returned in (optional)
# @param string $delay Delay before onset of action (in seconds) from the cause variable settings. (optional)
# @param string $duration Duration of action (in seconds) from the cause variable settings. (optional)
# @param string $effect_source Name of data source that the effectmeasurements should come from (optional)
# @param string $effect_unit Abbreviated name for the unit effect measurements to be returned in (optional)
# @param string $end_time The most recent date (in epoch time) for which we should return measurements (optional)
# @param string $start_time The earliest date (in epoch time) for which we should return measurements (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. (optional)
# @param int $offset Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. (optional)
# @param int $sort Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. (optional)
{
    my $params = {
    'cause' => {
        data_type => 'string',
        description => 'Original variable name for the explanatory or independent variable',
        required => '1',
    },
    'effect' => {
        data_type => 'string',
        description => 'Original variable name for the outcome or dependent variable',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'cause_source' => {
        data_type => 'string',
        description => 'Name of data source that the cause measurements should come from',
        required => '0',
    },
    'cause_unit' => {
        data_type => 'string',
        description => 'Abbreviated name for the unit cause measurements to be returned in',
        required => '0',
    },
    'delay' => {
        data_type => 'string',
        description => 'Delay before onset of action (in seconds) from the cause variable settings.',
        required => '0',
    },
    'duration' => {
        data_type => 'string',
        description => 'Duration of action (in seconds) from the cause variable settings.',
        required => '0',
    },
    'effect_source' => {
        data_type => 'string',
        description => 'Name of data source that the effectmeasurements should come from',
        required => '0',
    },
    'effect_unit' => {
        data_type => 'string',
        description => 'Abbreviated name for the unit effect measurements to be returned in',
        required => '0',
    },
    'end_time' => {
        data_type => 'string',
        description => 'The most recent date (in epoch time) for which we should return measurements',
        required => '0',
    },
    'start_time' => {
        data_type => 'string',
        description => 'The earliest date (in epoch time) for which we should return measurements',
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
    __PACKAGE__->method_documentation->{ v1_pairs_csv_get } = { 
    	summary => 'Get pairs',
        params => $params,
        returns => 'ARRAY[Pairs]',
        };
}
# @return ARRAY[Pairs]
#
sub v1_pairs_csv_get {
    my ($self, %args) = @_;

    # verify the required parameter 'cause' is set
    unless (exists $args{'cause'}) {
      croak("Missing the required parameter 'cause' when calling v1_pairs_csv_get");
    }

    # verify the required parameter 'effect' is set
    unless (exists $args{'effect'}) {
      croak("Missing the required parameter 'effect' when calling v1_pairs_csv_get");
    }

    # parse inputs
    my $_resource_path = '/v1/pairsCsv';
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
    if ( exists $args{'cause'}) {
        $query_params->{'cause'} = $self->{api_client}->to_query_value($args{'cause'});
    }

    # query params
    if ( exists $args{'cause_source'}) {
        $query_params->{'causeSource'} = $self->{api_client}->to_query_value($args{'cause_source'});
    }

    # query params
    if ( exists $args{'cause_unit'}) {
        $query_params->{'causeUnit'} = $self->{api_client}->to_query_value($args{'cause_unit'});
    }

    # query params
    if ( exists $args{'delay'}) {
        $query_params->{'delay'} = $self->{api_client}->to_query_value($args{'delay'});
    }

    # query params
    if ( exists $args{'duration'}) {
        $query_params->{'duration'} = $self->{api_client}->to_query_value($args{'duration'});
    }

    # query params
    if ( exists $args{'effect'}) {
        $query_params->{'effect'} = $self->{api_client}->to_query_value($args{'effect'});
    }

    # query params
    if ( exists $args{'effect_source'}) {
        $query_params->{'effectSource'} = $self->{api_client}->to_query_value($args{'effect_source'});
    }

    # query params
    if ( exists $args{'effect_unit'}) {
        $query_params->{'effectUnit'} = $self->{api_client}->to_query_value($args{'effect_unit'});
    }

    # query params
    if ( exists $args{'end_time'}) {
        $query_params->{'endTime'} = $self->{api_client}->to_query_value($args{'end_time'});
    }

    # query params
    if ( exists $args{'start_time'}) {
        $query_params->{'startTime'} = $self->{api_client}->to_query_value($args{'start_time'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Pairs]', $response);
    return $_response_object;
}

#
# v1_pairs_get
#
# Get pairs
# 
# @param string $cause Original variable name for the explanatory or independent variable (required)
# @param string $effect Original variable name for the outcome or dependent variable (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param string $cause_source Name of data source that the cause measurements should come from (optional)
# @param string $cause_unit Abbreviated name for the unit cause measurements to be returned in (optional)
# @param string $delay Delay before onset of action (in seconds) from the cause variable settings. (optional)
# @param string $duration Duration of action (in seconds) from the cause variable settings. (optional)
# @param string $effect_source Name of data source that the effectmeasurements should come from (optional)
# @param string $effect_unit Abbreviated name for the unit effect measurements to be returned in (optional)
# @param string $end_time The most recent date (in epoch time) for which we should return measurements (optional)
# @param string $start_time The earliest date (in epoch time) for which we should return measurements (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. (optional)
# @param int $offset Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. (optional)
# @param int $sort Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. (optional)
{
    my $params = {
    'cause' => {
        data_type => 'string',
        description => 'Original variable name for the explanatory or independent variable',
        required => '1',
    },
    'effect' => {
        data_type => 'string',
        description => 'Original variable name for the outcome or dependent variable',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'cause_source' => {
        data_type => 'string',
        description => 'Name of data source that the cause measurements should come from',
        required => '0',
    },
    'cause_unit' => {
        data_type => 'string',
        description => 'Abbreviated name for the unit cause measurements to be returned in',
        required => '0',
    },
    'delay' => {
        data_type => 'string',
        description => 'Delay before onset of action (in seconds) from the cause variable settings.',
        required => '0',
    },
    'duration' => {
        data_type => 'string',
        description => 'Duration of action (in seconds) from the cause variable settings.',
        required => '0',
    },
    'effect_source' => {
        data_type => 'string',
        description => 'Name of data source that the effectmeasurements should come from',
        required => '0',
    },
    'effect_unit' => {
        data_type => 'string',
        description => 'Abbreviated name for the unit effect measurements to be returned in',
        required => '0',
    },
    'end_time' => {
        data_type => 'string',
        description => 'The most recent date (in epoch time) for which we should return measurements',
        required => '0',
    },
    'start_time' => {
        data_type => 'string',
        description => 'The earliest date (in epoch time) for which we should return measurements',
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
    __PACKAGE__->method_documentation->{ v1_pairs_get } = { 
    	summary => 'Get pairs',
        params => $params,
        returns => 'ARRAY[Pairs]',
        };
}
# @return ARRAY[Pairs]
#
sub v1_pairs_get {
    my ($self, %args) = @_;

    # verify the required parameter 'cause' is set
    unless (exists $args{'cause'}) {
      croak("Missing the required parameter 'cause' when calling v1_pairs_get");
    }

    # verify the required parameter 'effect' is set
    unless (exists $args{'effect'}) {
      croak("Missing the required parameter 'effect' when calling v1_pairs_get");
    }

    # parse inputs
    my $_resource_path = '/v1/pairs';
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
    if ( exists $args{'cause'}) {
        $query_params->{'cause'} = $self->{api_client}->to_query_value($args{'cause'});
    }

    # query params
    if ( exists $args{'cause_source'}) {
        $query_params->{'causeSource'} = $self->{api_client}->to_query_value($args{'cause_source'});
    }

    # query params
    if ( exists $args{'cause_unit'}) {
        $query_params->{'causeUnit'} = $self->{api_client}->to_query_value($args{'cause_unit'});
    }

    # query params
    if ( exists $args{'delay'}) {
        $query_params->{'delay'} = $self->{api_client}->to_query_value($args{'delay'});
    }

    # query params
    if ( exists $args{'duration'}) {
        $query_params->{'duration'} = $self->{api_client}->to_query_value($args{'duration'});
    }

    # query params
    if ( exists $args{'effect'}) {
        $query_params->{'effect'} = $self->{api_client}->to_query_value($args{'effect'});
    }

    # query params
    if ( exists $args{'effect_source'}) {
        $query_params->{'effectSource'} = $self->{api_client}->to_query_value($args{'effect_source'});
    }

    # query params
    if ( exists $args{'effect_unit'}) {
        $query_params->{'effectUnit'} = $self->{api_client}->to_query_value($args{'effect_unit'});
    }

    # query params
    if ( exists $args{'end_time'}) {
        $query_params->{'endTime'} = $self->{api_client}->to_query_value($args{'end_time'});
    }

    # query params
    if ( exists $args{'start_time'}) {
        $query_params->{'startTime'} = $self->{api_client}->to_query_value($args{'start_time'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Pairs]', $response);
    return $_response_object;
}

1;