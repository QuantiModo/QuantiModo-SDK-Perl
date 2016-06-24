# WWW::SwaggerClient::VotesApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::VotesApi;
```

All URIs are relative to *https://app.quantimo.do/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1_votes_delete_post**](VotesApi.md#v1_votes_delete_post) | **POST** /v1/votes/delete | Delete vote
[**v1_votes_post**](VotesApi.md#v1_votes_post) | **POST** /v1/votes | Post or update vote


# **v1_votes_delete_post**
> CommonResponse v1_votes_delete_post(body => $body, access_token => $access_token)

Delete vote

Delete previously posted vote

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::VotesApi->new();
my $body = WWW::SwaggerClient::Object::VoteDelete->new(); # VoteDelete | The cause and effect variable names for the predictor vote to be deleted.
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_votes_delete_post(body => $body, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VotesApi->v1_votes_delete_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**VoteDelete**](VoteDelete.md)| The cause and effect variable names for the predictor vote to be deleted. | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_votes_post**
> CommonResponse v1_votes_post(body => $body, access_token => $access_token)

Post or update vote

This is to enable users to indicate their opinion on the plausibility of a causal relationship between a treatment and outcome. QuantiModo incorporates crowd-sourced plausibility estimations into their algorithm. This is done allowing user to indicate their view of the plausibility of each relationship with thumbs up/down buttons placed next to each prediction.

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::VotesApi->new();
my $body = WWW::SwaggerClient::Object::PostVote->new(); # PostVote | Contains the cause variable, effect variable, and vote value.
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_votes_post(body => $body, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VotesApi->v1_votes_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PostVote**](PostVote.md)| Contains the cause variable, effect variable, and vote value. | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

