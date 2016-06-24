# WWW::SwaggerClient::OrganizationsApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::OrganizationsApi;
```

All URIs are relative to *https://app.quantimo.do/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1_organizations_organization_id_users_post**](OrganizationsApi.md#v1_organizations_organization_id_users_post) | **POST** /v1/organizations/{organizationId}/users | Get user tokens for existing users, create new users


# **v1_organizations_organization_id_users_post**
> UserTokenSuccessfulResponse v1_organizations_organization_id_users_post(organization_id => $organization_id, body => $body, access_token => $access_token)

Get user tokens for existing users, create new users

Get user tokens for existing users, create new users

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';
# Configure API key authorization: internalApiKey
$WWW::SwaggerClient::Configuration::api_key->{'api_key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$WWW::SwaggerClient::Configuration::api_key_prefix->{'api_key'} = "Bearer";

my $api_instance = WWW::SwaggerClient::OrganizationsApi->new();
my $organization_id = 56; # int | Organization ID
my $body = WWW::SwaggerClient::Object::UserTokenRequest->new(); # UserTokenRequest | Provides organization token and user ID
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_organizations_organization_id_users_post(organization_id => $organization_id, body => $body, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling OrganizationsApi->v1_organizations_organization_id_users_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | **int**| Organization ID | 
 **body** | [**UserTokenRequest**](UserTokenRequest.md)| Provides organization token and user ID | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**UserTokenSuccessfulResponse**](UserTokenSuccessfulResponse.md)

### Authorization

[oauth2](../README.md#oauth2), [internalApiKey](../README.md#internalApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
