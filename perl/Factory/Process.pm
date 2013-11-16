package Factory::Process;

use strict;
use warnings FATAL => 'all';

use Process;
use Factory::Allocation;

use Genome::Sys;


sub new {
    my $allocation = Factory::Allocation::from_kilobytes_requested(1024);

    my $process = Process->create(allocation => $allocation,
        owner => Genome::Sys->current_user,
        status => 'new');

    mkdir $process->log_directory;
    return $process;
}


1;
