# WWW::SwaggerClient::ConnectorsApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::ConnectorsApi;
```

All URIs are relative to *https://app.quantimo.do/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1_connect_js_get**](ConnectorsApi.md#v1_connect_js_get) | **GET** /v1/connect.js | Get embeddable connect javascript
[**v1_connect_mobile_get**](ConnectorsApi.md#v1_connect_mobile_get) | **GET** /v1/connect/mobile | Mobile connect page
[**v1_connectors_connector_connect_get**](ConnectorsApi.md#v1_connectors_connector_connect_get) | **GET** /v1/connectors/{connector}/connect | Obtain a token from 3rd party data source
[**v1_connectors_connector_connect_instructions_get**](ConnectorsApi.md#v1_connectors_connector_connect_instructions_get) | **GET** /v1/connectors/{connector}/connectInstructions | Connection Instructions
[**v1_connectors_connector_connect_parameter_get**](ConnectorsApi.md#v1_connectors_connector_connect_parameter_get) | **GET** /v1/connectors/{connector}/connectParameter | Connect Parameter
[**v1_connectors_connector_disconnect_get**](ConnectorsApi.md#v1_connectors_connector_disconnect_get) | **GET** /v1/connectors/{connector}/disconnect | Delete stored connection info
[**v1_connectors_connector_info_get**](ConnectorsApi.md#v1_connectors_connector_info_get) | **GET** /v1/connectors/{connector}/info | Get connector info for user
[**v1_connectors_connector_update_get**](ConnectorsApi.md#v1_connectors_connector_update_get) | **GET** /v1/connectors/{connector}/update | Sync with data source
[**v1_connectors_list_get**](ConnectorsApi.md#v1_connectors_list_get) | **GET** /v1/connectors/list | List of Connectors


# **v1_connect_js_get**
> v1_connect_js_get(access_token => $access_token)

Get embeddable connect javascript

Get embeddable connect javascript. Usage:    - Embedding in applications with popups for 3rd-party authentication windows.      Use `qmSetupInPopup` function after connecting `connect.js`.    - Embedding in applications with popups for 3rd-party authentication windows.      Requires a selector to block. It will be embedded in this block.      Use `qmSetupOnPage` function after connecting `connect.js`.    - Embedding in mobile applications without popups for 3rd-party authentication.      Use `qmSetupOnMobile` function after connecting `connect.js`.      if using the MoodiModo Clones, Use `qmSetupOnIonic` function after connecting `connect.js`. 

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';
# Configure API key authorization: internalApiKey
$WWW::SwaggerClient::Configuration::api_key->{'api_key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$WWW::SwaggerClient::Configuration::api_key_prefix->{'api_key'} = "Bearer";

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    $api_instance->v1_connect_js_get(access_token => $access_token);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connect_js_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2), [internalApiKey](../README.md#internalApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/x-javascript

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_connect_mobile_get**
> v1_connect_mobile_get(access_token => $access_token)

Mobile connect page

This page is designed to be opened in a webview.  Instead of using popup authentication boxes, it uses redirection. You can include the user's access_token as a URL parameter like https://app.quantimo.do/api/v1/connect/mobile?access_token=123

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';
# Configure API key authorization: internalApiKey
$WWW::SwaggerClient::Configuration::api_key->{'api_key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$WWW::SwaggerClient::Configuration::api_key_prefix->{'api_key'} = "Bearer";

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();
my $access_token = 'access_token_example'; # string | User OAuth access token

eval { 
    $api_instance->v1_connect_mobile_get(access_token => $access_token);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connect_mobile_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User OAuth access token | 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2), [internalApiKey](../README.md#internalApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: text/html

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_connectors_connector_connect_get**
> v1_connectors_connector_connect_get(connector => $connector, access_token => $access_token)

Obtain a token from 3rd party data source

Attempt to obtain a token from the data provider, store it in the database. With this, the connector to continue to obtain new user data until the token is revoked.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();
my $connector = 'connector_example'; # string | Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    $api_instance->v1_connectors_connector_connect_get(connector => $connector, access_token => $access_token);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connectors_connector_connect_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connector** | **string**| Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_connectors_connector_connect_instructions_get**
> v1_connectors_connector_connect_instructions_get(connector => $connector, parameters => $parameters, url => $url, use_popup => $use_popup, access_token => $access_token)

Connection Instructions

Returns instructions that describe what parameters and endpoint to use to connect to the given data provider.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();
my $connector = 'connector_example'; # string | Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.
my $parameters = 'parameters_example'; # string | JSON Array of Parameters for the request to enable connector.
my $url = 'url_example'; # string | URL which should be used to enable the connector.
my $use_popup = 1; # boolean | Should use popup when enabling connector
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    $api_instance->v1_connectors_connector_connect_instructions_get(connector => $connector, parameters => $parameters, url => $url, use_popup => $use_popup, access_token => $access_token);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connectors_connector_connect_instructions_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connector** | **string**| Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. | 
 **parameters** | **string**| JSON Array of Parameters for the request to enable connector. | 
 **url** | **string**| URL which should be used to enable the connector. | 
 **use_popup** | **boolean**| Should use popup when enabling connector | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_connectors_connector_connect_parameter_get**
> ConnectorInstruction v1_connectors_connector_connect_parameter_get(connector => $connector, display_name => $display_name, key => $key, placeholder => $placeholder, type => $type, use_popup => $use_popup, access_token => $access_token, default_value => $default_value)

Connect Parameter

Returns instructions that describe what parameters and endpoint to use to connect to the given data provider.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();
my $connector = 'connector_example'; # string | Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.
my $display_name = 'display_name_example'; # string | Name of the parameter that is user visible in the form
my $key = 'key_example'; # string | Name of the property that the user has to enter such as username or password Connector (used in HTTP request)
my $placeholder = 'placeholder_example'; # string | Placeholder hint value for the parameter input tag.
my $type = 'type_example'; # string | Type of input field such as those found here http://www.w3schools.com/tags/tag_input.asp
my $use_popup = 1; # boolean | Should use popup when enabling connector
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $default_value = 'default_value_example'; # string | Default parameter value

eval { 
    my $result = $api_instance->v1_connectors_connector_connect_parameter_get(connector => $connector, display_name => $display_name, key => $key, placeholder => $placeholder, type => $type, use_popup => $use_popup, access_token => $access_token, default_value => $default_value);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connectors_connector_connect_parameter_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connector** | **string**| Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. | 
 **display_name** | **string**| Name of the parameter that is user visible in the form | 
 **key** | **string**| Name of the property that the user has to enter such as username or password Connector (used in HTTP request) | 
 **placeholder** | **string**| Placeholder hint value for the parameter input tag. | 
 **type** | **string**| Type of input field such as those found here http://www.w3schools.com/tags/tag_input.asp | 
 **use_popup** | **boolean**| Should use popup when enabling connector | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **default_value** | **string**| Default parameter value | [optional] 

### Return type

[**ConnectorInstruction**](ConnectorInstruction.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_connectors_connector_disconnect_get**
> v1_connectors_connector_disconnect_get(connector => $connector)

Delete stored connection info

The disconnect method deletes any stored tokens or connection information from the connectors database.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();
my $connector = 'connector_example'; # string | Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.

eval { 
    $api_instance->v1_connectors_connector_disconnect_get(connector => $connector);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connectors_connector_disconnect_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connector** | **string**| Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. | 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_connectors_connector_info_get**
> ConnectorInfo v1_connectors_connector_info_get(connector => $connector, access_token => $access_token)

Get connector info for user

Returns information about the connector such as the connector id, whether or not is connected for this user (i.e. we have a token or credentials), and its update history for the user.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();
my $connector = 'connector_example'; # string | Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint.
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_connectors_connector_info_get(connector => $connector, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connectors_connector_info_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connector** | **string**| Lowercase system name of the source application or device. Get a list of available connectors from the /connectors/list endpoint. | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**ConnectorInfo**](ConnectorInfo.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_connectors_connector_update_get**
> v1_connectors_connector_update_get(connector => $connector, access_token => $access_token)

Sync with data source

The update method tells the QM Connector Framework to check with the data provider (such as Fitbit or MyFitnessPal) and retrieve any new measurements available.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();
my $connector = 'connector_example'; # string | Lowercase system name of the source application or device
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    $api_instance->v1_connectors_connector_update_get(connector => $connector, access_token => $access_token);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connectors_connector_update_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connector** | **string**| Lowercase system name of the source application or device | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_connectors_list_get**
> ARRAY[Connector] v1_connectors_list_get()

List of Connectors

A connector pulls data from other data providers using their API or a screenscraper. Returns a list of all available connectors and information about them such as their id, name, whether the user has provided access, logo url, connection instructions, and the update history.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::ConnectorsApi->new();

eval { 
    my $result = $api_instance->v1_connectors_list_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ConnectorsApi->v1_connectors_list_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ARRAY[Connector]**](Connector.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

