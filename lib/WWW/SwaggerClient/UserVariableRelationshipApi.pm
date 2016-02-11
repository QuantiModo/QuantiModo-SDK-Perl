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
package WWW::SwaggerClient::UserVariableRelationshipApi;

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
# user_variable_relationships_get
#
# Get all UserVariableRelationships
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param int $id id (optional)
# @param string $confidence_level Our confidence that a consistent predictive relationship exists based on the amount of evidence, reproducibility, and other factors (optional)
# @param number $confidence_score A quantitative representation of our confidence that a consistent predictive relationship exists based on the amount of evidence, reproducibility, and other factors (optional)
# @param string $direction Direction is positive if higher predictor values generally precede higher outcome values. Direction is negative if higher predictor values generally precede lower outcome values. (optional)
# @param int $duration_of_action Estimated number of seconds following the onset delay in which a stimulus produces a perceivable effect (optional)
# @param string $error_message error_message (optional)
# @param int $onset_delay Estimated number of seconds that pass before a stimulus produces a perceivable effect (optional)
# @param int $outcome_variable_id Variable ID for the outcome variable (optional)
# @param int $predictor_variable_id Variable ID for the predictor variable (optional)
# @param int $predictor_unit_id ID for default unit of the predictor variable (optional)
# @param number $sinn_rank A value representative of the relevance of this predictor relative to other predictors of this outcome.  Usually used for relevancy sorting. (optional)
# @param string $strength_level Can be weak, medium, or strong based on the size of the effect which the predictor appears to have on the outcome relative to other variable relationship strength scores. (optional)
# @param number $strength_score A value represented to the size of the effect which the predictor appears to have on the outcome. (optional)
# @param int $user_id user_id (optional)
# @param string $vote vote (optional)
# @param number $value_predicting_high_outcome Value for the predictor variable (in it&#39;s default unit) which typically precedes an above average outcome value (optional)
# @param number $value_predicting_low_outcome Value for the predictor variable (in it&#39;s default unit) which typically precedes a below average outcome value (optional)
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
        data_type => 'number',
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
        data_type => 'number',
        description => 'A value representative of the relevance of this predictor relative to other predictors of this outcome.  Usually used for relevancy sorting.',
        required => '0',
    },
    'strength_level' => {
        data_type => 'string',
        description => 'Can be weak, medium, or strong based on the size of the effect which the predictor appears to have on the outcome relative to other variable relationship strength scores.',
        required => '0',
    },
    'strength_score' => {
        data_type => 'number',
        description => 'A value represented to the size of the effect which the predictor appears to have on the outcome.',
        required => '0',
    },
    'user_id' => {
        data_type => 'int',
        description => 'user_id',
        required => '0',
    },
    'vote' => {
        data_type => 'string',
        description => 'vote',
        required => '0',
    },
    'value_predicting_high_outcome' => {
        data_type => 'number',
        description => 'Value for the predictor variable (in it&#39;s default unit) which typically precedes an above average outcome value',
        required => '0',
    },
    'value_predicting_low_outcome' => {
        data_type => 'number',
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
    __PACKAGE__->method_documentation->{ user_variable_relationships_get } = { 
    	summary => 'Get all UserVariableRelationships',
        params => $params,
        returns => 'inline_response_200_8',
        };
}
# @return inline_response_200_8
#
sub user_variable_relationships_get {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/userVariableRelationships';
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
    if ( exists $args{'confidence_level'}) {
        $query_params->{'confidence_level'} = $self->{api_client}->to_query_value($args{'confidence_level'});
    }# query params
    if ( exists $args{'confidence_score'}) {
        $query_params->{'confidence_score'} = $self->{api_client}->to_query_value($args{'confidence_score'});
    }# query params
    if ( exists $args{'direction'}) {
        $query_params->{'direction'} = $self->{api_client}->to_query_value($args{'direction'});
    }# query params
    if ( exists $args{'duration_of_action'}) {
        $query_params->{'duration_of_action'} = $self->{api_client}->to_query_value($args{'duration_of_action'});
    }# query params
    if ( exists $args{'error_message'}) {
        $query_params->{'error_message'} = $self->{api_client}->to_query_value($args{'error_message'});
    }# query params
    if ( exists $args{'onset_delay'}) {
        $query_params->{'onset_delay'} = $self->{api_client}->to_query_value($args{'onset_delay'});
    }# query params
    if ( exists $args{'outcome_variable_id'}) {
        $query_params->{'outcome_variable_id'} = $self->{api_client}->to_query_value($args{'outcome_variable_id'});
    }# query params
    if ( exists $args{'predictor_variable_id'}) {
        $query_params->{'predictor_variable_id'} = $self->{api_client}->to_query_value($args{'predictor_variable_id'});
    }# query params
    if ( exists $args{'predictor_unit_id'}) {
        $query_params->{'predictor_unit_id'} = $self->{api_client}->to_query_value($args{'predictor_unit_id'});
    }# query params
    if ( exists $args{'sinn_rank'}) {
        $query_params->{'sinn_rank'} = $self->{api_client}->to_query_value($args{'sinn_rank'});
    }# query params
    if ( exists $args{'strength_level'}) {
        $query_params->{'strength_level'} = $self->{api_client}->to_query_value($args{'strength_level'});
    }# query params
    if ( exists $args{'strength_score'}) {
        $query_params->{'strength_score'} = $self->{api_client}->to_query_value($args{'strength_score'});
    }# query params
    if ( exists $args{'user_id'}) {
        $query_params->{'user_id'} = $self->{api_client}->to_query_value($args{'user_id'});
    }# query params
    if ( exists $args{'vote'}) {
        $query_params->{'vote'} = $self->{api_client}->to_query_value($args{'vote'});
    }# query params
    if ( exists $args{'value_predicting_high_outcome'}) {
        $query_params->{'value_predicting_high_outcome'} = $self->{api_client}->to_query_value($args{'value_predicting_high_outcome'});
    }# query params
    if ( exists $args{'value_predicting_low_outcome'}) {
        $query_params->{'value_predicting_low_outcome'} = $self->{api_client}->to_query_value($args{'value_predicting_low_outcome'});
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_8', $response);
    return $_response_object;
    
}

#
# user_variable_relationships_post
#
# Store UserVariableRelationship
# 
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param UserVariableRelationship $body UserVariableRelationship that should be stored (optional)
{
    my $params = {
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'body' => {
        data_type => 'UserVariableRelationship',
        description => 'UserVariableRelationship that should be stored',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ user_variable_relationships_post } = { 
    	summary => 'Store UserVariableRelationship',
        params => $params,
        returns => 'inline_response_200_29',
        };
}
# @return inline_response_200_29
#
sub user_variable_relationships_post {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/userVariableRelationships';
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_29', $response);
    return $_response_object;
    
}

#
# user_variable_relationships_id_get
#
# Get UserVariableRelationship
# 
# @param int $id id of UserVariableRelationship (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of UserVariableRelationship',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ user_variable_relationships_id_get } = { 
    	summary => 'Get UserVariableRelationship',
        params => $params,
        returns => 'inline_response_200_29',
        };
}
# @return inline_response_200_29
#
sub user_variable_relationships_id_get {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling user_variable_relationships_id_get");
    }
    

    # parse inputs
    my $_resource_path = '/userVariableRelationships/{id}';
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_29', $response);
    return $_response_object;
    
}

