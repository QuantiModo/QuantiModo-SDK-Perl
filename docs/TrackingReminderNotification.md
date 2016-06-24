# WWW::SwaggerClient::Object::TrackingReminderNotification

## Load the model package
```perl
use WWW::SwaggerClient::Object::TrackingReminderNotification;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | id for the specific PENDING tracking remidner | 
**tracking_reminder_id** | **int** | id for the repeating tracking remidner | 
**client_id** | **string** | clientId | [optional] 
**user_id** | **int** | ID of User | [optional] 
**variable_id** | **int** | Id for the variable to be tracked | [optional] 
**pending_reminder_time** | **DateTime** | ISO 8601 timestamp for the specific time the variable should be tracked in UTC.  This will be used for the measurement startTime if the track endpoint is used. | [optional] 
**default_value** | **double** | Default value to use for the measurement when tracking | [optional] 
**reminder_sound** | **string** | String identifier for the sound to accompany the reminder | [optional] 
**pop_up** | **boolean** | True if the reminders should appear as a popup notification | [optional] 
**sms** | **boolean** | True if the reminders should be delivered via SMS | [optional] 
**email** | **boolean** | True if the reminders should be delivered via email | [optional] 
**notification_bar** | **boolean** | True if the reminders should appear in the notification bar | [optional] 
**updated_at** | **DateTime** | When the record in the database was last updated. Use ISO 8601 datetime format. Time zone should be UTC and not local. | [optional] 
**variable_name** | **string** | Name of the variable to be used when sending measurements | [optional] 
**variable_category_name** | **string** | Name of the variable category to be used when sending measurements | [optional] 
**abbreviated_unit_name** | **string** | Abbreviated name of the unit to be used when sending measurements | [optional] 
**combination_operation** | **string** | The way multiple measurements are aggregated over time | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


