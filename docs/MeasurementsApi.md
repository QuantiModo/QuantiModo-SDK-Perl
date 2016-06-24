# WWW::SwaggerClient::MeasurementsApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::MeasurementsApi;
```

All URIs are relative to *https://app.quantimo.do/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1_measurement_sources_get**](MeasurementsApi.md#v1_measurement_sources_get) | **GET** /v1/measurementSources | Get measurement sources
[**v1_measurement_sources_post**](MeasurementsApi.md#v1_measurement_sources_post) | **POST** /v1/measurementSources | Add a data source
[**v1_measurements_daily_get**](MeasurementsApi.md#v1_measurements_daily_get) | **GET** /v1/measurements/daily | Get daily measurements for this user
[**v1_measurements_delete_post**](MeasurementsApi.md#v1_measurements_delete_post) | **POST** /v1/measurements/delete | Delete a measurement
[**v1_measurements_get**](MeasurementsApi.md#v1_measurements_get) | **GET** /v1/measurements | Get measurements for this user
[**v1_measurements_post**](MeasurementsApi.md#v1_measurements_post) | **POST** /v1/measurements | Post a new set or update existing measurements to the database
[**v1_measurements_range_get**](MeasurementsApi.md#v1_measurements_range_get) | **GET** /v1/measurementsRange | Get measurements range for this user
[**v2_measurements_csv_get**](MeasurementsApi.md#v2_measurements_csv_get) | **GET** /v2/measurements/csv | Get Measurements CSV
[**v2_measurements_id_delete**](MeasurementsApi.md#v2_measurements_id_delete) | **DELETE** /v2/measurements/{id} | Delete Measurement
[**v2_measurements_id_get**](MeasurementsApi.md#v2_measurements_id_get) | **GET** /v2/measurements/{id} | Get Measurement
[**v2_measurements_id_put**](MeasurementsApi.md#v2_measurements_id_put) | **PUT** /v2/measurements/{id} | Update Measurement
[**v2_measurements_request_csv_post**](MeasurementsApi.md#v2_measurements_request_csv_post) | **POST** /v2/measurements/request_csv | Post Request for Measurements CSV
[**v2_measurements_request_pdf_post**](MeasurementsApi.md#v2_measurements_request_pdf_post) | **POST** /v2/measurements/request_pdf | Post Request for Measurements PDF
[**v2_measurements_request_xls_post**](MeasurementsApi.md#v2_measurements_request_xls_post) | **POST** /v2/measurements/request_xls | Post Request for Measurements XLS


# **v1_measurement_sources_get**
> MeasurementSource v1_measurement_sources_get()

Get measurement sources

Returns a list of all the apps from which measurement data is obtained.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();

eval { 
    my $result = $api_instance->v1_measurement_sources_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v1_measurement_sources_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MeasurementSource**](MeasurementSource.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_measurement_sources_post**
> v1_measurement_sources_post(body => $body, access_token => $access_token)

Add a data source

Add a life-tracking app or device to the QuantiModo list of data sources.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $body = WWW::SwaggerClient::Object::MeasurementSource->new(); # MeasurementSource | An array of names of data sources you want to add.
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    $api_instance->v1_measurement_sources_post(body => $body, access_token => $access_token);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v1_measurement_sources_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**MeasurementSource**](MeasurementSource.md)| An array of names of data sources you want to add. | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_measurements_daily_get**
> Measurement v1_measurements_daily_get(variable_name => $variable_name, access_token => $access_token, abbreviated_unit_name => $abbreviated_unit_name, start_time => $start_time, end_time => $end_time, grouping_width => $grouping_width, grouping_timezone => $grouping_timezone, limit => $limit, offset => $offset, sort => $sort)

Get daily measurements for this user

Measurements are any value that can be recorded like daily steps, a mood rating, or apples eaten. <br>Supported filter parameters:<br><ul><li><b>value</b> - Value of measurement</li><li><b>lastUpdated</b> - The time that this measurement was created or last updated in the UTC format \"YYYY-MM-DDThh:mm:ss\"</li></ul><br>

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $variable_name = 'variable_name_example'; # string | Name of the variable you want measurements for
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $abbreviated_unit_name = 'abbreviated_unit_name_example'; # string | The unit your want the measurements in
my $start_time = 'start_time_example'; # string | The lower limit of measurements returned (Iso8601)
my $end_time = 'end_time_example'; # string | The upper limit of measurements returned (Iso8601)
my $grouping_width = 56; # int | The time (in seconds) over which measurements are grouped together
my $grouping_timezone = 'grouping_timezone_example'; # string | The time (in seconds) over which measurements are grouped together
my $limit = 56; # int | The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0.
my $offset = 56; # int | Now suppose you wanted to show results 11-20. You'd set the offset to 10 and the limit to 10.
my $sort = 56; # int | Sort by given field. If the field is prefixed with `-, it will sort in descending order.