#
# user_variable_relationships_id_put
#
# Update UserVariableRelationship
# 
# @param int $id id of UserVariableRelationship (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
# @param UserVariableRelationship $body UserVariableRelationship that should be updated (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of UserVariableRelationship',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    'body' => {
        data_type => 'UserVariableRelationship',
        description => 'UserVariableRelationship that should be updated',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ user_variable_relationships_id_put } = { 
    	summary => 'Update UserVariableRelationship',
        params => $params,
        returns => 'inline_response_200_2',
        };
}
# @return inline_response_200_2
#
sub user_variable_relationships_id_put {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling user_variable_relationships_id_put");
    }
    

    # parse inputs
    my $_resource_path = '/userVariableRelationships/{id}';
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
# user_variable_relationships_id_delete
#
# Delete UserVariableRelationship
# 
# @param int $id id of UserVariableRelationship (required)
# @param string $access_token User&#39;s OAuth2 access token (optional)
{
    my $params = {
    'id' => {
        data_type => 'int',
        description => 'id of UserVariableRelationship',
        required => '1',
    },
    'access_token' => {
        data_type => 'string',
        description => 'User&#39;s OAuth2 access token',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ user_variable_relationships_id_delete } = { 
    	summary => 'Delete UserVariableRelationship',
        params => $params,
        returns => 'inline_response_200_2',
        };
}
# @return inline_response_200_2
#
sub user_variable_relationships_id_delete {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling user_variable_relationships_id_delete");
    }
    

    # parse inputs
    my $_resource_path = '/userVariableRelationships/{id}';
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
