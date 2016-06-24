# NAME

WWW::SwaggerClient::Role - a Moose role for the QuantiModo

Welcome to QuantiModo API! QuantiModo makes it easy to retrieve normalized user data from a wide array of devices and applications. [Learn about QuantiModo](https://quantimo.do) or contact us at <api@quantimo.do>.         Before you get started, you will need to: * Sign in/Sign up, and add some data at [https://app.quantimo.do/api/v2/account/connectors](https://app.quantimo.do/api/v2/account/connectors) to try out the API for yourself * Create an app to get your client id and secret at [https://app.quantimo.do/api/v2/apps](https://app.quantimo.do/api/v2/apps) * As long as you're signed in, it will use your browser's cookie for authentication.  However, client applications must use OAuth2 tokens to access the API.     ## Application Endpoints These endpoints give you access to all authorized users' data for that application. ### Getting Application Token Make a `POST` request to `/api/v2/oauth/access_token`         * `grant_type` Must be `client_credentials`.         * `clientId` Your application's clientId.         * `client_secret` Your application's client_secret.         * `redirect_uri` Your application's redirect url.                ## Example Queries ### Query Options The standard query options for QuantiModo API are as described in the table below. These are the available query options in QuantiModo API: <table>            <thead>                <tr>                    <th>Parameter</th>                    <th>Description</th>                </tr>            </thead>            <tbody>                <tr>                    <td>limit</td>                    <td>The LIMIT is used to limit the number of results returned.  So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.</td>                </tr>                <tr>                    <td>offset</td>                    <td>Suppose you wanted to show results 11-20. You'd set the    offset to 10 and the limit to 10.</td>                </tr>                <tr>                    <td>sort</td>                    <td>Sort by given field. If the field is prefixed with '-', it    will sort in descending order.</td>                </tr>            </tbody>        </table>         ### Pagination Conventions Since the maximum limit is 200 records, to get more than that you'll have to make multiple API calls and page through the results. To retrieve all the data, you can iterate through data by using the `limit` and `offset` query parameters.For example, if you want to retrieve data from 61-80 then you can use a query with the following parameters,         `/v2/variables?limit=20&offset=60`         Generally, you'll be retrieving new or updated user data. To avoid unnecessary API calls, you'll want to store your last refresh time locally.  Initially, it should be set to 0. Then whenever you make a request to get new data, you should limit the returned results to those updated since your last refresh by appending append         `?lastUpdated=(ge)&quot2013-01-D01T01:01:01&quot`         to your request.         Also for better pagination, you can get link to the records of first, last, next and previous page from response headers: * `Total-Count` - Total number of results for given query * `Link-First` - Link to get first page records * `Link-Last` - Link to get last page records * `Link-Prev` - Link to get previous records set * `Link-Next` - Link to get next records set         Remember, response header will be only sent when the record set is available. e.g. You will not get a ```Link-Last``` & ```Link-Next``` when you query for the last page.         ### Filter operators support API supports the following operators with filter parameters: <br> **Comparison operators**         Comparison operators allow you to limit results to those greater than, less than, or equal to a specified value for a specified attribute. These operators can be used with strings, numbers, and dates. The following comparison operators are available: * `gt` for `greater than` comparison * `ge` for `greater than or equal` comparison * `lt` for `less than` comparison * `le` for `less than or equal` comparison         They are included in queries using the following format:         `(<operator>)<value>`         For example, in order to filter value which is greater than 21, the following query parameter should be used:         `?value=(gt)21` <br><br> **Equals/In Operators**         It also allows filtering by the exact value of an attribute or by a set of values, depending on the type of value passed as a query parameter. If the value contains commas, the parameter is split on commas and used as array input for `IN` filtering, otherwise the exact match is applied. In order to only show records which have the value 42, the following query should be used:         `?value=42`         In order to filter records which have value 42 or 43, the following query should be used:         `?value=42,43` <br><br> **Like operators**         Like operators allow filtering using `LIKE` query. This operator is triggered if exact match operator is used, but value contains `%` sign as the first or last character. In order to filter records which category that start with `Food`, the following query should be used:         `?category=Food%` <br><br> **Negation operator**         It is possible to get negated results of a query by prefixed the operator with `!`. Some examples:         `//filter records except those with value are not 42 or 43`<br> `?value=!42,43`         `//filter records with value not greater than 21`<br> `?value=!(ge)21` <br><br> **Multiple constraints for single attribute**         It is possible to apply multiple constraints by providing an array of query filters:         Filter all records which value is greater than 20.2 and less than 20.3<br> `?value[]=(gt)20.2&value[]=(lt)20.3`         Filter all records which value is greater than 20.2 and less than 20.3 but not 20.2778<br> `?value[]=(gt)20.2&value[]=(lt)20.3&value[]=!20.2778`<br><br> 

# VERSION

Automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2.0.6
- Package version: 1.0.0
- Build date: 2016-06-24T22:11:25.073Z
- Build package: class io.swagger.codegen.languages.PerlClientCodegen

## A note on Moose

This role is the only component of the library that uses Moose. See 
WWW::SwaggerClient::ApiFactory for non-Moosey usage. 

# SYNOPSIS

The Perl Swagger Codegen project builds a library of Perl modules to interact with 
a web service defined by a OpenAPI Specification. See below for how to build the 
library.

This module provides an interface to the generated library. All the classes, 
objects, and methods (well, not quite \*all\*, see below) are flattened into this 
role. 

        package MyApp;
        use Moose;
        with 'WWW::SwaggerClient::Role';
        
        package main;
        
        my $api = MyApp->new({ tokens => $tokens });
        
        my $pet = $api->get_pet_by_id(pet_id => $pet_id);
        

## Structure of the library

The library consists of a set of API classes, one for each endpoint. These APIs
implement the method calls available on each endpoint. 

Additionally, there is a set of "object" classes, which represent the objects 
returned by and sent to the methods on the endpoints. 

An API factory class is provided, which builds instances of each endpoint API. 

This Moose role flattens all the methods from the endpoint APIs onto the consuming 
class. It also provides methods to retrieve the endpoint API objects, and the API 
factory object, should you need it. 

For documentation of all these methods, see AUTOMATIC DOCUMENTATION below.

## Configuring authentication

In the normal case, the OpenAPI Spec will describe what parameters are
required and where to put them. You just need to supply the tokens.

    my $tokens = {
        # basic
        username => $username,
        password => $password,
        
        # oauth
        access_token => $oauth_token,
        
        # keys
        $some_key => { token => $token,
                       prefix => $prefix, 
                       in => $in,             # 'head||query',     
                       },
                       
        $another => { token => $token,
                      prefix => $prefix, 
                      in => $in,              # 'head||query',      
                      },                   
        ...,
        
        };
        
        my $api = MyApp->new({ tokens => $tokens });

Note these are all optional, as are `prefix` and `in`, and depend on the API
you are accessing. Usually `prefix` and `in` will be determined by the code generator from
the spec and you will not need to set them at run time. If not, `in` will
default to 'head' and `prefix` to the empty string. 

The tokens will be placed in the `WWW::SwaggerClient::Configuration` namespace
as follows, but you don't need to know about this. 

- `$WWW::SwaggerClient::Configuration::username`

    String. The username for basic auth.

- `$WWW::SwaggerClient::Configuration::password`

    String. The password for basic auth.

- `$WWW::SwaggerClient::Configuration::api_key`

    Hashref. Keyed on the name of each key (there can be multiple tokens).

            $WWW::SwaggerClient::Configuration::api_key = {
                    secretKey => 'aaaabbbbccccdddd',
                    anotherKey => '1111222233334444',
                    };

- `$WWW::SwaggerClient::Configuration::api_key_prefix`

    Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
    all api keys require a prefix.

            $WWW::SwaggerClient::Configuration::api_key_prefix = {
                    secretKey => 'string',
                    anotherKey => 'same or some other string',
                    };

- `$WWW::SwaggerClient::Configuration::access_token`

    String. The OAuth access token. 

# METHODS

## `base_url`

The generated code has the `base_url` already set as a default value. This method 
returns (and optionally sets, but only if the API client has not been 
created yet) the current value of `base_url`.

## `api_factory`

Returns an API factory object. You probably won't need to call this directly. 

        $self->api_factory('Pet'); # returns a WWW::SwaggerClient::PetApi instance
        
        $self->pet_api;            # the same

# MISSING METHODS

Most of the methods on the API are delegated to individual endpoint API objects
(e.g. Pet API, Store API, User API etc). Where different endpoint APIs use the
same method name (e.g. `new()`), these methods can't be delegated. So you need
to call `$api->pet_api->new()`.

In principle, every API is susceptible to the presence of a few, random, undelegatable 
method names. In practice, because of the way method names are constructed, it's 
unlikely in general that any methods will be undelegatable, except for: 

        new()
        class_documentation()
        method_documentation()

To call these methods, you need to get a handle on the relevant object, either
by calling `$api->foo_api` or by retrieving an object, e.g.
`$api->get_pet_by_id(pet_id => $pet_id)`. They are class methods, so
you could also call them on class names.

# BUILDING YOUR LIBRARY

See the homepage `https://github.com/swagger-api/swagger-codegen` for full details. 
But briefly, clone the git repository, build the codegen codebase, set up your build 
config file, then run the API build script. You will need git, Java 7 or 8 and Apache
maven 3.0.3 or better already installed.

The config file should specify the project name for the generated library: 

        {"moduleName":"WWW::MyProjectName"}

Your library files will be built under `WWW::MyProjectName`.

          $ git clone https://github.com/swagger-api/swagger-codegen.git
          $ cd swagger-codegen
          $ mvn package
          $ java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
    -i [URL or file path to JSON swagger API spec] \
    -l perl \
    -c /path/to/config/file.json \
    -o /path/to/output/folder

Bang, all done. Run the `autodoc` script in the `bin` directory to see the API 
you just built. 

# AUTOMATIC DOCUMENTATION

You can print out a summary of the generated API by running the included
`autodoc` script in the `bin` directory of your generated library. A few
output formats are supported:

          Usage: autodoc [OPTION]

    -w           wide format (default)
    -n           narrow format
    -p           POD format 
    -H           HTML format 
    -m           Markdown format
    -h           print this help message
    -c           your application class
    

The `-c` option allows you to load and inspect your own application. A dummy
namespace is used if you don't supply your own class.

# DOCUMENTATION FROM THE OpenAPI Spec

Additional documentation for each class and method may be provided by the Swagger 
spec. If so, this is available via the `class_documentation()` and 
`method_documentation()` methods on each generated object class, and the 
`method_documentation()` method on the endpoint API classes: 

        my $cmdoc = $api->pet_api->method_documentation->{$method_name}; 
        
        my $odoc = $api->get_pet_by_id->(pet_id => $pet_id)->class_documentation;                                  
        my $omdoc = $api->get_pet_by_id->(pet_id => $pet_id)->method_documentation->{method_name}; 
        

Each of these calls returns a hashref with various useful pieces of information.

# LOAD THE MODULES

To load the API packages:
```perl
use WWW::SwaggerClient::ApplicationEndpointsApi;
use WWW::SwaggerClient::AuthenticationApi;
use WWW::SwaggerClient::ConnectorsApi;
use WWW::SwaggerClient::CorrelationsApi;
use WWW::SwaggerClient::MeasurementsApi;
use WWW::SwaggerClient::OrganizationsApi;
use WWW::SwaggerClient::PairsApi;
use WWW::SwaggerClient::RemindersApi;
use WWW::SwaggerClient::TagsApi;
use WWW::SwaggerClient::UnitsApi;
use WWW::SwaggerClient::UserApi;
use WWW::SwaggerClient::VariablesApi;
use WWW::SwaggerClient::VotesApi;

```

To load the models:
```perl
use WWW::SwaggerClient::Object::CommonResponse;
use WWW::SwaggerClient::Object::Connection;
use WWW::SwaggerClient::Object::Connector;
use WWW::SwaggerClient::Object::ConnectorInfo;
use WWW::SwaggerClient::Object::ConnectorInfoHistoryItem;
use WWW::SwaggerClient::Object::ConnectorInstruction;
use WWW::SwaggerClient::Object::ConversionStep;
use WWW::SwaggerClient::Object::Correlation;
use WWW::SwaggerClient::Object::Credential;
use WWW::SwaggerClient::Object::HumanTime;
use WWW::SwaggerClient::Object::InlineResponse200;
use WWW::SwaggerClient::Object::InlineResponse2001;
use WWW::SwaggerClient::Object::InlineResponse20010;
use WWW::SwaggerClient::Object::InlineResponse20011;
use WWW::SwaggerClient::Object::InlineResponse20012;
use WWW::SwaggerClient::Object::InlineResponse2002;
use WWW::SwaggerClient::Object::InlineResponse2003;
use WWW::SwaggerClient::Object::InlineResponse2004;
use WWW::SwaggerClient::Object::InlineResponse2005;
use WWW::SwaggerClient::Object::InlineResponse2006;
use WWW::SwaggerClient::Object::InlineResponse2007;
use WWW::SwaggerClient::Object::InlineResponse2008;
use WWW::SwaggerClient::Object::InlineResponse2009;
use WWW::SwaggerClient::Object::JsonErrorResponse;
use WWW::SwaggerClient::Object::Measurement;
use WWW::SwaggerClient::Object::MeasurementDelete;
use WWW::SwaggerClient::Object::MeasurementRange;
use WWW::SwaggerClient::Object::MeasurementSet;
use WWW::SwaggerClient::Object::MeasurementSource;
use WWW::SwaggerClient::Object::Pairs;
use WWW::SwaggerClient::Object::Permission;
use WWW::SwaggerClient::Object::PostCorrelation;
use WWW::SwaggerClient::Object::PostVote;
use WWW::SwaggerClient::Object::TrackingReminder;
use WWW::SwaggerClient::Object::TrackingReminderDelete;
use WWW::SwaggerClient::Object::TrackingReminderNotification;
use WWW::SwaggerClient::Object::TrackingReminderNotificationSkip;
use WWW::SwaggerClient::Object::TrackingReminderNotificationSnooze;
use WWW::SwaggerClient::Object::TrackingReminderNotificationTrack;
use WWW::SwaggerClient::Object::Unit;
use WWW::SwaggerClient::Object::UnitCategory;
use WWW::SwaggerClient::Object::Update;
use WWW::SwaggerClient::Object::User;
use WWW::SwaggerClient::Object::UserTag;
use WWW::SwaggerClient::Object::UserTokenFailedResponse;
use WWW::SwaggerClient::Object::UserTokenRequest;
use WWW::SwaggerClient::Object::UserTokenRequestInnerUserField;
use WWW::SwaggerClient::Object::UserTokenSuccessfulResponse;
use WWW::SwaggerClient::Object::UserTokenSuccessfulResponseInnerUserField;
use WWW::SwaggerClient::Object::UserVariable;
use WWW::SwaggerClient::Object::UserVariableRelationship;
use WWW::SwaggerClient::Object::UserVariables;
use WWW::SwaggerClient::Object::ValueObject;
use WWW::SwaggerClient::Object::Variable;
use WWW::SwaggerClient::Object::VariableCategory;
use WWW::SwaggerClient::Object::VariableNew;
use WWW::SwaggerClient::Object::VariableUserSource;
use WWW::SwaggerClient::Object::VariablesNew;
use WWW::SwaggerClient::Object::Vote;
use WWW::SwaggerClient::Object::VoteDelete;

````

# GETTING STARTED
Put the Perl SDK under the 'lib' folder in your project directory, then run the following
```perl
#!/usr/bin/perl
use lib 'lib';
use strict;
use warnings;
# load the API package
use WWW::SwaggerClient::ApplicationEndpointsApi;
use WWW::SwaggerClient::AuthenticationApi;
use WWW::SwaggerClient::ConnectorsApi;
use WWW::SwaggerClient::CorrelationsApi;
use WWW::SwaggerClient::MeasurementsApi;
use WWW::SwaggerClient::OrganizationsApi;
use WWW::SwaggerClient::PairsApi;
use WWW::SwaggerClient::RemindersApi;
use WWW::SwaggerClient::TagsApi;
use WWW::SwaggerClient::UnitsApi;
use WWW::SwaggerClient::UserApi;
use WWW::SwaggerClient::VariablesApi;
use WWW::SwaggerClient::VotesApi;

# load the models
use WWW::SwaggerClient::Object::CommonResponse;
use WWW::SwaggerClient::Object::Connection;
use WWW::SwaggerClient::Object::Connector;
use WWW::SwaggerClient::Object::ConnectorInfo;
use WWW::SwaggerClient::Object::ConnectorInfoHistoryItem;
use WWW::SwaggerClient::Object::ConnectorInstruction;
use WWW::SwaggerClient::Object::ConversionStep;
use WWW::SwaggerClient::Object::Correlation;
use WWW::SwaggerClient::Object::Credential;
use WWW::SwaggerClient::Object::HumanTime;
use WWW::SwaggerClient::Object::InlineResponse200;
use WWW::SwaggerClient::Object::InlineResponse2001;
use WWW::SwaggerClient::Object::InlineResponse20010;
use WWW::SwaggerClient::Object::InlineResponse20011;
use WWW::SwaggerClient::Object::InlineResponse20012;
use WWW::SwaggerClient::Object::InlineResponse2002;
use WWW::SwaggerClient::Object::InlineResponse2003;
use WWW::SwaggerClient::Object::InlineResponse2004;
use WWW::SwaggerClient::Object::InlineResponse2005;
use WWW::SwaggerClient::Object::InlineResponse2006;
use WWW::SwaggerClient::Object::InlineResponse2007;
use WWW::SwaggerClient::Object::InlineResponse2008;
use WWW::SwaggerClient::Object::InlineResponse2009;
use WWW::SwaggerClient::Object::JsonErrorResponse;
use WWW::SwaggerClient::Object::Measurement;
use WWW::SwaggerClient::Object::MeasurementDelete;
use WWW::SwaggerClient::Object::MeasurementRange;
use WWW::SwaggerClient::Object::MeasurementSet;
use WWW::SwaggerClient::Object::MeasurementSource;
use WWW::SwaggerClient::Object::Pairs;
use WWW::SwaggerClient::Object::Permission;
use WWW::SwaggerClient::Object::PostCorrelation;
use WWW::SwaggerClient::Object::PostVote;
use WWW::SwaggerClient::Object::TrackingReminder;
use WWW::SwaggerClient::Object::TrackingReminderDelete;
use WWW::SwaggerClient::Object::TrackingReminderNotification;
use WWW::SwaggerClient::Object::TrackingReminderNotificationSkip;
use WWW::SwaggerClient::Object::TrackingReminderNotificationSnooze;
use WWW::SwaggerClient::Object::TrackingReminderNotificationTrack;
use WWW::SwaggerClient::Object::Unit;
use WWW::SwaggerClient::Object::UnitCategory;
use WWW::SwaggerClient::Object::Update;
use WWW::SwaggerClient::Object::User;
use WWW::SwaggerClient::Object::UserTag;
use WWW::SwaggerClient::Object::UserTokenFailedResponse;
use WWW::SwaggerClient::Object::UserTokenRequest;
use WWW::SwaggerClient::Object::UserTokenRequestInnerUserField;
use WWW::SwaggerClient::Object::UserTokenSuccessfulResponse;
use WWW::SwaggerClient::Object::UserTokenSuccessfulResponseInnerUserField;
use WWW::SwaggerClient::Object::UserVariable;
use WWW::SwaggerClient::Object::UserVariableRelationship;
use WWW::SwaggerClient::Object::UserVariables;
use WWW::SwaggerClient::Object::ValueObject;
use WWW::SwaggerClient::Object::Variable;
use WWW::SwaggerClient::Object::VariableCategory;
use WWW::SwaggerClient::Object::VariableNew;
use WWW::SwaggerClient::Object::VariableUserSource;
use WWW::SwaggerClient::Object::VariablesNew;
use WWW::SwaggerClient::Object::Vote;
use WWW::SwaggerClient::Object::VoteDelete;

# for displaying the API response data
use Data::Dumper;

# Configure OAuth2 access token for authorization: oauth2
$WWW::SwaggerClient::Configuration::access_token = 'YOUR_ACCESS_TOKEN';
# Configure API key authorization: internalApiKey
$WWW::SwaggerClient::Configuration::api_key->{'api_key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$WWW::SwaggerClient::Configuration::api_key_prefix->{'api_key'} = 'Bearer';

my $api_instance = WWW::SwaggerClient::ApplicationEndpointsApi->new();
my $access_token = 'access_token_example'; # string | Application's OAuth2 access token
my $connector_id = 56; # int | The id for the connector data source for which the connection is connected
my $connect_status = 'connect_status_example'; # string | Indicates whether a connector is currently connected to a service for a user.
my $connect_error = 'connect_error_example'; # string | Error message if there is a problem with authorizing this connection.
my $update_requested_at = 'update_requested_at_example'; # string | Time at which an update was requested by a user.
my $update_status = 'update_status_example'; # string | Indicates whether a connector is currently updated.
my $update_error = 'update_error_example'; # string | Indicates if there was an error during the update.
my $last_successful_updated_at = 'last_successful_updated_at_example'; # string | The time at which the connector was last successfully updated.
my $created_at = 'created_at_example'; # string | When the record was first created. Use ISO 8601 datetime format 
my $updated_at = 'updated_at_example'; # string | When the record was last updated. Use ISO 8601 datetime format 
my $limit = 56; # int | The LIMIT is used to limit the number of results returned. So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.
my $offset = 56; # int | OFFSET says to skip that many rows before beginning to return rows to the client. OFFSET 0 is the same as omitting the OFFSET clause. If both OFFSET and LIMIT appear, then OFFSET rows are skipped before starting to count the LIMIT rows that are returned.
my $sort = 'sort_example'; # string | Sort by given field. If the field is prefixed with '-', it will sort in descending order.

eval {
    my $result = $api_instance->v2_application_connections_get(access_token => $access_token, connector_id => $connector_id, connect_status => $connect_status, connect_error => $connect_error, update_requested_at => $update_requested_at, update_status => $update_status, update_error => $update_error, last_successful_updated_at => $last_successful_updated_at, created_at => $created_at, updated_at => $updated_at, limit => $limit, offset => $offset, sort => $sort);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ApplicationEndpointsApi->v2_application_connections_get: $@\n";
}

```

# DOCUMENTATION FOR API ENDPOINTS

All URIs are relative to *https://app.quantimo.do/api*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ApplicationEndpointsApi* | [**v2_application_connections_get**](docs/ApplicationEndpointsApi.md#v2_application_connections_get) | **GET** /v2/application/connections | Get all Connections
*ApplicationEndpointsApi* | [**v2_application_credentials_get**](docs/ApplicationEndpointsApi.md#v2_application_credentials_get) | **GET** /v2/application/credentials | Get all Credentials
*ApplicationEndpointsApi* | [**v2_application_measurements_get**](docs/ApplicationEndpointsApi.md#v2_application_measurements_get) | **GET** /v2/application/measurements | Get measurements for all users using your application
*ApplicationEndpointsApi* | [**v2_application_tracking_reminders_get**](docs/ApplicationEndpointsApi.md#v2_application_tracking_reminders_get) | **GET** /v2/application/trackingReminders | Get tracking reminders
*ApplicationEndpointsApi* | [**v2_application_updates_get**](docs/ApplicationEndpointsApi.md#v2_application_updates_get) | **GET** /v2/application/updates | Get all Updates
*ApplicationEndpointsApi* | [**v2_application_user_variable_relationships_get**](docs/ApplicationEndpointsApi.md#v2_application_user_variable_relationships_get) | **GET** /v2/application/userVariableRelationships | Get all UserVariableRelationships
*ApplicationEndpointsApi* | [**v2_application_user_variables_get**](docs/ApplicationEndpointsApi.md#v2_application_user_variables_get) | **GET** /v2/application/userVariables | Get all UserVariables
*ApplicationEndpointsApi* | [**v2_application_variable_user_sources_get**](docs/ApplicationEndpointsApi.md#v2_application_variable_user_sources_get) | **GET** /v2/application/variableUserSources | Get all VariableUserSources
*ApplicationEndpointsApi* | [**v2_application_votes_get**](docs/ApplicationEndpointsApi.md#v2_application_votes_get) | **GET** /v2/application/votes | Get all Votes
*AuthenticationApi* | [**v2_auth_social_authorize_code_get**](docs/AuthenticationApi.md#v2_auth_social_authorize_code_get) | **GET** /v2/auth/social/authorizeCode | Second Step in Social Authentication flow with JWT Token
*AuthenticationApi* | [**v2_auth_social_authorize_token_get**](docs/AuthenticationApi.md#v2_auth_social_authorize_token_get) | **GET** /v2/auth/social/authorizeToken | Native Social Authentication
*AuthenticationApi* | [**v2_auth_social_login_get**](docs/AuthenticationApi.md#v2_auth_social_login_get) | **GET** /v2/auth/social/login | First Setp in Social Authentication flow with JWT Token
*AuthenticationApi* | [**v2_oauth2_access_token_get**](docs/AuthenticationApi.md#v2_oauth2_access_token_get) | **GET** /v2/oauth2/access_token | Get a user access token
*AuthenticationApi* | [**v2_oauth_authorize_get**](docs/AuthenticationApi.md#v2_oauth_authorize_get) | **GET** /v2/oauth/authorize | Request Authorization Code
*ConnectorsApi* | [**v1_connect_js_get**](docs/ConnectorsApi.md#v1_connect_js_get) | **GET** /v1/connect.js | Get embeddable connect javascript
*ConnectorsApi* | [**v1_connect_mobile_get**](docs/ConnectorsApi.md#v1_connect_mobile_get) | **GET** /v1/connect/mobile | Mobile connect page
*ConnectorsApi* | [**v1_connectors_connector_connect_get**](docs/ConnectorsApi.md#v1_connectors_connector_connect_get) | **GET** /v1/connectors/{connector}/connect | Obtain a token from 3rd party data source
*ConnectorsApi* | [**v1_connectors_connector_connect_instructions_get**](docs/ConnectorsApi.md#v1_connectors_connector_connect_instructions_get) | **GET** /v1/connectors/{connector}/connectInstructions | Connection Instructions
*ConnectorsApi* | [**v1_connectors_connector_connect_parameter_get**](docs/ConnectorsApi.md#v1_connectors_connector_connect_parameter_get) | **GET** /v1/connectors/{connector}/connectParameter | Connect Parameter
*ConnectorsApi* | [**v1_connectors_connector_disconnect_get**](docs/ConnectorsApi.md#v1_connectors_connector_disconnect_get) | **GET** /v1/connectors/{connector}/disconnect | Delete stored connection info
*ConnectorsApi* | [**v1_connectors_connector_info_get**](docs/ConnectorsApi.md#v1_connectors_connector_info_get) | **GET** /v1/connectors/{connector}/info | Get connector info for user
*ConnectorsApi* | [**v1_connectors_connector_update_get**](docs/ConnectorsApi.md#v1_connectors_connector_update_get) | **GET** /v1/connectors/{connector}/update | Sync with data source
*ConnectorsApi* | [**v1_connectors_list_get**](docs/ConnectorsApi.md#v1_connectors_list_get) | **GET** /v1/connectors/list | List of Connectors
*CorrelationsApi* | [**v1_aggregated_correlations_get**](docs/CorrelationsApi.md#v1_aggregated_correlations_get) | **GET** /v1/aggregatedCorrelations | Get aggregated correlations
*CorrelationsApi* | [**v1_aggregated_correlations_post**](docs/CorrelationsApi.md#v1_aggregated_correlations_post) | **POST** /v1/aggregatedCorrelations | Store or Update a Correlation
*CorrelationsApi* | [**v1_correlations_get**](docs/CorrelationsApi.md#v1_correlations_get) | **GET** /v1/correlations | Get correlations
*CorrelationsApi* | [**v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get**](docs/CorrelationsApi.md#v1_organizations_organization_id_users_user_id_variables_variable_name_causes_get) | **GET** /v1/organizations/{organizationId}/users/{userId}/variables/{variableName}/causes | Search user correlations for a given cause
*CorrelationsApi* | [**v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get**](docs/CorrelationsApi.md#v1_organizations_organization_id_users_user_id_variables_variable_name_effects_get) | **GET** /v1/organizations/{organizationId}/users/{userId}/variables/{variableName}/effects | Search user correlations for a given cause
*CorrelationsApi* | [**v1_public_correlations_search_search_get**](docs/CorrelationsApi.md#v1_public_correlations_search_search_get) | **GET** /v1/public/correlations/search/{search} | Get average correlations for variables containing search term
*CorrelationsApi* | [**v1_variables_variable_name_causes_get**](docs/CorrelationsApi.md#v1_variables_variable_name_causes_get) | **GET** /v1/variables/{variableName}/causes | Search user correlations for a given effect
*CorrelationsApi* | [**v1_variables_variable_name_effects_get**](docs/CorrelationsApi.md#v1_variables_variable_name_effects_get) | **GET** /v1/variables/{variableName}/effects | Search user correlations for a given cause
*CorrelationsApi* | [**v1_variables_variable_name_public_causes_get**](docs/CorrelationsApi.md#v1_variables_variable_name_public_causes_get) | **GET** /v1/variables/{variableName}/public/causes | Search public correlations for a given effect
*CorrelationsApi* | [**v1_variables_variable_name_public_effects_get**](docs/CorrelationsApi.md#v1_variables_variable_name_public_effects_get) | **GET** /v1/variables/{variableName}/public/effects | Search public correlations for a given cause
*CorrelationsApi* | [**v1_votes_delete_post**](docs/CorrelationsApi.md#v1_votes_delete_post) | **POST** /v1/votes/delete | Delete vote
*CorrelationsApi* | [**v1_votes_post**](docs/CorrelationsApi.md#v1_votes_post) | **POST** /v1/votes | Post or update vote
*MeasurementsApi* | [**v1_measurement_sources_get**](docs/MeasurementsApi.md#v1_measurement_sources_get) | **GET** /v1/measurementSources | Get measurement sources
*MeasurementsApi* | [**v1_measurement_sources_post**](docs/MeasurementsApi.md#v1_measurement_sources_post) | **POST** /v1/measurementSources | Add a data source
*MeasurementsApi* | [**v1_measurements_daily_get**](docs/MeasurementsApi.md#v1_measurements_daily_get) | **GET** /v1/measurements/daily | Get daily measurements for this user
*MeasurementsApi* | [**v1_measurements_delete_post**](docs/MeasurementsApi.md#v1_measurements_delete_post) | **POST** /v1/measurements/delete | Delete a measurement
*MeasurementsApi* | [**v1_measurements_get**](docs/MeasurementsApi.md#v1_measurements_get) | **GET** /v1/measurements | Get measurements for this user
*MeasurementsApi* | [**v1_measurements_post**](docs/MeasurementsApi.md#v1_measurements_post) | **POST** /v1/measurements | Post a new set or update existing measurements to the database
*MeasurementsApi* | [**v1_measurements_range_get**](docs/MeasurementsApi.md#v1_measurements_range_get) | **GET** /v1/measurementsRange | Get measurements range for this user
*MeasurementsApi* | [**v2_measurements_csv_get**](docs/MeasurementsApi.md#v2_measurements_csv_get) | **GET** /v2/measurements/csv | Get Measurements CSV
*MeasurementsApi* | [**v2_measurements_id_delete**](docs/MeasurementsApi.md#v2_measurements_id_delete) | **DELETE** /v2/measurements/{id} | Delete Measurement
*MeasurementsApi* | [**v2_measurements_id_get**](docs/MeasurementsApi.md#v2_measurements_id_get) | **GET** /v2/measurements/{id} | Get Measurement
*MeasurementsApi* | [**v2_measurements_id_put**](docs/MeasurementsApi.md#v2_measurements_id_put) | **PUT** /v2/measurements/{id} | Update Measurement
*MeasurementsApi* | [**v2_measurements_request_csv_post**](docs/MeasurementsApi.md#v2_measurements_request_csv_post) | **POST** /v2/measurements/request_csv | Post Request for Measurements CSV
*MeasurementsApi* | [**v2_measurements_request_pdf_post**](docs/MeasurementsApi.md#v2_measurements_request_pdf_post) | **POST** /v2/measurements/request_pdf | Post Request for Measurements PDF
*MeasurementsApi* | [**v2_measurements_request_xls_post**](docs/MeasurementsApi.md#v2_measurements_request_xls_post) | **POST** /v2/measurements/request_xls | Post Request for Measurements XLS
*OrganizationsApi* | [**v1_organizations_organization_id_users_post**](docs/OrganizationsApi.md#v1_organizations_organization_id_users_post) | **POST** /v1/organizations/{organizationId}/users | Get user tokens for existing users, create new users
*PairsApi* | [**v1_pairs_csv_get**](docs/PairsApi.md#v1_pairs_csv_get) | **GET** /v1/pairsCsv | Get pairs
*PairsApi* | [**v1_pairs_get**](docs/PairsApi.md#v1_pairs_get) | **GET** /v1/pairs | Get pairs
*RemindersApi* | [**v1_tracking_reminder_notifications_get**](docs/RemindersApi.md#v1_tracking_reminder_notifications_get) | **GET** /v1/trackingReminderNotifications | Get specific pending tracking reminders
*RemindersApi* | [**v1_tracking_reminder_notifications_skip_post**](docs/RemindersApi.md#v1_tracking_reminder_notifications_skip_post) | **POST** /v1/trackingReminderNotifications/skip | Skip a pending tracking reminder
*RemindersApi* | [**v1_tracking_reminder_notifications_snooze_post**](docs/RemindersApi.md#v1_tracking_reminder_notifications_snooze_post) | **POST** /v1/trackingReminderNotifications/snooze | Snooze a pending tracking reminder
*RemindersApi* | [**v1_tracking_reminder_notifications_track_post**](docs/RemindersApi.md#v1_tracking_reminder_notifications_track_post) | **POST** /v1/trackingReminderNotifications/track | Track a pending tracking reminder
*RemindersApi* | [**v1_tracking_reminders_delete_post**](docs/RemindersApi.md#v1_tracking_reminders_delete_post) | **POST** /v1/trackingReminders/delete | Delete tracking reminder
*RemindersApi* | [**v1_tracking_reminders_get**](docs/RemindersApi.md#v1_tracking_reminders_get) | **GET** /v1/trackingReminders | Get repeating tracking reminder settings
*RemindersApi* | [**v1_tracking_reminders_post**](docs/RemindersApi.md#v1_tracking_reminders_post) | **POST** /v1/trackingReminders | Store a Tracking Reminder
*TagsApi* | [**v1_user_tags_delete_post**](docs/TagsApi.md#v1_user_tags_delete_post) | **POST** /v1/userTags/delete | Delete user tag or ingredient
*TagsApi* | [**v1_user_tags_post**](docs/TagsApi.md#v1_user_tags_post) | **POST** /v1/userTags | Post or update user tags or ingredients
*UnitsApi* | [**v1_unit_categories_get**](docs/UnitsApi.md#v1_unit_categories_get) | **GET** /v1/unitCategories | Get unit categories
*UnitsApi* | [**v1_units_get**](docs/UnitsApi.md#v1_units_get) | **GET** /v1/units | Get all available units
*UnitsApi* | [**v1_units_variable_get**](docs/UnitsApi.md#v1_units_variable_get) | **GET** /v1/unitsVariable | Units for Variable
*UserApi* | [**v1_organizations_organization_id_users_post**](docs/UserApi.md#v1_organizations_organization_id_users_post) | **POST** /v1/organizations/{organizationId}/users | Get user tokens for existing users, create new users
*UserApi* | [**v1_user_me_get**](docs/UserApi.md#v1_user_me_get) | **GET** /v1/user/me | Get all available units for variableGet authenticated user
*VariablesApi* | [**v1_public_variables_get**](docs/VariablesApi.md#v1_public_variables_get) | **GET** /v1/public/variables | Get public variables
*VariablesApi* | [**v1_public_variables_search_search_get**](docs/VariablesApi.md#v1_public_variables_search_search_get) | **GET** /v1/public/variables/search/{search} | Get top 5 PUBLIC variables with the most correlations
*VariablesApi* | [**v1_user_variables_post**](docs/VariablesApi.md#v1_user_variables_post) | **POST** /v1/userVariables | Update User Settings for a Variable
*VariablesApi* | [**v1_variable_categories_get**](docs/VariablesApi.md#v1_variable_categories_get) | **GET** /v1/variableCategories | Variable categories
*VariablesApi* | [**v1_variables_get**](docs/VariablesApi.md#v1_variables_get) | **GET** /v1/variables | Get variables by the category name
*VariablesApi* | [**v1_variables_post**](docs/VariablesApi.md#v1_variables_post) | **POST** /v1/variables | Create Variables
*VariablesApi* | [**v1_variables_search_search_get**](docs/VariablesApi.md#v1_variables_search_search_get) | **GET** /v1/variables/search/{search} | Get variables by search query
*VariablesApi* | [**v1_variables_variable_name_get**](docs/VariablesApi.md#v1_variables_variable_name_get) | **GET** /v1/variables/{variableName} | Get info about a variable
*VotesApi* | [**v1_votes_delete_post**](docs/VotesApi.md#v1_votes_delete_post) | **POST** /v1/votes/delete | Delete vote
*VotesApi* | [**v1_votes_post**](docs/VotesApi.md#v1_votes_post) | **POST** /v1/votes | Post or update vote


# DOCUMENTATION FOR MODELS
 - [WWW::SwaggerClient::Object::CommonResponse](docs/CommonResponse.md)
 - [WWW::SwaggerClient::Object::Connection](docs/Connection.md)
 - [WWW::SwaggerClient::Object::Connector](docs/Connector.md)
 - [WWW::SwaggerClient::Object::ConnectorInfo](docs/ConnectorInfo.md)
 - [WWW::SwaggerClient::Object::ConnectorInfoHistoryItem](docs/ConnectorInfoHistoryItem.md)
 - [WWW::SwaggerClient::Object::ConnectorInstruction](docs/ConnectorInstruction.md)
 - [WWW::SwaggerClient::Object::ConversionStep](docs/ConversionStep.md)
 - [WWW::SwaggerClient::Object::Correlation](docs/Correlation.md)
 - [WWW::SwaggerClient::Object::Credential](docs/Credential.md)
 - [WWW::SwaggerClient::Object::HumanTime](docs/HumanTime.md)
 - [WWW::SwaggerClient::Object::InlineResponse200](docs/InlineResponse200.md)
 - [WWW::SwaggerClient::Object::InlineResponse2001](docs/InlineResponse2001.md)
 - [WWW::SwaggerClient::Object::InlineResponse20010](docs/InlineResponse20010.md)
 - [WWW::SwaggerClient::Object::InlineResponse20011](docs/InlineResponse20011.md)
 - [WWW::SwaggerClient::Object::InlineResponse20012](docs/InlineResponse20012.md)
 - [WWW::SwaggerClient::Object::InlineResponse2002](docs/InlineResponse2002.md)
 - [WWW::SwaggerClient::Object::InlineResponse2003](docs/InlineResponse2003.md)
 - [WWW::SwaggerClient::Object::InlineResponse2004](docs/InlineResponse2004.md)
 - [WWW::SwaggerClient::Object::InlineResponse2005](docs/InlineResponse2005.md)
 - [WWW::SwaggerClient::Object::InlineResponse2006](docs/InlineResponse2006.md)
 - [WWW::SwaggerClient::Object::InlineResponse2007](docs/InlineResponse2007.md)
 - [WWW::SwaggerClient::Object::InlineResponse2008](docs/InlineResponse2008.md)
 - [WWW::SwaggerClient::Object::InlineResponse2009](docs/InlineResponse2009.md)
 - [WWW::SwaggerClient::Object::JsonErrorResponse](docs/JsonErrorResponse.md)
 - [WWW::SwaggerClient::Object::Measurement](docs/Measurement.md)
 - [WWW::SwaggerClient::Object::MeasurementDelete](docs/MeasurementDelete.md)
 - [WWW::SwaggerClient::Object::MeasurementRange](docs/MeasurementRange.md)
 - [WWW::SwaggerClient::Object::MeasurementSet](docs/MeasurementSet.md)
 - [WWW::SwaggerClient::Object::MeasurementSource](docs/MeasurementSource.md)
 - [WWW::SwaggerClient::Object::Pairs](docs/Pairs.md)
 - [WWW::SwaggerClient::Object::Permission](docs/Permission.md)
 - [WWW::SwaggerClient::Object::PostCorrelation](docs/PostCorrelation.md)
 - [WWW::SwaggerClient::Object::PostVote](docs/PostVote.md)
 - [WWW::SwaggerClient::Object::TrackingReminder](docs/TrackingReminder.md)
 - [WWW::SwaggerClient::Object::TrackingReminderDelete](docs/TrackingReminderDelete.md)
 - [WWW::SwaggerClient::Object::TrackingReminderNotification](docs/TrackingReminderNotification.md)
 - [WWW::SwaggerClient::Object::TrackingReminderNotificationSkip](docs/TrackingReminderNotificationSkip.md)
 - [WWW::SwaggerClient::Object::TrackingReminderNotificationSnooze](docs/TrackingReminderNotificationSnooze.md)
 - [WWW::SwaggerClient::Object::TrackingReminderNotificationTrack](docs/TrackingReminderNotificationTrack.md)
 - [WWW::SwaggerClient::Object::Unit](docs/Unit.md)
 - [WWW::SwaggerClient::Object::UnitCategory](docs/UnitCategory.md)
 - [WWW::SwaggerClient::Object::Update](docs/Update.md)
 - [WWW::SwaggerClient::Object::User](docs/User.md)
 - [WWW::SwaggerClient::Object::UserTag](docs/UserTag.md)
 - [WWW::SwaggerClient::Object::UserTokenFailedResponse](docs/UserTokenFailedResponse.md)
 - [WWW::SwaggerClient::Object::UserTokenRequest](docs/UserTokenRequest.md)
 - [WWW::SwaggerClient::Object::UserTokenRequestInnerUserField](docs/UserTokenRequestInnerUserField.md)
 - [WWW::SwaggerClient::Object::UserTokenSuccessfulResponse](docs/UserTokenSuccessfulResponse.md)
 - [WWW::SwaggerClient::Object::UserTokenSuccessfulResponseInnerUserField](docs/UserTokenSuccessfulResponseInnerUserField.md)
 - [WWW::SwaggerClient::Object::UserVariable](docs/UserVariable.md)
 - [WWW::SwaggerClient::Object::UserVariableRelationship](docs/UserVariableRelationship.md)
 - [WWW::SwaggerClient::Object::UserVariables](docs/UserVariables.md)
 - [WWW::SwaggerClient::Object::ValueObject](docs/ValueObject.md)
 - [WWW::SwaggerClient::Object::Variable](docs/Variable.md)
 - [WWW::SwaggerClient::Object::VariableCategory](docs/VariableCategory.md)
 - [WWW::SwaggerClient::Object::VariableNew](docs/VariableNew.md)
 - [WWW::SwaggerClient::Object::VariableUserSource](docs/VariableUserSource.md)
 - [WWW::SwaggerClient::Object::VariablesNew](docs/VariablesNew.md)
 - [WWW::SwaggerClient::Object::Vote](docs/Vote.md)
 - [WWW::SwaggerClient::Object::VoteDelete](docs/VoteDelete.md)


# DOCUMENTATION FOR AUTHORIATION

## oauth2

- **Type**: OAuth
- **Flow**: implicit
- **Authorization URL**: https://app.quantimo.do/api/v1/oauth2/authorize
- **Scopes**: 
  - **basic**: Basic authentication
  - **readmeasurements**: Grants read access to measurements and variables. Allows the client app to obtain the user's data.
  - **writemeasurements**: Grants write access to measurements and variables. Allows the client app to store user data.

## quantimodo_oauth2

- **Type**: OAuth
- **Flow**: accessCode
- **Authorization URL**: /api/v2/oauth/authorize
- **Scopes**: 
  - **basic**: allows you to read user info (displayname, email, etc).
  - **readmeasurements**: allows one to read a user's data
  - **writemeasurements**: allows you to write user data

## basicAuth

- **Type**: HTTP basic authentication

## internalApiKey

- **Type**: API key 
- **API key parameter name**: api_key
- **Location**: HTTP header



