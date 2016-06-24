=begin comment

QuantiModo

Welcome to QuantiModo API! QuantiModo makes it easy to retrieve normalized user data from a wide array of devices and applications. [Learn about QuantiModo](https://quantimo.do) or contact us at <api@quantimo.do>.         Before you get started, you will need to: * Sign in/Sign up, and add some data at [https://app.quantimo.do/api/v2/account/connectors](https://app.quantimo.do/api/v2/account/connectors) to try out the API for yourself * Create an app to get your client id and secret at [https://app.quantimo.do/api/v2/apps](https://app.quantimo.do/api/v2/apps) * As long as you're signed in, it will use your browser's cookie for authentication.  However, client applications must use OAuth2 tokens to access the API.     ## Application Endpoints These endpoints give you access to all authorized users' data for that application. ### Getting Application Token Make a `POST` request to `/api/v2/oauth/access_token`         * `grant_type` Must be `client_credentials`.         * `clientId` Your application's clientId.         * `client_secret` Your application's client_secret.         * `redirect_uri` Your application's redirect url.                ## Example Queries ### Query Options The standard query options for QuantiModo API are as described in the table below. These are the available query options in QuantiModo API: <table>            <thead>                <tr>                    <th>Parameter</th>                    <th>Description</th>                </tr>            </thead>            <tbody>                <tr>                    <td>limit</td>                    <td>The LIMIT is used to limit the number of results returned.  So if you have 1000 results, but only want to the first 10, you would set this to 10 and offset to 0. The maximum limit is 200 records.</td>                </tr>                <tr>                    <td>offset</td>                    <td>Suppose you wanted to show results 11-20. You'd set the    offset to 10 and the limit to 10.</td>                </tr>                <tr>                    <td>sort</td>                    <td>Sort by given field. If the field is prefixed with '-', it    will sort in descending order.</td>                </tr>            </tbody>        </table>         ### Pagination Conventions Since the maximum limit is 200 records, to get more than that you'll have to make multiple API calls and page through the results. To retrieve all the data, you can iterate through data by using the `limit` and `offset` query parameters.For example, if you want to retrieve data from 61-80 then you can use a query with the following parameters,         `/v2/variables?limit=20&offset=60`         Generally, you'll be retrieving new or updated user data. To avoid unnecessary API calls, you'll want to store your last refresh time locally.  Initially, it should be set to 0. Then whenever you make a request to get new data, you should limit the returned results to those updated since your last refresh by appending append         `?lastUpdated=(ge)&quot2013-01-D01T01:01:01&quot`         to your request.         Also for better pagination, you can get link to the records of first, last, next and previous page from response headers: * `Total-Count` - Total number of results for given query * `Link-First` - Link to get first page records * `Link-Last` - Link to get last page records * `Link-Prev` - Link to get previous records set * `Link-Next` - Link to get next records set         Remember, response header will be only sent when the record set is available. e.g. You will not get a ```Link-Last``` & ```Link-Next``` when you query for the last page.         ### Filter operators support API supports the following operators with filter parameters: <br> **Comparison operators**         Comparison operators allow you to limit results to those greater than, less than, or equal to a specified value for a specified attribute. These operators can be used with strings, numbers, and dates. The following comparison operators are available: * `gt` for `greater than` comparison * `ge` for `greater than or equal` comparison * `lt` for `less than` comparison * `le` for `less than or equal` comparison         They are included in queries using the following format:         `(<operator>)<value>`         For example, in order to filter value which is greater than 21, the following query parameter should be used:         `?value=(gt)21` <br><br> **Equals/In Operators**         It also allows filtering by the exact value of an attribute or by a set of values, depending on the type of value passed as a query parameter. If the value contains commas, the parameter is split on commas and used as array input for `IN` filtering, otherwise the exact match is applied. In order to only show records which have the value 42, the following query should be used:         `?value=42`         In order to filter records which have value 42 or 43, the following query should be used:         `?value=42,43` <br><br> **Like operators**         Like operators allow filtering using `LIKE` query. This operator is triggered if exact match operator is used, but value contains `%` sign as the first or last character. In order to filter records which category that start with `Food`, the following query should be used:         `?category=Food%` <br><br> **Negation operator**         It is possible to get negated results of a query by prefixed the operator with `!`. Some examples:         `//filter records except those with value are not 42 or 43`<br> `?value=!42,43`         `//filter records with value not greater than 21`<br> `?value=!(ge)21` <br><br> **Multiple constraints for single attribute**         It is possible to apply multiple constraints by providing an array of query filters:         Filter all records which value is greater than 20.2 and less than 20.3<br> `?value[]=(gt)20.2&value[]=(lt)20.3`         Filter all records which value is greater than 20.2 and less than 20.3 but not 20.2778<br> `?value[]=(gt)20.2&value[]=(lt)20.3&value[]=!20.2778`<br><br> 

OpenAPI spec version: 2.0.6

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
package WWW::SwaggerClient::Role::AutoDoc;
use List::MoreUtils qw(uniq);

use Moose::Role;

sub autodoc {
	my ($self, $how) = @_;
	
	die "Unknown format '$how'" unless $how =~ /^(pod|wide|narrow)$/;
	
	$self->_printisa($how);
	$self->_printmethods($how);
	$self->_printattrs($how);
	print "\n";
}

sub _printisa {
	my ($self, $how) = @_;	
	my $meta = $self->meta;
	
	my $myclass = ref $self;
	
	my $super = join ', ', $meta->superclasses;
	my @roles = $meta->calculate_all_roles;
	#shift(@roles) if @roles > 1; # if > 1, the first is a composite, the rest are the roles

	my $isa =   join ', ', grep {$_ ne $myclass} $meta->linearized_isa;
	my $sub =   join ', ', $meta->subclasses;
	my $dsub =  join ', ', $meta->direct_subclasses;
	
    my $app_name = $self->version_info->{app_name};
    my $app_version = $self->version_info->{app_version};
    my $generated_date = $self->version_info->{generated_date};
    my $generator_class = $self->version_info->{generator_class};

    $~ = $how eq 'pod' ? 'INHERIT_POD' : 'INHERIT';
    write;
	
	my ($rolepkg, $role_reqs);
	
	foreach my $role (@roles) {
		$rolepkg = $role->{package} || next; # some are anonymous, or something
		next if $rolepkg eq 'WWW::SwaggerClient::Role::AutoDoc';
		$role_reqs = join ', ', keys %{$role->{required_methods}};
		$role_reqs ||= '';
		$~ = $how eq 'pod' ? 'ROLES_POD' : 'ROLES';
		write;
	}
	
	if ($how eq 'pod') {
		$~ = 'ROLES_POD_CLOSE';
		write;
	}
	
# ----- format specs -----
	format INHERIT = 

@* -
$myclass
                  ISA: @*
                       $isa
    Direct subclasses: @*
                       $dsub
       All subclasses: @*
                       $sub
                       
           Target API: @* @*
                       $app_name, $app_version
         Generated on: @*
                       $generated_date
      Generator class: @* 
                       $generator_class
                       
.
	format ROLES =   
             Composes: ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~
                       $rolepkg
                       requires: ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~
                                 $role_reqs
                                 ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~~
                                 $role_reqs
.

	format INHERIT_POD =
=head1 NAME

@*
$myclass

=head1 VERSION

=head2 @* version: @*
       $app_name,  $app_version
       
Automatically generated by the Perl Swagger Codegen project: 

=over 4 

=item Build date: @*
                  $generated_date

=item Build package: @*
                     $generator_class

=item Codegen version: 


=back

=head1 INHERITANCE

=head2 Base class(es) 

@*
$isa

=head2 Direct subclasses

@*
$dsub
                   
=head2 All subclasses

@*
$sub

                
=head1 COMPOSITION

@* composes the following roles: 
$myclass 


.
	format ROLES_POD =
=head2 C<@*>
       $rolepkg
       
Requires:

@*
$role_reqs

.
	format ROLES_POD_CLOSE =


.
# ----- / format specs -----
}

sub _printmethods {
	my ($self, $how) = @_;
	
	if ($how eq 'narrow') {
		print <<HEAD;
METHODS
-------
HEAD
	}
	elsif ($how eq 'wide') {
		$~ = 'METHODHEAD';
		write;
	}
	elsif ($how eq 'pod') {
		$~ = 'METHODHEAD_POD';
		write;
	}
	else {
		die "Don't know how to print '$how'";
	}
	
	$self->_printmethod($_, $how) for uniq sort $self->meta->get_all_method_names; #$self->meta->get_method_list, 
	
	if ($how eq 'pod') {
		$~ = 'METHOD_POD_CLOSE';
		write;
	}


}

sub _printmethod {
	my ($self, $methodname, $how) = @_;
	return if $methodname =~ /^_/;
	return if $self->meta->has_attribute($methodname);
	my %internal = map {$_ => 1} qw(BUILD BUILDARGS meta can new DEMOLISHALL DESTROY 
		DOES isa BUILDALL does VERSION dump
		);
	return if $internal{$methodname};
	my $method = $self->meta->get_method($methodname) or return; # symbols imported into namespaces i.e. not known by Moose
	
	return if $method->original_package_name eq __PACKAGE__;
	
	my $delegate_to = '';
	my $via = '';
	my $on = '';
	my $doc = '';
	my $original_pkg = $method->original_package_name;
	if ($method->can('associated_attribute')) {
		$delegate_to = $method->delegate_to_method;
		my $aa = $method->associated_attribute;
		$on = $aa->{isa};
		$via = $aa->{name};
		$original_pkg = $on; 
		$doc = $original_pkg->method_documentation->{$delegate_to}->{summary};
	}
	else {
	    $doc = $method->documentation;
	}
	
	if ($how eq 'narrow') {
		$~ = 'METHOD_NARROW';
		write;
	}
	elsif ($how eq 'pod' and $delegate_to) {
		$~ = 'METHOD_POD_DELEGATED';
		write;
	}
	elsif ($how eq 'pod') {
		$~ = 'METHOD_POD';
		write;
	}
	else {
		$~ = 'METHOD';
		write;
	}
	
# ----- format specs -----
	format METHODHEAD =

METHODS
-------
Name                                                  delegates to                                             on                                      via
===========================================================================================================================================================================
.
	format METHOD = 
@<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<... @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<... @<<<<<<<<<<<<<<<<...
$methodname,                                          $delegate_to,                                            $on,                                    $via
.

	format METHOD_NARROW =
@*
$methodname
    original pkg: @*
                  $original_pkg
    delegates to: @*
                  $delegate_to
              on: @*
                  $on
             via: @*
                  $via

.

	format METHODHEAD_POD = 

=head1 METHODS

.
	
	format METHOD_POD = 
	
=head2 C<@*()>
       $methodname

       Defined in: @*
            $original_pkg


.
	format METHOD_POD_DELEGATED = 

=head2 C<@*()>
       $methodname

       Defined in: @*
       	           $original_pkg
     Delegates to: @*()
                   $delegate_to
               On: @* 
                   $on
              Via: @*()
                   $via
              Doc: @*
                   $doc
          Same as: $self->@*->@*()
                     $via, $delegate_to

.
	format METHOD_POD_CLOSE =
	
.
# ----- / format specs -----
}

sub _printattrs {
	my ($self, $how) = @_;
	
	if ($how eq 'narrow') {
		print <<HEAD;
ATTRIBUTES
----------
HEAD
	}
	elsif ($how eq 'wide') {
		$~ = 'ATTRHEAD';
		write;
	}
	elsif ($how eq 'pod') {
		$~ = 'ATTRHEAD_POD';
		write;
	}
	else {
		die "Don't know how to print attributes '$how'";
	}
	
	$self->_printattr($_, $how) for sort $self->meta->get_attribute_list;
	
	if ($how eq 'pod') {
		$~ = 'ATTR_POD_CLOSE';
		write;
	}
}

sub _printattr {
	my ($self, $attrname, $how) = @_;
	return if $attrname =~ /^_/;
	my $attr = $self->meta->get_attribute($attrname) or die "No attr for $attrname";
	
	my $is;
	$is = 'rw' if $attr->get_read_method && $attr->get_write_method;
	$is = 'ro' if $attr->get_read_method && ! $attr->get_write_method;
	$is = 'wo' if $attr->get_write_method && ! $attr->get_read_method;
	$is = '--' if ! $attr->get_write_method && ! $attr->get_read_method;
	$is or die "No \$is for $attrname";
	
	my $tc = $attr->type_constraint || '';
	my $from = $attr->associated_class->name || '';
	my $reqd = $attr->is_required ? 'yes' : 'no';
	my $lazy = $attr->is_lazy ? 'yes' : 'no';
	my $has_doc = $attr->has_documentation ? 'yes' : 'no'; # *_api attributes will never have doc, but other attributes might have
	my $doc = $attr->documentation || '';
	my $handles = join ', ', sort @{$attr->handles || []};
	$handles ||= '';
	
	if ($how eq 'narrow') {
		$~ = 'ATTR_NARROW';
	}
	elsif ($how eq 'pod') {
		$~ = 'ATTR_POD';
	}
	else {
		$~ = 'ATTR';
	}

	write;

# ----- format specs -----
	format ATTRHEAD =

ATTRIBUTES
----------
Name                is isa                       reqd lazy doc handles
==============================================================================================================
.	
	format ATTR = 
@<<<<<<<<<<<<<<<<<  @< @<<<<<<<<<<<<<<<<<<<<<<<< @<<< @<<< @<< ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
$attrname,          $is, $tc,                    $reqd, $lazy, $has_doc, $handles
                                                               ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~~
                                                               $handles
.

	format ATTR_NARROW = 
@*
$attrname
         is: @*
             $is
        isa: @*
             $tc
       reqd: @*
             $reqd
       lazy: @*
             $lazy
        doc: @*
             $doc
    handles: ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
             $handles
             ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~~
             $handles

.
	format ATTRHEAD_POD =
=head1 ATTRIBUTES

.
	format ATTR_POD =

=head2 C<@*>
         $attrname

         is: @*
             $is
        isa: @*
             $tc
       reqd: @*
             $reqd
       lazy: @*
             $lazy
        doc: @*
             $doc
    handles: ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
             $handles
             ^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~~
             $handles

.
	format ATTR_POD_CLOSE = 


.
# ----- / format specs -----
}



1;
