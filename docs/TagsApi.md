# WWW::SwaggerClient::TagsApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::TagsApi;
```

All URIs are relative to *https://app.quantimo.do/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1_user_tags_delete_post**](TagsApi.md#v1_user_tags_delete_post) | **POST** /v1/userTags/delete | Delete user tag or ingredient
[**v1_user_tags_post**](TagsApi.md#v1_user_tags_post) | **POST** /v1/userTags | Post or update user tags or ingredients


# **v1_user_tags_delete_post**
> CommonResponse v1_user_tags_delete_post(tagged_variable_id => $tagged_variable_id, tag_variable_id => $tag_variable_id)

Delete user tag or ingredient

Delete previously created user tags or ingredients.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::TagsApi->new();
my $tagged_variable_id = 56; # int | This is the id of the variable being tagged with an ingredient or something.
my $tag_variable_id = 56; # int | This is the id of the ingredient variable whose value is determined based on the value of the tagged variable.

eval { 
    my $result = $api_instance->v1_user_tags_delete_post(tagged_variable_id => $tagged_variable_id, tag_variable_id => $tag_variable_id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TagsApi->v1_user_tags_delete_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagged_variable_id** | **int**| This is the id of the variable being tagged with an ingredient or something. | 
 **tag_variable_id** | **int**| This is the id of the ingredient variable whose value is determined based on the value of the tagged variable. | 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_user_tags_post**
> CommonResponse v1_user_tags_post(body => $body, access_token => $access_token)

Post or update user tags or ingredients

This endpoint allows users to tag foods with their ingredients.  This information will then be used to infer the user intake of the different ingredients by just entering the foods. The inferred intake levels will then be used to determine the effects of different nutrients on the user during analysis.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::TagsApi->new();
my $body = WWW::SwaggerClient::Object::UserTag->new(); # UserTag | Contains the new user tag data
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_user_tags_post(body => $body, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TagsApi->v1_user_tags_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UserTag**](UserTag.md)| Contains the new user tag data | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

