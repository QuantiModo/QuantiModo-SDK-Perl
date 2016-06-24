# WWW::SwaggerClient::PairsApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::PairsApi;
```

All URIs are relative to *https://app.quantimo.do/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1_pairs_csv_get**](PairsApi.md#v1_pairs_csv_get) | **GET** /v1/pairsCsv | Get pairs
[**v1_pairs_get**](PairsApi.md#v1_pairs_get) | **GET** /v1/pairs | Get pairs


# **v1_pairs_csv_get**
> ARRAY[Pairs] v1_pairs_csv_get(cause => $cause, effect => $effect, access_token => $access_token, cause_source => $cause_source, cause_unit => $cause_unit, delay => $delay, duration => $duration, effect_source => $effect_source, effect_unit => $effect_unit, end_time => $end_time, start_time => $start_time, limit => $limit, offset => $offset, sort => $sort)

Get pairs

Pairs cause measurements with effect measurements grouped over the duration of action after the onset delay.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::PairsApi->new();
my $cause = 'cause_example'; # string | Original variable name for the explanatory or independent variable
my $effect = 'effect_example'; # string | Original variable name for the outcome or dependent variable
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $cause_source = 'cause_source_example'; # string | Name of data source that the cause measurements should come from
my $cause_unit = 'cause_unit_example'; # string | Abbreviated name for the unit cause measurements to be returned in
my $delay = 'delay_example'; # string | Delay before onset of action (in seconds) from the cause variable settings.
my $duration = 'duration_example'; # string | Duration of action (in seconds) from the cause variable settings.
my $effect_source = 'effect_source_example'; # string | Name of data source that the effectmeasurements should come from
my $effect_unit = 'effect_unit_example'; # string | Abbreviated name for the unit effect measurements to be returned in
my $end_time = 'end_time_example'; # string | The most recent date (in epoch time) for which we should return measurements
my $start_time = 'start_time_example'; # string | The earliest date (in epoch time) for which we should return measurements
my $limit = 56; # int | The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0.
my $offset = 56; # int | Now suppose you wanted to show results 11-20. You'd set the offset to 10 and the limit to 10.
my $sort = 56; # int | Sort by given field. If the field is prefixed with `-, it will sort in descending order.

eval { 
    my $result = $api_instance->v1_pairs_csv_get(cause => $cause, effect => $effect, access_token => $access_token, cause_source => $cause_source, cause_unit => $cause_unit, delay => $delay, duration => $duration, effect_source => $effect_source, effect_unit => $effect_unit, end_time => $end_time, start_time => $start_time, limit => $limit, offset => $offset, sort => $sort);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling PairsApi->v1_pairs_csv_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cause** | **string**| Original variable name for the explanatory or independent variable | 
 **effect** | **string**| Original variable name for the outcome or dependent variable | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **cause_source** | **string**| Name of data source that the cause measurements should come from | [optional] 
 **cause_unit** | **string**| Abbreviated name for the unit cause measurements to be returned in | [optional] 
 **delay** | **string**| Delay before onset of action (in seconds) from the cause variable settings. | [optional] 
 **duration** | **string**| Duration of action (in seconds) from the cause variable settings. | [optional] 
 **effect_source** | **string**| Name of data source that the effectmeasurements should come from | [optional] 
 **effect_unit** | **string**| Abbreviated name for the unit effect measurements to be returned in | [optional] 
 **end_time** | **string**| The most recent date (in epoch time) for which we should return measurements | [optional] 
 **start_time** | **string**| The earliest date (in epoch time) for which we should return measurements | [optional] 
 **limit** | **int**| The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. | [optional] 
 **offset** | **int**| Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. | [optional] 
 **sort** | **int**| Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. | [optional] 

### Return type

[**ARRAY[Pairs]**](Pairs.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_pairs_get**
> ARRAY[Pairs] v1_pairs_get(cause => $cause, effect => $effect, access_token => $access_token, cause_source => $cause_source, cause_unit => $cause_unit, delay => $delay, duration => $duration, effect_source => $effect_source, effect_unit => $effect_unit, end_time => $end_time, start_time => $start_time, limit => $limit, offset => $offset, sort => $sort)

Get pairs

Pairs cause measurements with effect measurements grouped over the duration of action after the onset delay.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::PairsApi->new();
my $cause = 'cause_example'; # string | Original variable name for the explanatory or independent variable
my $effect = 'effect_example'; # string | Original variable name for the outcome or dependent variable
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $cause_source = 'cause_source_example'; # string | Name of data source that the cause measurements should come from
my $cause_unit = 'cause_unit_example'; # string | Abbreviated name for the unit cause measurements to be returned in
my $delay = 'delay_example'; # string | Delay before onset of action (in seconds) from the cause variable settings.
my $duration = 'duration_example'; # string | Duration of action (in seconds) from the cause variable settings.
my $effect_source = 'effect_source_example'; # string | Name of data source that the effectmeasurements should come from
my $effect_unit = 'effect_unit_example'; # string | Abbreviated name for the unit effect measurements to be returned in
my $end_time = 'end_time_example'; # string | The most recent date (in epoch time) for which we should return measurements
my $start_time = 'start_time_example'; # string | The earliest date (in epoch time) for which we should return measurements
my $limit = 56; # int | The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0.
my $offset = 56; # int | Now suppose you wanted to show results 11-20. You'd set the offset to 10 and the limit to 10.
my $sort = 56; # int | Sort by given field. If the field is prefixed with `-, it will sort in descending order.

eval { 
    my $result = $api_instance->v1_pairs_get(cause => $cause, effect => $effect, access_token => $access_token, cause_source => $cause_source, cause_unit => $cause_unit, delay => $delay, duration => $duration, effect_source => $effect_source, effect_unit => $effect_unit, end_time => $end_time, start_time => $start_time, limit => $limit, offset => $offset, sort => $sort);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling PairsApi->v1_pairs_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cause** | **string**| Original variable name for the explanatory or independent variable | 
 **effect** | **string**| Original variable name for the outcome or dependent variable | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **cause_source** | **string**| Name of data source that the cause measurements should come from | [optional] 
 **cause_unit** | **string**| Abbreviated name for the unit cause measurements to be returned in | [optional] 
 **delay** | **string**| Delay before onset of action (in seconds) from the cause variable settings. | [optional] 
 **duration** | **string**| Duration of action (in seconds) from the cause variable settings. | [optional] 
 **effect_source** | **string**| Name of data source that the effectmeasurements should come from | [optional] 
 **effect_unit** | **string**| Abbreviated name for the unit effect measurements to be returned in | [optional] 
 **end_time** | **string**| The most recent date (in epoch time) for which we should return measurements | [optional] 
 **start_time** | **string**| The earliest date (in epoch time) for which we should return measurements | [optional] 
 **limit** | **int**| The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. | [optional] 
 **offset** | **int**| Now suppose you wanted to show results 11-20. You&#39;d set the offset to 10 and the limit to 10. | [optional] 
 **sort** | **int**| Sort by given field. If the field is prefixed with &#x60;-, it will sort in descending order. | [optional] 

### Return type

[**ARRAY[Pairs]**](Pairs.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

