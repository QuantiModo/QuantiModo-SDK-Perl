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
package WWW::SwaggerClient::MeasurementsApi;

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
# v1_measurement_sources_get
#
# Get measurement sources
# 
# @return MeasurementSource
#
sub v1_measurement_sources_get {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/v1/measurementSources';
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
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    
    
    
    
    my $_body_data;
    

    # authentication setting, if any
    my $auth_settings = ['oauth2'];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('MeasurementSource', $response);
    return $_response_object;
    
}
#
# v1_measurement_sources_post
#
# Add a data source
# 
# @param MeasurementSource $name An array of names of data sources you want to add. (required)
# @return void
#
sub v1_measurement_sources_post {
    my ($self, %args) = @_;

    
    # verify the required parameter 'name' is set
    unless (exists $args{'name'}) {
      croak("Missing the required parameter 'name' when calling v1_measurement_sources_post");
    }
    

    # parse inputs
    my $_resource_path = '/v1/measurementSources';
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
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    
    
    
    
    my $_body_data;
    # body params
    if ( exists $args{'name'}) {
        $_body_data = $args{'name'};
    }

    # authentication setting, if any
    my $auth_settings = ['oauth2'];

    # make the API Call
    
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
    
}
#
# v1_measurements_get
#
# Get measurements for this user
# 
# @param string $variable_name Name of the variable you want measurements for (optional)
# @param string $source Name of the source you want measurements for (supports exact name match only) (optional)
# @param string $value Value of measurement (optional)
# @param string $last_updated The time that this measurement was created or last updated in the UTC format \&quot;YYYY-MM-DDThh:mm:ss\&quot; (optional)
# @param string $unit The unit you want the measurements in (optional)
# @param string $start_time The lower limit of measurements returned (Epoch) (optional)
# @param string $end_time The upper limit of measurements returned (Epoch) (optional)
# @param int $grouping_width The time (in seconds) over which measurements are grouped together (optional)
# @param string $grouping_timezone The time (in seconds) over which measurements are grouped together (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. (optional)
# @param int $offset Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. (optional)
# @param int $sort Sort by given field. If the field is prefixed with `-, it will sort in descending order. (optional)
# @return Measurement
#
sub v1_measurements_get {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/v1/measurements';
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
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'variable_name'}) {
        $query_params->{'variableName'} = $self->{api_client}->to_query_value($args{'variable_name'});
    }# query params
    if ( exists $args{'source'}) {
        $query_params->{'source'} = $self->{api_client}->to_query_value($args{'source'});
    }# query params
    if ( exists $args{'value'}) {
        $query_params->{'value'} = $self->{api_client}->to_query_value($args{'value'});
    }# query params
    if ( exists $args{'last_updated'}) {
        $query_params->{'lastUpdated'} = $self->{api_client}->to_query_value($args{'last_updated'});
    }# query params
    if ( exists $args{'unit'}) {
        $query_params->{'unit'} = $self->{api_client}->to_query_value($args{'unit'});
    }# query params
    if ( exists $args{'start_time'}) {
        $query_params->{'startTime'} = $self->{api_client}->to_query_value($args{'start_time'});
    }# query params
    if ( exists $args{'end_time'}) {
        $query_params->{'endTime'} = $self->{api_client}->to_query_value($args{'end_time'});
    }# query params
    if ( exists $args{'grouping_width'}) {
        $query_params->{'groupingWidth'} = $self->{api_client}->to_query_value($args{'grouping_width'});
    }# query params
    if ( exists $args{'grouping_timezone'}) {
        $query_params->{'groupingTimezone'} = $self->{api_client}->to_query_value($args{'grouping_timezone'});
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
    my $auth_settings = ['oauth2'];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Measurement', $response);
    return $_response_object;
    
}
#
# v1_measurements_post
#
# Post a new set or update existing measurements to the database
# 
# @param MeasurementSet $measurements An array of measurements you want to insert. (required)
# @return void
#
sub v1_measurements_post {
    my ($self, %args) = @_;

    
    # verify the required parameter 'measurements' is set
    unless (exists $args{'measurements'}) {
      croak("Missing the required parameter 'measurements' when calling v1_measurements_post");
    }
    

    # parse inputs
    my $_resource_path = '/v1/measurements';
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
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    
    
    
    
    my $_body_data;
    # body params
    if ( exists $args{'measurements'}) {
        $_body_data = $args{'measurements'};
    }

    # authentication setting, if any
    my $auth_settings = ['oauth2'];

    # make the API Call
    
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
    
}
#
# v1_measurements_daily_get
#
# Get daily measurements for this user
# 
# @param string $variable_name Name of the variable you want measurements for (required)
# @param string $abbreviated_unit_name The unit your want the measurements in (optional)
# @param string $start_time The lower limit of measurements returned (Iso8601) (optional)
# @param string $end_time The upper limit of measurements returned (Iso8601) (optional)
# @param int $grouping_width The time (in seconds) over which measurements are grouped together (optional)
# @param string $grouping_timezone The time (in seconds) over which measurements are grouped together (optional)
# @param int $limit The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. (optional)
# @param int $offset Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. (optional)
# @param int $sort Sort by given field. If the field is prefixed with `-, it will sort in descending order. (optional)
# @return Measurement
#
sub v1_measurements_daily_get {
    my ($self, %args) = @_;

    
    # verify the required parameter 'variable_name' is set
    unless (exists $args{'variable_name'}) {
      croak("Missing the required parameter 'variable_name' when calling v1_measurements_daily_get");
    }
    

    # parse inputs
    my $_resource_path = '/v1/measurements/daily';
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
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'variable_name'}) {
        $query_params->{'variableName'} = $self->{api_client}->to_query_value($args{'variable_name'});
    }# query params
    if ( exists $args{'abbreviated_unit_name'}) {
        $query_params->{'abbreviatedUnitName'} = $self->{api_client}->to_query_value($args{'abbreviated_unit_name'});
    }# query params
    if ( exists $args{'start_time'}) {
        $query_params->{'startTime'} = $self->{api_client}->to_query_value($args{'start_time'});
    }# query params
    if ( exists $args{'end_time'}) {
        $query_params->{'endTime'} = $self->{api_client}->to_query_value($args{'end_time'});
    }# query params
    if ( exists $args{'grouping_width'}) {
        $query_params->{'groupingWidth'} = $self->{api_client}->to_query_value($args{'grouping_width'});
    }# query params
    if ( exists $args{'grouping_timezone'}) {
        $query_params->{'groupingTimezone'} = $self->{api_client}->to_query_value($args{'grouping_timezone'});
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
    my $auth_settings = ['oauth2'];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Measurement', $response);
    return $_response_object;
    
}
#
# v1_measurements_range_get
#
# Get measurements range for this user
# 
# @param string $sources Enter source name to limit to specific source (varchar) (optional)
# @param int $user If not specified, uses currently logged in user (bigint) (optional)
# @return MeasurementRange
#
sub v1_measurements_range_get {
    my ($self, %args) = @_;

    

    # parse inputs
    my $_resource_path = '/v1/measurementsRange';
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
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'sources'}) {
        $query_params->{'sources'} = $self->{api_client}->to_query_value($args{'sources'});
    }# query params
    if ( exists $args{'user'}) {
        $query_params->{'user'} = $self->{api_client}->to_query_value($args{'user'});
    }
    
    
    
    my $_body_data;
    

    # authentication setting, if any
    my $auth_settings = ['oauth2'];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('MeasurementRange', $response);
    return $_response_object;
    
}


1;
