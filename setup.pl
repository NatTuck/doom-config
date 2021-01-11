#!/usr/bin/perl
use 5.20.0;
use warnings FATAL => 'all';

my $edir = `readlink -m ~/.emacs.d`;
chomp $edir;
unless (-e $edir) {
    system("git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d");
    system("sudo apt install emacs build-essential git shellcheck silversearcher-ag ripgrep fd-find");
    system("sudo apt install jq");
    system("$edir/bin/doom install");
}

system("$edir/bin/doom up");
system("$edir/bin/doom sync");
