# WWW::SwaggerClient::Object::UserVariable

## Load the model package
```perl
use WWW::SwaggerClient::Object::UserVariable;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**parent_id** | **int** | ID of the parent variable if this variable has any parent | [optional] 
**user_id** | **int** | User ID | [optional] 
**client_id** | **string** | client_id | [optional] 
**variable_id** | **int** | ID of variable | 
**default_unit_id** | **int** | ID of unit to use for this variable | [optional] 
**minimum_allowed_value** | **double** | Minimum reasonable value for this variable (uses default unit) | [optional] 
**maximum_allowed_value** | **double** | Maximum reasonable value for this variable (uses default unit) | [optional] 
**filling_value** | **double** | Value for replacing null measurements | [optional] 
**join_with** | **int** | The Variable this Variable should be joined with. If the variable is joined with some other variable then it is not shown to user in the list of variables | [optional] 
**onset_delay** | **int** | How long it takes for a measurement in this variable to take effect | [optional] 
**duration_of_action** | **int** | Estimated duration of time following the onset delay in which a stimulus produces a perceivable effect | [optional] 
**variable_category_id** | **int** | ID of variable category | [optional] 
**updated** | **int** | updated | [optional] 
**public** | **int** | Is variable public | [optional] 
**cause_only** | **boolean** | A value of 1 indicates that this variable is generally a cause in a causal relationship.  An example of a causeOnly variable would be a variable such as Cloud Cover which would generally not be influenced by the behaviour of the user | [optional] 
**filling_type** | **string** | 0 -&gt; No filling, 1 -&gt; Use filling-value | [optional] 
**number_of_measurements** | **int** | Number of measurements | [optional] 
**number_of_processed_measurements** | **int** | Number of processed measurements | [optional] 
**measurements_at_last_analysis** | **int** | Number of measurements at last analysis | [optional] 
**last_unit_id** | **int** | ID of last Unit | [optional] 
**last_original_unit_id** | **int** | ID of last original Unit | [optional] 
**last_value** | **double** | Last Value | [optional] 
**last_original_value** | **int** | Last original value which is stored | [optional] 
**last_source_id** | **int** | ID of last source | [optional] 
**number_of_correlations** | **int** | Number of correlations for this variable | [optional] 
**status** | **string** | status | [optional] 
**error_message** | **string** | error_message | [optional] 
**last_successful_update_time** | **DateTime** | When this variable or its settings were last updated | [optional] 
**standard_deviation** | **double** | Standard deviation | [optional] 
**variance** | **double** | Variance | [optional] 
**minimum_recorded_value** | **double** | Minimum recorded value of this variable | [optional] 
**maximum_recorded_daily_value** | **double** | Maximum recorded daily value of this variable | [optional] 
**mean** | **double** | Mean | [optional] 
**median** | **double** | Median | [optional] 
**most_common_unit_id** | **int** | Most common Unit ID | [optional] 
**most_common_value** | **double** | Most common value | [optional] 
**number_of_unique_daily_values** | **double** | Number of unique daily values | [optional] 
**number_of_changes** | **int** | Number of changes | [optional] 
**skewness** | **double** | Skewness | [optional] 
**kurtosis** | **double** | Kurtosis | [optional] 
**latitude** | **double** | Latitude | [optional] 
**longitude** | **double** | Longitude | [optional] 
**location** | **string** | Location | [optional] 
**experiment_start_time** | **DateTime** | Earliest measurement start_time to be used in analysis. Use ISO 8601 datetime format | [optional] 
**experiment_end_time** | **DateTime** | Latest measurement start_time to be used in analysis. Use ISO 8601 datetime format | [optional] 
**created_at** | **DateTime** | When the record was first created. Use ISO 8601 datetime format | [optional] 
**updated_at** | **DateTime** | When the record in the database was last updated. Use ISO 8601 datetime format | [optional] 
**outcome** | **boolean** | Outcome variables (those with &#x60;outcome&#x60; &#x3D;&#x3D; 1) are variables for which a human would generally want to identify the influencing factors.  These include symptoms of illness, physique, mood, cognitive performance, etc.  Generally correlation calculations are only performed on outcome variables | [optional] 
**sources** | **string** | Comma-separated list of source names to limit variables to those sources | [optional] 
**earliest_source_time** | **int** | Earliest source time | [optional] 
**latest_source_time** | **int** | Latest source time | [optional] 
**earliest_measurement_time** | **int** | Earliest measurement time | [optional] 
**latest_measurement_time** | **int** | Latest measurement time | [optional] 
**earliest_filling_time** | **int** | Earliest filling time | [optional] 
**latest_filling_time** | **int** | Latest filling time | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