eval { 
    my $result = $api_instance->v1_measurements_daily_get(variable_name => $variable_name, access_token => $access_token, abbreviated_unit_name => $abbreviated_unit_name, start_time => $start_time, end_time => $end_time, grouping_width => $grouping_width, grouping_timezone => $grouping_timezone, limit => $limit, offset => $offset, sort => $sort);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v1_measurements_daily_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **variable_name** | **string**| Name of the variable you want measurements for | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **abbreviated_unit_name** | **string**| The unit your want the measurements in | [optional] 
 **start_time** | **string**| The lower limit of measurements returned (Iso8601) | [optional] 
 **end_time** | **string**| The upper limit of measurements returned (Iso8601) | [optional] 
 **grouping_width** | **int**| The time (in seconds) over which measurements are grouped together | [optional] 
 **grouping_timezone** | **string**| The time (in seconds) over which measurements are grouped together | [optional] 
 **limit** | **int**| The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. | [optional] 
 **offset** | **int**| Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. | [optional] 
 **sort** | **int**| Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. | [optional] 

### Return type

[**Measurement**](Measurement.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_measurements_delete_post**
> CommonResponse v1_measurements_delete_post(body => $body)

Delete a measurement

Delete a previously submitted measurement

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $body = WWW::SwaggerClient::Object::MeasurementDelete->new(); # MeasurementDelete | The startTime and variableId of the measurement to be deleted.

eval { 
    my $result = $api_instance->v1_measurements_delete_post(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v1_measurements_delete_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**MeasurementDelete**](MeasurementDelete.md)| The startTime and variableId of the measurement to be deleted. | 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_measurements_get**
> Measurement v1_measurements_get(access_token => $access_token, variable_name => $variable_name, variable_category_name => $variable_category_name, source => $source, value => $value, last_updated => $last_updated, unit => $unit, start_time => $start_time, created_at => $created_at, updated_at => $updated_at, end_time => $end_time, grouping_width => $grouping_width, grouping_timezone => $grouping_timezone, limit => $limit, offset => $offset, sort => $sort)

Get measurements for this user

Measurements are any value that can be recorded like daily steps, a mood rating, or apples eaten. <br>Supported filter parameters:<br><ul><li><b>value</b> - Value of measurement</li><li><b>lastUpdated</b> - The time that this measurement was created or last updated in the UTC format \"YYYY-MM-DDThh:mm:ss\"</li></ul><br>

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $variable_name = 'variable_name_example'; # string | Name of the variable you want measurements for
my $variable_category_name = 'variable_category_name_example'; # string | Name of the variable category you want measurements for
my $source = 'source_example'; # string | Name of the source you want measurements for (supports exact name match only)
my $value = 'value_example'; # string | Value of measurement
my $last_updated = 'last_updated_example'; # string | The time that this measurement was created or last updated in the format \"YYYY-MM-DDThh:mm:ss\"
my $unit = 'unit_example'; # string | The unit you want the measurements returned in
my $start_time = 'start_time_example'; # string | The lower limit of measurements returned (Epoch)
my $created_at = 'created_at_example'; # string | The time the measurement record was first created in the format YYYY-MM-DDThh:mm:ss. Time zone should be UTC and not local.
my $updated_at = 'updated_at_example'; # string | The time the measurement record was last changed in the format YYYY-MM-DDThh:mm:ss. Time zone should be UTC and not local.
my $end_time = 'end_time_example'; # string | The upper limit of measurements returned (Epoch)
my $grouping_width = 56; # int | The time (in seconds) over which measurements are grouped together
my $grouping_timezone = 'grouping_timezone_example'; # string | The time (in seconds) over which measurements are grouped together
my $limit = 56; # int | The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0.
my $offset = 56; # int | Now suppose you wanted to show results 11-20. You'd set the offset to 10 and the limit to 10.
my $sort = 56; # int | Sort by given field. If the field is prefixed with `-, it will sort in descending order.

eval { 
    my $result = $api_instance->v1_measurements_get(access_token => $access_token, variable_name => $variable_name, variable_category_name => $variable_category_name, source => $source, value => $value, last_updated => $last_updated, unit => $unit, start_time => $start_time, created_at => $created_at, updated_at => $updated_at, end_time => $end_time, grouping_width => $grouping_width, grouping_timezone => $grouping_timezone, limit => $limit, offset => $offset, sort => $sort);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v1_measurements_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **variable_name** | **string**| Name of the variable you want measurements for | [optional] 
 **variable_category_name** | **string**| Name of the variable category you want measurements for | [optional] 
 **source** | **string**| Name of the source you want measurements for (supports exact name match only) | [optional] 
 **value** | **string**| Value of measurement | [optional] 
 **last_updated** | **string**| The time that this measurement was created or last updated in the format \&quot;YYYY-MM-DDThh:mm:ss\&quot; | [optional] 
 **unit** | **string**| The unit you want the measurements returned in | [optional] 
 **start_time** | **string**| The lower limit of measurements returned (Epoch) | [optional] 
 **created_at** | **string**| The time the measurement record was first created in the format YYYY-MM-DDThh:mm:ss. Time zone should be UTC and not local. | [optional] 
 **updated_at** | **string**| The time the measurement record was last changed in the format YYYY-MM-DDThh:mm:ss. Time zone should be UTC and not local. | [optional] 
 **end_time** | **string**| The upper limit of measurements returned (Epoch) | [optional] 
 **grouping_width** | **int**| The time (in seconds) over which measurements are grouped together | [optional] 
 **grouping_timezone** | **string**| The time (in seconds) over which measurements are grouped together | [optional] 
 **limit** | **int**| The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. | [optional] 
 **offset** | **int**| Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. | [optional] 
 **sort** | **int**| Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. | [optional] 

### Return type

[**Measurement**](Measurement.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_measurements_post**
> v1_measurements_post(body => $body, access_token => $access_token)

Post a new set or update existing measurements to the database

You can submit or update multiple measurements in a \"measurements\" sub-array.  If the variable these measurements correspond to does not already exist in the database, it will be automatically added.  The request body should look something like [{\"measurements\":[{\"startTime\":1439389320,\"value\":\"3\"}, {\"startTime\":1439389319,\"value\":\"2\"}],\"name\":\"Acne (out of 5)\",\"source\":\"QuantiModo\",\"category\":\"Symptoms\",\"combinationOperation\":\"MEAN\",\"unit\":\"/5\"}]

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $body = WWW::SwaggerClient::Object::MeasurementSet->new(); # MeasurementSet | An array of measurements you want to insert.
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    $api_instance->v1_measurements_post(body => $body, access_token => $access_token);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v1_measurements_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**MeasurementSet**](MeasurementSet.md)| An array of measurements you want to insert. | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_measurements_range_get**
> MeasurementRange v1_measurements_range_get(sources => $sources, user => $user)

Get measurements range for this user

Get Unix time-stamp (epoch time) of the user's first and last measurements taken.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $sources = 'sources_example'; # string | Enter source name to limit to specific source (varchar)
my $user = 56; # int | If not specified, uses currently logged in user (bigint)

eval { 
    my $result = $api_instance->v1_measurements_range_get(sources => $sources, user => $user);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v1_measurements_range_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sources** | **string**| Enter source name to limit to specific source (varchar) | [optional] 
 **user** | **int**| If not specified, uses currently logged in user (bigint) | [optional] 

### Return type

[**MeasurementRange**](MeasurementRange.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v2_measurements_csv_get**
> File v2_measurements_csv_get(access_token => $access_token)

Get Measurements CSV

Download a CSV containing all user measurements

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v2_measurements_csv_get(access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v2_measurements_csv_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**File**](File.md)

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v2_measurements_id_delete**
> InlineResponse20012 v2_measurements_id_delete(id => $id, access_token => $access_token)

Delete Measurement

Delete Measurement

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $id = 56; # int | id of Measurement
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v2_measurements_id_delete(id => $id, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v2_measurements_id_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id of Measurement | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v2_measurements_id_get**
> InlineResponse20011 v2_measurements_id_get(id => $id, access_token => $access_token)

Get Measurement

Get Measurement

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $id = 56; # int | id of Measurement
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v2_measurements_id_get(id => $id, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v2_measurements_id_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id of Measurement | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**InlineResponse20011**](InlineResponse20011.md)

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v2_measurements_id_put**
> InlineResponse20012 v2_measurements_id_put(id => $id, access_token => $access_token, body => $body)

Update Measurement

Update Measurement

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $id = 56; # int | id of Measurement
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $body = WWW::SwaggerClient::Object::Measurement->new(); # Measurement | Measurement that should be updated

eval { 
    my $result = $api_instance->v2_measurements_id_put(id => $id, access_token => $access_token, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v2_measurements_id_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id of Measurement | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **body** | [**Measurement**](Measurement.md)| Measurement that should be updated | [optional] 

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v2_measurements_request_csv_post**
> int v2_measurements_request_csv_post(access_token => $access_token)

Post Request for Measurements CSV

Use this endpoint to schedule a CSV export containing all user measurements to be emailed to the user within 24 hours.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v2_measurements_request_csv_post(access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v2_measurements_request_csv_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

**int**

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v2_measurements_request_pdf_post**
> int v2_measurements_request_pdf_post(access_token => $access_token)

Post Request for Measurements PDF

Use this endpoint to schedule a PDF export containing all user measurements to be emailed to the user within 24 hours.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v2_measurements_request_pdf_post(access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v2_measurements_request_pdf_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

**int**

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v2_measurements_request_xls_post**
> int v2_measurements_request_xls_post(access_token => $access_token)

Post Request for Measurements XLS

Use this endpoint to schedule a XLS export containing all user measurements to be emailed to the user within 24 hours.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::MeasurementsApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v2_measurements_request_xls_post(access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling MeasurementsApi->v2_measurements_request_xls_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

**int**

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

