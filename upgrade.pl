#!/usr/bin/perl
use 5.26.0;
use warnings FATAL => 'all';
    
chdir("/home/nat/.emacs.d");

while (1) {
    say("\n\n");
    system("bin/doom upgrade");
    my $code = $? >> 8;
    say("Exited with code: $code");
    if ($code == 0) {
        exit(0);
    }
    say("Waiting 5 seconds...");
    sleep(5);
}
