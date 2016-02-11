#
# Copyright 2016 SmartBear Software
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
#
package WWW::SwaggerClient::VariableApi;

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
# variables_get
#
# Get all Variables
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param int $id id (optional)
# @param string $client_id The ID of the client application which last created or updated this common variable (optional)
# @param int $parent_id ID of the parent variable if this variable has any parent (optional)
# @param string $name User-defined variable display name (optional)
# @param int $variable_category_id Variable category ID (optional)
# @param int $default_unit_id ID of the default unit for the variable (optional)
# @param string $combination_operation How to combine values of this variable (for instance, to see a summary of the values over a month) SUM or MEAN (optional)
# @param number $filling_value Value for replacing null measurements (optional)
# @param number $maximum_allowed_value Maximum reasonable value for this variable (uses default unit) (optional)
# @param number $minimum_allowed_value Minimum reasonable value for this variable (uses default unit) (optional)
# @param int $onset_delay Estimated number of seconds that pass before a stimulus produces a perceivable effect (optional)
# @param int $duration_of_action Estimated number of seconds following the onset delay in which a stimulus produces a perceivable effect (optional)
# @param int $public Is variable public (optional)
# @param boolean $cause_only A value of 1 indicates that this variable is generally a cause in a causal relationship.  An example of a causeOnly variable would be a variable such as Cloud Cover which would generally not be influenced by the behaviour of the user (optional)
# @param number $most_common_value Most common value (optional)
# @param int $most_common_unit_id Most common Unit (optional)
# @param number $standard_deviation Standard Deviation (optional)
# @param number $variance Average variance for this variable based on all user data (optional)
# @param number $mean Mean for this variable based on all user data (optional)
# @param number $median Median for this variable based on all user data (optional)
# @param number $number_of_measurements Number of measurements for this variable based on all user data (optional)
# @param number $number_of_unique_values Number of unique values for this variable based on all user data (optional)
# @param number $skewness Skewness for this variable based on all user data (optional)
# @param number $kurtosis Kurtosis for this variable based on all user data (optional)
# @param string $status status (optional)
# @param string $error_message error_message (optional)
# @param string $last_successful_update_time When this variable or its settings were last updated (optional)
# @param string $created_at When the record was first created. Use ISO 8601 datetime format (optional)
# @param string $updated_at When the record was last updated. Use ISO 8601 datetime format (optional)
# @param string $product_url Product URL (optional)
# @param string $image_url Image URL (optional)
# @param number $price Price (optional)
# @param int $number_of_user_variables Number of users who have data for this variable (optional)
# @param boolean $outcome Outcome variables (those with `outcome` == 1) are variables for which a human would generally want to identify the influencing factors.  These include symptoms of illness, physique, mood, cognitive performance, etc.  Generally correlation calculations are only performed on outcome variables. (optional)
# @param number $minimum_recorded_value Minimum recorded value of this variable based on all user data (optional)
# @param number $maximum_recorded_value Maximum recorded value of this variable based on all user data (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. (optional)
# @param int $offset OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. (optional)
# @param string $sort Sort records by a given field name. If the field name is prefixed with &#39;-&#39;, it will sort in descending order. (optional)
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
    'client_id' => {
        data_type => 'string',
        description => 'The ID of the client application which last created or updated this common variable',
        required => '0',
    },
    'parent_id' => {
        data_type => 'int',
        description => 'ID of the parent variable if this variable has any parent',
        required => '0',
    },
    'name' => {
        data_type => 'string',
        description => 'User-defined variable display name',
        required => '0',
    },
    'variable_category_id' => {
        data_type => 'int',
        description => 'Variable category ID',
        required => '0',
    },
    'default_unit_id' => {
        data_type => 'int',
        description => 'ID of the default unit for the variable',
        required => '0',
    },
    'combination_operation' => {
        data_type => 'string',
        description => 'How to combine values of this variable (for instance, to see a summary of the values over a month) SUM or MEAN',
        required => '0',
    },
    'filling_value' => {
        data_type => 'number',
        description => 'Value for replacing null measurements',
        required => '0',
    },
    'maximum_allowed_value' => {
        data_type => 'number',
        description => 'Maximum reasonable value for this variable (uses default unit)',
        required => '0',
    },
    'minimum_allowed_value' => {
        data_type => 'number',
        description => 'Minimum reasonable value for this variable (uses default unit)',
        required => '0',
    },
    'onset_delay' => {
        data_type => 'int',
        description => 'Estimated number of seconds that pass before a stimulus produces a perceivable effect',
        required => '0',
    },
    'duration_of_action' => {
        data_type => 'int',
        description => 'Estimated number of seconds following the onset delay in which a stimulus produces a perceivable effect',
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
    'most_common_value' => {
        data_type => 'number',
        description => 'Most common value',
        required => '0',
    },
    'most_common_unit_id' => {
        data_type => 'int',
        description => 'Most common Unit',
        required => '0',
    },
    'standard_deviation' => {
        data_type => 'number',
        description => 'Standard Deviation',
        required => '0',
    },
    'variance' => {
        data_type => 'number',
        description => 'Average variance for this variable based on all user data',
        required => '0',
    },
    'mean' => {
        data_type => 'number',
        description => 'Mean for this variable based on all user data',
        required => '0',
    },
    'median' => {
        data_type => 'number',
        description => 'Median for this variable based on all user data',
        required => '0',
    },
    'number_of_measurements' => {
        data_type => 'number',
        description => 'Number of measurements for this variable based on all user data',
        required => '0',
    },
    'number_of_unique_values' => {
        data_type => 'number',
        description => 'Number of unique values for this variable based on all user data',
        required => '0',
    },
    'skewness' => {
        data_type => 'number',
        description => 'Skewness for this variable based on all user data',
        required => '0',
    },
    'kurtosis' => {
        data_type => 'number',
        description => 'Kurtosis for this variable based on all user data',
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
    'created_at' => {
        data_type => 'string',
        description => 'When the record was first created. Use ISO 8601 datetime format',
        required => '0',
    },
    'updated_at' => {
        data_type => 'string',
        description => 'When the record was last updated. Use ISO 8601 datetime format',
        required => '0',
    },
    'product_url' => {
        data_type => 'string',
        description => 'Product URL',
        required => '0',
    },
    'image_url' => {
        data_type => 'string',
        description => 'Image URL',
        required => '0',
    },
    'price' => {
        data_type => 'number',
        description => 'Price',
        required => '0',
    },
    'number_of_user_variables' => {
        data_type => 'int',
        description => 'Number of users who have data for this variable',
        required => '0',
    },
    'outcome' => {
        data_type => 'boolean',
        description => 'Outcome variables (those with `outcome` == 1) are variables for which a human would generally want to identify the influencing factors.  These include symptoms of illness, physique, mood, cognitive performance, etc.  Generally correlation calculations are only performed on outcome variables.',
        required => '0',
    },
    'minimum_recorded_value' => {
        data_type => 'number',
        description => 'Minimum recorded value of this variable based on all user data',
        required => '0',
    },
    'maximum_recorded_value' => {
        data_type => 'number',
        description => 'Maximum recorded value of this variable based on all user data',
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
        description => 'Sort records by a given field name. If the field name is prefixed with &#39;-&#39;, it will sort in descending order.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ variables_get } = { 
    	summary => 'Get all Variables',
        params => $params,
        returns => 'inline_response_200_34',
        };
}
# @return inline_response_200_34
#
sub variables_get {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/variables';
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
    }# query params
    if ( exists $args{'id'}) {
        $query_params->{'id'} = $self->{api_client}->to_query_value($args{'id'});
    }# query params
    if ( exists $args{'client_id'}) {
        $query_params->{'client_id'} = $self->{api_client}->to_query_value($args{'client_id'});
    }# query params
    if ( exists $args{'parent_id'}) {
        $query_params->{'parent_id'} = $self->{api_client}->to_query_value($args{'parent_id'});
    }# query params
    if ( exists $args{'name'}) {
        $query_params->{'name'} = $self->{api_client}->to_query_value($args{'name'});
    }# query params
    if ( exists $args{'variable_category_id'}) {
        $query_params->{'variable_category_id'} = $self->{api_client}->to_query_value($args{'variable_category_id'});
    }# query params
    if ( exists $args{'default_unit_id'}) {
        $query_params->{'default_unit_id'} = $self->{api_client}->to_query_value($args{'default_unit_id'});
    }# query params
    if ( exists $args{'combination_operation'}) {
        $query_params->{'combination_operation'} = $self->{api_client}->to_query_value($args{'combination_operation'});
    }# query params
    if ( exists $args{'filling_value'}) {
        $query_params->{'filling_value'} = $self->{api_client}->to_query_value($args{'filling_value'});
    }# query params
    if ( exists $args{'maximum_allowed_value'}) {
        $query_params->{'maximum_allowed_value'} = $self->{api_client}->to_query_value($args{'maximum_allowed_value'});
    }# query params
    if ( exists $args{'minimum_allowed_value'}) {
        $query_params->{'minimum_allowed_value'} = $self->{api_client}->to_query_value($args{'minimum_allowed_value'});
    }# query params
    if ( exists $args{'onset_delay'}) {
        $query_params->{'onset_delay'} = $self->{api_client}->to_query_value($args{'onset_delay'});
    }# query params
    if ( exists $args{'duration_of_action'}) {
        $query_params->{'duration_of_action'} = $self->{api_client}->to_query_value($args{'duration_of_action'});
    }# query params
    if ( exists $args{'public'}) {
        $query_params->{'public'} = $self->{api_client}->to_query_value($args{'public'});
    }# query params
    if ( exists $args{'cause_only'}) {
        $query_params->{'cause_only'} = $self->{api_client}->to_query_value($args{'cause_only'});
    }# query params
    if ( exists $args{'most_common_value'}) {
        $query_params->{'most_common_value'} = $self->{api_client}->to_query_value($args{'most_common_value'});
    }# query params
    if ( exists $args{'most_common_unit_id'}) {
        $query_params->{'most_common_unit_id'} = $self->{api_client}->to_query_value($args{'most_common_unit_id'});
    }# query params
    if ( exists $args{'standard_deviation'}) {
        $query_params->{'standard_deviation'} = $self->{api_client}->to_query_value($args{'standard_deviation'});
    }# query params
    if ( exists $args{'variance'}) {
        $query_params->{'variance'} = $self->{api_client}->to_query_value($args{'variance'});
    }# query params
    if ( exists $args{'mean'}) {
        $query_params->{'mean'} = $self->{api_client}->to_query_value($args{'mean'});
    }# query params
    if ( exists $args{'median'}) {
        $query_params->{'median'} = $self->{api_client}->to_query_value($args{'median'});
    }# query params
    if ( exists $args{'number_of_measurements'}) {
        $query_params->{'number_of_measurements'} = $self->{api_client}->to_query_value($args{'number_of_measurements'});
    }# query params
    if ( exists $args{'number_of_unique_values'}) {
        $query_params->{'number_of_unique_values'} = $self->{api_client}->to_query_value($args{'number_of_unique_values'});
    }# query params
    if ( exists $args{'skewness'}) {
        $query_params->{'skewness'} = $self->{api_client}->to_query_value($args{'skewness'});
    }# query params
    if ( exists $args{'kurtosis'}) {
        $query_params->{'kurtosis'} = $self->{api_client}->to_query_value($args{'kurtosis'});
    }# query params
    if ( exists $args{'status'}) {
        $query_params->{'status'} = $self->{api_client}->to_query_value($args{'status'});
    }# query params
    if ( exists $args{'error_message'}) {
        $query_params->{'error_message'} = $self->{api_client}->to_query_value($args{'error_message'});
    }# query params
    if ( exists $args{'last_successful_update_time'}) {
        $query_params->{'last_successful_update_time'} = $self->{api_client}->to_query_value($args{'last_successful_update_time'});
    }# query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }# query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
    }# query params
    if ( exists $args{'product_url'}) {
        $query_params->{'product_url'} = $self->{api_client}->to_query_value($args{'product_url'});
    }# query params
    if ( exists $args{'image_url'}) {
        $query_params->{'image_url'} = $self->{api_client}->to_query_value($args{'image_url'});
    }# query params
    if ( exists $args{'price'}) {
        $query_params->{'price'} = $self->{api_client}->to_query_value($args{'price'});
    }# query params
    if ( exists $args{'number_of_user_variables'}) {
        $query_params->{'number_of_user_variables'} = $self->{api_client}->to_query_value($args{'number_of_user_variables'});
    }# query params
    if ( exists $args{'outcome'}) {
        $query_params->{'outcome'} = $self->{api_client}->to_query_value($args{'outcome'});
    }# query params
    if ( exists $args{'minimum_recorded_value'}) {
        $query_params->{'minimum_recorded_value'} = $self->{api_client}->to_query_value($args{'minimum_recorded_value'});
    }# query params
    if ( exists $args{'maximum_recorded_value'}) {
        $query_params->{'maximum_recorded_value'} = $self->{api_client}->to_query_value($args{'maximum_recorded_value'});
    }# query params
    if ( exists $args{'limit'}) {
        $query_params->{'limit'} = $self->{api_client}->to_query_value($args{'limit'});
    }# query params
    if ( exists $args{'offset'}) {
        $query_params->{'offset'} = $self->{api_client}->to_query_value($args{'offset'});
    }# query params
    if ( exists $args{'sort'}) {
        $query_params->{'sort'} = $self->{api_client}->to_query_value($args{'sort'});
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_34', $response);
    return $_response_object;
    
}

