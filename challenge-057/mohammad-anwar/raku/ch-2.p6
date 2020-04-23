#!/usr/bin/env perl6

use v6.d;

sub shortest-unique-prefix($words where .all ~~ Str) {
    my $p = [];
    for |$words -> $word {
        my $i = 1;
        my $l = $word.chars;
        while $i < $l {
            my $char  = $word.substr(0, $i);
            my $count = $words.grep({ m/^$char/ }).elems;

            $count > 1 && $i++ and next;
            $p.push: $char and last;
        }
    }

    return $p;
}

unit sub MAIN();

my $words  = [ "alphabet", "book", "carpet", "cadmium", "cadeau", "alpine" ];
my $unique = shortest-unique-prefix($words);

say sprintf("[ %s ]", $unique.join(", "));
