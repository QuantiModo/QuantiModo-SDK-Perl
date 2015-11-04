#
# Copyright 2015 SmartBear Software
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
package WWW::SwaggerClient::MeasurementApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use WWW::SwaggerClient::ApiClient;
use WWW::SwaggerClient::Configuration;

sub new {
    my $class   = shift;
    my $default_api_client = $WWW::SwaggerClient::Configuration::api_client ? $WWW::SwaggerClient::Configuration::api_client  : WWW::SwaggerClient::ApiClient->new;
    my (%self) = (
        'api_client' => $default_api_client,
        @_
    );

    #my $self = {
    #    #api_client => $options->{api_client}
    #    api_client => $default_api_client
    #}; 

    bless \%self, $class;

}

#
# measurements_get
#
# Get all Measurements
# 
# @param int $user_id user_id (optional)
# @param string $client_id client_id (optional)
# @param int $connector_id connector_id (optional)
# @param int $variable_id variable_id (optional)
# @param int $start_time start_time (optional)
# @param number $value value (optional)
# @param number $original_value original_value (optional)
# @param int $duration duration (optional)
# @param string $note note (optional)
# @param number $latitude latitude (optional)
# @param number $longitude longitude (optional)
# @param string $location location (optional)
# @param string $created_at created_at (optional)
# @param string $updated_at updated_at (optional)
# @param string $error error (optional)
# @param int $limit limit (optional)
# @param int $offset offset (optional)
# @param string $sort sort (optional)
# @return inline_response_200_11
#
sub measurements_get {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/measurements';
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
    if ( exists $args{'user_id'}) {
        $query_params->{'user_id'} = $self->{api_client}->to_query_value($args{'user_id'});
    }# query params
    if ( exists $args{'client_id'}) {
        $query_params->{'client_id'} = $self->{api_client}->to_query_value($args{'client_id'});
    }# query params
    if ( exists $args{'connector_id'}) {
        $query_params->{'connector_id'} = $self->{api_client}->to_query_value($args{'connector_id'});
    }# query params
    if ( exists $args{'variable_id'}) {
        $query_params->{'variable_id'} = $self->{api_client}->to_query_value($args{'variable_id'});
    }# query params
    if ( exists $args{'start_time'}) {
        $query_params->{'start_time'} = $self->{api_client}->to_query_value($args{'start_time'});
    }# query params
    if ( exists $args{'value'}) {
        $query_params->{'value'} = $self->{api_client}->to_query_value($args{'value'});
    }# query params
    if ( exists $args{'original_value'}) {
        $query_params->{'original_value'} = $self->{api_client}->to_query_value($args{'original_value'});
    }# query params
    if ( exists $args{'duration'}) {
        $query_params->{'duration'} = $self->{api_client}->to_query_value($args{'duration'});
    }# query params
    if ( exists $args{'note'}) {
        $query_params->{'note'} = $self->{api_client}->to_query_value($args{'note'});
    }# query params
    if ( exists $args{'latitude'}) {
        $query_params->{'latitude'} = $self->{api_client}->to_query_value($args{'latitude'});
    }# query params
    if ( exists $args{'longitude'}) {
        $query_params->{'longitude'} = $self->{api_client}->to_query_value($args{'longitude'});
    }# query params
    if ( exists $args{'location'}) {
        $query_params->{'location'} = $self->{api_client}->to_query_value($args{'location'});
    }# query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }# query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
    }# query params
    if ( exists $args{'error'}) {
        $query_params->{'error'} = $self->{api_client}->to_query_value($args{'error'});
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
    my $auth_settings = [];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_11', $response);
    return $_response_object;
    
}
#
# measurements_post
#
# Store Measurement
# 
# @param MeasurementPost $body Measurement that should be stored (optional)
# @return inline_response_200_11
#
sub measurements_post {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/measurements';
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
    my $auth_settings = [];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_11', $response);
    return $_response_object;
    
}
#
# measurements_csv_get
#
# Get Measurements CSV
# 
# @return file
#
sub measurements_csv_get {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/measurements/csv';
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

    
    
    
    
    my $_body_data;
    

    # authentication setting, if any
    my $auth_settings = [];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('file', $response);
    return $_response_object;
    
}
#
# measurements_request_csv_post
#
# Post Request for Measurements CSV
# 
# @return int
#
sub measurements_request_csv_post {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/measurements/request_csv';
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
    

    # authentication setting, if any
    my $auth_settings = [];

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
# measurements_id_get
#
# Get Measurement
# 
# @param int $id id of Measurement (required)
# @return inline_response_200_12
#
sub measurements_id_get {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling measurements_id_get");
    }
    

    # parse inputs
    my $_resource_path = '/measurements/{id}';
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
    if ( exists $args{'id'}) {
        my $_base_variable = "{" . "id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }
    
    my $_body_data;
    

    # authentication setting, if any
    my $auth_settings = [];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_12', $response);
    return $_response_object;
    
}
#
# measurements_id_put
#
# Update Measurement
# 
# @param int $id id of Measurement (required)
# @param Measurement $body Measurement that should be updated (optional)
# @return inline_response_200_2
#
sub measurements_id_put {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling measurements_id_put");
    }
    

    # parse inputs
    my $_resource_path = '/measurements/{id}';
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
    my $auth_settings = [];

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
# measurements_id_delete
#
# Delete Measurement
# 
# @param int $id id of Measurement (required)
# @return inline_response_200_2
#
sub measurements_id_delete {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling measurements_id_delete");
    }
    

    # parse inputs
    my $_resource_path = '/measurements/{id}';
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

    
    
    # path params
    if ( exists $args{'id'}) {
        my $_base_variable = "{" . "id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }
    
    my $_body_data;
    

    # authentication setting, if any
    my $auth_settings = [];

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