#
# variables_post
#
# Store Variable
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param Variable $body Variable that should be stored (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'body' => {
        data_type => 'Variable',
        description => 'Variable that should be stored',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ variables_post } = { 
    	summary => 'Store Variable',
        params => $params,
        returns => 'inline_response_200_35',
        };
}
# @return inline_response_200_35
#
sub variables_post {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/variables';
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
    my $auth_settings = [qw(quantimodo_oauth2 )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_35', $response);
    return $_response_object;
    
}

#
# variables_id_get
#
# Get Variable
# 
# @param int $id id of Variable (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of Variable',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ variables_id_get } = { 
    	summary => 'Get Variable',
        params => $params,
        returns => 'inline_response_200_35',
        };
}
# @return inline_response_200_35
#
sub variables_id_get {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling variables_id_get");
    }
    

    # parse inputs
    my $_resource_path = '/variables/{id}';
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_35', $response);
    return $_response_object;
    
}

#
# variables_id_put
#
# Update Variable
# 
# @param int $id id of Variable (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param Variable $body Variable that should be updated (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of Variable',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'body' => {
        data_type => 'Variable',
        description => 'Variable that should be updated',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ variables_id_put } = { 
    	summary => 'Update Variable',
        params => $params,
        returns => 'inline_response_200_2',
        };
}
# @return inline_response_200_2
#
sub variables_id_put {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling variables_id_put");
    }
    

    # parse inputs
    my $_resource_path = '/variables/{id}';
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_2', $response);
    return $_response_object;
    
}

#
# variables_id_delete
#
# Delete Variable
# 
# @param int $id id of Variable (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of Variable',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ variables_id_delete } = { 
    	summary => 'Delete Variable',
        params => $params,
        returns => 'inline_response_200_2',
        };
}
# @return inline_response_200_2
#
sub variables_id_delete {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling variables_id_delete");
    }
    

    # parse inputs
    my $_resource_path = '/variables/{id}';
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_2', $response);
    return $_response_object;
    
}


1;
