use strict;
use warnings;

use Test::Builder::Tester tests => 3;
use Test::IsAny qw(is_any);

test_out('ok 1 - ');
is_any( 42, [ 1, 2, 42 ] );
test_test('is_any success');

test_out('not ok 1 - ');
my $expected_error = q{#   Failed test ''
#   at t/00-test.t line 19.
# Received: 42
# Expected:
#          1
#          2};
test_err($expected_error);
is_any( 42, [ 1, 2 ] );
test_test('is_any failure');

{
	test_out('ok 1 - The right answer');
	my $result   = 42;    # this is the result of the Application Under Test
	my @expected = ( 10, 71, 23, 42 );
	is_any( $result, \@expected, 'The right answer' );
	test_test('is_any success');
};

