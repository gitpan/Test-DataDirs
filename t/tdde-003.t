#!/usr/bin/perl 
use strict;
use warnings;
use Test::More;
use FindBin qw($Bin);
use lib "$Bin/../lib";
use lib "$Bin/../ll/lib/perl5";

# Failures expected this time

{
    package B;
    use Test::Exception;

    # This should die because there is no dir data/tdde-002
    throws_ok {
        require 'Test/DataDirs/Exporter.pm';
        Test::DataDirs::Exporter->import(
            temp => [ip => 'hip'],
            data => [oo => 'moo'],
        );
    } qr{No such data directory '.*t/data/tdde-003/moo'},
        "No dir 'tdde-003'";

}

{
    package C;
    use Test::Exception;

    # This should die because there is no dir data/nonesuch
    throws_ok {
        require 'Test/DataDirs/Exporter.pm';
        Test::DataDirs::Exporter->import(
            base => 'zoon',
            temp => [ip => 'hig'],
            data => [oo => 'mog'],
        );
    } qr{No such data directory '.*t/data/zoon/mog'}, 
        "No dir 'zoon/mog'";
}

done_testing;
