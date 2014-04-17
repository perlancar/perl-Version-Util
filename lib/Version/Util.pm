package Version::Util;

use 5.010001;
use strict;
use version 0.77;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       cmp_version
                       version_eq version_ne
                       version_lt version_le version_gt version_ge
                       version_between version_in
               );

# VERSION

sub cmp_version {
    version->parse($_[0]) <=> version->parse($_[1]);
}

sub version_eq {
    version->parse($_[0]) == version->parse($_[1]);
}

sub version_ne {
    version->parse($_[0]) != version->parse($_[1]);
}

sub version_lt {
    version->parse($_[0]) <  version->parse($_[1]);
}

sub version_le {
    version->parse($_[0]) <= version->parse($_[1]);
}

sub version_gt {
    version->parse($_[0]) >  version->parse($_[1]);
}

sub version_ge {
    version->parse($_[0]) >= version->parse($_[1]);
}

sub version_between {
    my $v = version->parse(shift);
    while (@_) {
        my $v1 = shift;
        my $v2 = shift;
        return 1 if $v >= version->parse($v1) && $v <= version->parse($v2);
    }
    0;
}

sub version_in {
    my $v = version->parse(shift);
    for (@_) {
        return 1 if $v == version->parse($_);
    }
    0;
}

1;
# ABSTRACT: Version-number utilities

=head1 DESCRIPTION

This module provides several convenient functions related to version numbers,
e.g. for comparing them.


=head1 FUNCTIONS

=head2 cmp_version($v1, $v2) => -1|0|1

Equivalent to:

 version->parse($v1) <=> version->parse($v2)

=head2 version_eq($v1, $v2) => BOOL

=head2 version_ne($v1, $v2) => BOOL

=head2 version_lt($v1, $v2) => BOOL

=head2 version_le($v1, $v2) => BOOL

=head2 version_gt($v1, $v2) => BOOL

=head2 version_ge($v1, $v2) => BOOL

=head2 version_between($v, $v1, $v2[, $v1b, $v2b, ...]) => BOOL

=head2 version_in($v, $v1[, $v2, ...]) => BOOL


=head1 SEE ALSO

L<version>

=cut
