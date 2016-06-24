# WWW::SwaggerClient::RemindersApi

## Load the API package
```perl
use WWW::SwaggerClient::Object::RemindersApi;
```

All URIs are relative to *https://app.quantimo.do/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1_tracking_reminder_notifications_get**](RemindersApi.md#v1_tracking_reminder_notifications_get) | **GET** /v1/trackingReminderNotifications | Get specific pending tracking reminders
[**v1_tracking_reminder_notifications_skip_post**](RemindersApi.md#v1_tracking_reminder_notifications_skip_post) | **POST** /v1/trackingReminderNotifications/skip | Skip a pending tracking reminder
[**v1_tracking_reminder_notifications_snooze_post**](RemindersApi.md#v1_tracking_reminder_notifications_snooze_post) | **POST** /v1/trackingReminderNotifications/snooze | Snooze a pending tracking reminder
[**v1_tracking_reminder_notifications_track_post**](RemindersApi.md#v1_tracking_reminder_notifications_track_post) | **POST** /v1/trackingReminderNotifications/track | Track a pending tracking reminder
[**v1_tracking_reminders_delete_post**](RemindersApi.md#v1_tracking_reminders_delete_post) | **POST** /v1/trackingReminders/delete | Delete tracking reminder
[**v1_tracking_reminders_get**](RemindersApi.md#v1_tracking_reminders_get) | **GET** /v1/trackingReminders | Get repeating tracking reminder settings
[**v1_tracking_reminders_post**](RemindersApi.md#v1_tracking_reminders_post) | **POST** /v1/trackingReminders | Store a Tracking Reminder


# **v1_tracking_reminder_notifications_get**
> InlineResponse200 v1_tracking_reminder_notifications_get(access_token => $access_token, variable_category_name => $variable_category_name, created_at => $created_at, updated_at => $updated_at, limit => $limit, offset => $offset, sort => $sort)

Get specific pending tracking reminders

Specfic pending reminder instances that still need to be tracked.  

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::RemindersApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $variable_category_name = 'variable_category_name_example'; # string | Limit tracking reminder notifications to a specific variable category
my $created_at = 'created_at_example'; # string | When the record was first created. Use ISO 8601 datetime format. Time zone should be UTC and not local. 
my $updated_at = 'updated_at_example'; # string | When the record was last updated. Use ISO 8601 datetime format. Time zone should be UTC and not local. 
my $limit = 56; # int | The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.
my $offset = 56; # int | OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.
my $sort = 'sort_example'; # string | Sort by given field. If the field is prefixed with '-', it will sort in descending order.

eval { 
    my $result = $api_instance->v1_tracking_reminder_notifications_get(access_token => $access_token, variable_category_name => $variable_category_name, created_at => $created_at, updated_at => $updated_at, limit => $limit, offset => $offset, sort => $sort);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling RemindersApi->v1_tracking_reminder_notifications_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **variable_category_name** | **string**| Limit tracking reminder notifications to a specific variable category | [optional] 
 **created_at** | **string**| When the record was first created. Use ISO 8601 datetime format. Time zone should be UTC and not local.  | [optional] 
 **updated_at** | **string**| When the record was last updated. Use ISO 8601 datetime format. Time zone should be UTC and not local.  | [optional] 
 **limit** | **int**| The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. | [optional] 
 **offset** | **int**| OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. | [optional] 
 **sort** | **string**| Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_tracking_reminder_notifications_skip_post**
> CommonResponse v1_tracking_reminder_notifications_skip_post(body => $body, access_token => $access_token)

Skip a pending tracking reminder

Deletes the pending tracking reminder

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::RemindersApi->new();
my $body = WWW::SwaggerClient::Object::TrackingReminderNotificationSkip->new(); # TrackingReminderNotificationSkip | Id of the pending reminder to be skipped or deleted
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_tracking_reminder_notifications_skip_post(body => $body, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling RemindersApi->v1_tracking_reminder_notifications_skip_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TrackingReminderNotificationSkip**](TrackingReminderNotificationSkip.md)| Id of the pending reminder to be skipped or deleted | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_tracking_reminder_notifications_snooze_post**
> CommonResponse v1_tracking_reminder_notifications_snooze_post(body => $body, access_token => $access_token)

Snooze a pending tracking reminder

Changes the reminder time to now plus one hour

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::RemindersApi->new();
my $body = WWW::SwaggerClient::Object::TrackingReminderNotificationSnooze->new(); # TrackingReminderNotificationSnooze | Id of the pending reminder to be snoozed
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_tracking_reminder_notifications_snooze_post(body => $body, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling RemindersApi->v1_tracking_reminder_notifications_snooze_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TrackingReminderNotificationSnooze**](TrackingReminderNotificationSnooze.md)| Id of the pending reminder to be snoozed | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_tracking_reminder_notifications_track_post**
> CommonResponse v1_tracking_reminder_notifications_track_post(body => $body, access_token => $access_token)

Track a pending tracking reminder

Adds the default measurement for the pending tracking reminder with the reminder time as the measurment start time

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::RemindersApi->new();
my $body = WWW::SwaggerClient::Object::TrackingReminderNotificationTrack->new(); # TrackingReminderNotificationTrack | Id of the pending reminder to be tracked
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_tracking_reminder_notifications_track_post(body => $body, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling RemindersApi->v1_tracking_reminder_notifications_track_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TrackingReminderNotificationTrack**](TrackingReminderNotificationTrack.md)| Id of the pending reminder to be tracked | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_tracking_reminders_delete_post**
> CommonResponse v1_tracking_reminders_delete_post(body => $body, access_token => $access_token)

Delete tracking reminder

Delete previously created tracking reminder

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::RemindersApi->new();
my $body = WWW::SwaggerClient::Object::TrackingReminderDelete->new(); # TrackingReminderDelete | Id of reminder to be deleted
my $access_token = 'access_token_example'; # string | User's OAuth2 access token

eval { 
    my $result = $api_instance->v1_tracking_reminders_delete_post(body => $body, access_token => $access_token);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling RemindersApi->v1_tracking_reminders_delete_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TrackingReminderDelete**](TrackingReminderDelete.md)| Id of reminder to be deleted | 
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_tracking_reminders_get**
> InlineResponse2001 v1_tracking_reminders_get(access_token => $access_token, variable_category_name => $variable_category_name, created_at => $created_at, updated_at => $updated_at, limit => $limit, offset => $offset, sort => $sort)

Get repeating tracking reminder settings

Users can be reminded to track certain variables at a specified frequency with a default value.  

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::RemindersApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $variable_category_name = 'variable_category_name_example'; # string | Limit tracking reminders to a specific variable category
my $created_at = 'created_at_example'; # string | When the record was first created. Use ISO 8601 datetime format. Time zone should be UTC and not local. 
my $updated_at = 'updated_at_example'; # string | When the record was last updated. Use ISO 8601 datetime format. Time zone should be UTC and not local. 
my $limit = 56; # int | The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.
my $offset = 56; # int | OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.
my $sort = 'sort_example'; # string | Sort by given field. If the field is prefixed with '-', it will sort in descending order.

eval { 
    my $result = $api_instance->v1_tracking_reminders_get(access_token => $access_token, variable_category_name => $variable_category_name, created_at => $created_at, updated_at => $updated_at, limit => $limit, offset => $offset, sort => $sort);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling RemindersApi->v1_tracking_reminders_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **variable_category_name** | **string**| Limit tracking reminders to a specific variable category | [optional] 
 **created_at** | **string**| When the record was first created. Use ISO 8601 datetime format. Time zone should be UTC and not local.  | [optional] 
 **updated_at** | **string**| When the record was last updated. Use ISO 8601 datetime format. Time zone should be UTC and not local.  | [optional] 
 **limit** | **int**| The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records. | [optional] 
 **offset** | **int**| OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned. | [optional] 
 **sort** | **string**| Sort by given field. If the field is prefixed with &#39;-&#39;, it will sort in descending order. | [optional] 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1_tracking_reminders_post**
> InlineResponse2002 v1_tracking_reminders_post(access_token => $access_token, body => $body)

Store a Tracking Reminder

This is to enable users to create reminders to track a variable with a default value at a specified frequency

### Example 
```perl
use Data::Dumper;

# Configure OAuth2 access token for authorization: quantimodo_oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';

my $api_instance = WWW::SwaggerClient::RemindersApi->new();
my $access_token = 'access_token_example'; # string | User's OAuth2 access token
my $body = WWW::SwaggerClient::Object::TrackingReminder->new(); # TrackingReminder | TrackingReminder that should be stored

eval { 
    my $result = $api_instance->v1_tracking_reminders_post(access_token => $access_token, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling RemindersApi->v1_tracking_reminders_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **string**| User&#39;s OAuth2 access token | [optional] 
 **body** | [**TrackingReminder**](TrackingReminder.md)| TrackingReminder that should be stored | [optional] 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

[quantimodo_oauth2](../README.md#quantimodo_oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

