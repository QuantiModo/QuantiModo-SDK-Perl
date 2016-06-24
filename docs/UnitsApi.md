# WWW::SwaggerClient::UnitsApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::UnitsApi;
```

All URIs are relative to *https://app.quantimo.do/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1_unit_categories_get**](UnitsApi.md#v1_unit_categories_get) | **GET** /v1/unitCategories | Get unit categories
[**v1_units_get**](UnitsApi.md#v1_units_get) | **GET** /v1/units | Get all available units
[**v1_units_variable_get**](UnitsApi.md#v1_units_variable_get) | **GET** /v1/unitsVariable | Units for Variable


# **v1_unit_categories_get**
> UnitCategory v1_unit_categories_get()

Get unit categories

Get a list of the categories of measurement units such as 'Distance', 'Duration', 'Energy', 'Frequency', 'Miscellany', 'Pressure', 'Proportion', 'Rating', 'Temperature', 'Volume', and 'Weight'.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::UnitsApi->new();

eval { 
    my $result = $api_instance->v1_unit_categories_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling UnitsApi->v1_unit_categories_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UnitCategory**](UnitCategory.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_units_get**
> ARRAY[Unit] v1_units_get(access_token => $access_token, id => $id, unit_name => $unit_name, abbreviated_unit_name => $abbreviated_unit_name, category_name => $category_name)

Get all available units

Get all available units

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::UnitsApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $id = 56; # int | Unit id
my $unit_name = 'unit_name_example'; # string | Unit name
my $abbreviated_unit_name = 'abbreviated_unit_name_example'; # string | Restrict the results to a specific unit by providing the unit abbreviation.
my $category_name = 'category_name_example'; # string | Restrict the results to a specific unit category by providing the unit category name.

eval { 
    my $result = $api_instance->v1_units_get(access_token => $access_token, id => $id, unit_name => $unit_name, abbreviated_unit_name => $abbreviated_unit_name, category_name => $category_name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling UnitsApi->v1_units_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **id** | **int**| Unit id | [optional] 
 **unit_name** | **string**| Unit name | [optional] 
 **abbreviated_unit_name** | **string**| Restrict the results to a specific unit by providing the unit abbreviation. | [optional] 
 **category_name** | **string**| Restrict the results to a specific unit category by providing the unit category name. | [optional] 

### Return type

[**ARRAY[Unit]**](Unit.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_units_variable_get**
> ARRAY[Unit] v1_units_variable_get(access_token => $access_token, unit_name => $unit_name, abbreviated_unit_name => $abbreviated_unit_name, category_name => $category_name, variable => $variable)

Units for Variable

Get a list of all possible units to use for a given variable

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::UnitsApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $unit_name = 'unit_name_example'; # string | Name of Unit you want to retrieve
my $abbreviated_unit_name = 'abbreviated_unit_name_example'; # string | Abbreviated Unit Name of the unit you want
my $category_name = 'category_name_example'; # string | Name of the category you want units for
my $variable = 'variable_example'; # string | Name of the variable you want units for

eval { 
    my $result = $api_instance->v1_units_variable_get(access_token => $access_token, unit_name => $unit_name, abbreviated_unit_name => $abbreviated_unit_name, category_name => $category_name, variable => $variable);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling UnitsApi->v1_units_variable_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **unit_name** | **string**| Name of Unit you want to retrieve | [optional] 
 **abbreviated_unit_name** | **string**| Abbreviated Unit Name of the unit you want | [optional] 
 **category_name** | **string**| Name of the category you want units for | [optional] 
 **variable** | **string**| Name of the variable you want units for | [optional] 

### Return type

[**ARRAY[Unit]**](Unit.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

