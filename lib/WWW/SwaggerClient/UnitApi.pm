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
package WWW::SwaggerClient::UnitApi;

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
# units_get
#
# Get all Units
# 
# @param string $client_id client_id (optional)
# @param string $name name (optional)
# @param string $abbreviated_name abbreviated_name (optional)
# @param boolean $category_id category_id (optional)
# @param number $minimum_value minimum_value (optional)
# @param number $maximum_value maximum_value (optional)
# @param int $updated updated (optional)
# @param number $multiply multiply (optional)
# @param number $add add (optional)
# @param string $created_at created_at (optional)
# @param string $updated_at updated_at (optional)
# @param int $limit limit (optional)
# @param int $offset offset (optional)
# @param string $sort sort (optional)
# @return inline_response_200_17
#
sub units_get {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/units';
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
        $query_params->{'client_id'} = $self->{api_client}->to_query_value($args{'client_id'});
    }# query params
    if ( exists $args{'name'}) {
        $query_params->{'name'} = $self->{api_client}->to_query_value($args{'name'});
    }# query params
    if ( exists $args{'abbreviated_name'}) {
        $query_params->{'abbreviated_name'} = $self->{api_client}->to_query_value($args{'abbreviated_name'});
    }# query params
    if ( exists $args{'category_id'}) {
        $query_params->{'category_id'} = $self->{api_client}->to_query_value($args{'category_id'});
    }# query params
    if ( exists $args{'minimum_value'}) {
        $query_params->{'minimum_value'} = $self->{api_client}->to_query_value($args{'minimum_value'});
    }# query params
    if ( exists $args{'maximum_value'}) {
        $query_params->{'maximum_value'} = $self->{api_client}->to_query_value($args{'maximum_value'});
    }# query params
    if ( exists $args{'updated'}) {
        $query_params->{'updated'} = $self->{api_client}->to_query_value($args{'updated'});
    }# query params
    if ( exists $args{'multiply'}) {
        $query_params->{'multiply'} = $self->{api_client}->to_query_value($args{'multiply'});
    }# query params
    if ( exists $args{'add'}) {
        $query_params->{'add'} = $self->{api_client}->to_query_value($args{'add'});
    }# query params
    if ( exists $args{'created_at'}) {
        $query_params->{'created_at'} = $self->{api_client}->to_query_value($args{'created_at'});
    }# query params
    if ( exists $args{'updated_at'}) {
        $query_params->{'updated_at'} = $self->{api_client}->to_query_value($args{'updated_at'});
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_17', $response);
    return $_response_object;
    
}
#
# units_post
#
# Store Unit
# 
# @param Unit $body Unit that should be stored (optional)
# @return inline_response_200_18
#
sub units_post {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/units';
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_18', $response);
    return $_response_object;
    
}
#
# units_id_get
#
# Get Unit
# 
# @param int $id id of Unit (required)
# @return inline_response_200_18
#
sub units_id_get {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling units_id_get");
    }
    

    # parse inputs
    my $_resource_path = '/units/{id}';
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
    my $_response_object = $self->{api_client}->deserialize('inline_response_200_18', $response);
    return $_response_object;
    
}
#
# units_id_put
#
# Update Unit
# 
# @param int $id id of Unit (required)
# @param Unit $body Unit that should be updated (optional)
# @return inline_response_200_2
#
sub units_id_put {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling units_id_put");
    }
    

    # parse inputs
    my $_resource_path = '/units/{id}';
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
# units_id_delete
#
# Delete Unit
# 
# @param int $id id of Unit (required)
# @return inline_response_200_2
#
sub units_id_delete {
    my ($self, %args) = @_;

    
    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling units_id_delete");
    }
    

    # parse inputs
    my $_resource_path = '/units/{id}';
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
