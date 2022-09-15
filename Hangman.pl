#!/usr/bin/perl 
use warnings;
use strict;
use feature ":5.10";

my $SampleDictionary =
"computer,radio,calculator,teacher,bureau,police,geometry,president,subject,country,enviroment,classroom,animals,province,month,politics,puzzle,instrument,kitchen,language,vampire,ghost,solution,service,software,virus25,security,phonenumber,expert,website,agreement,support,compatibility,advanced,search,triathlon,immediately,encyclopedia,endurance,distance,nature,history,organization,international,championship,government,popularity,thousand,feature,wetsuit,fitness,legendary,variation,equal,approximately,segment,priority,physics,branche,science,mathematics,lightning,dispersion,accelerator,detector,terminology,design,operation,foundation,application,prediction,reference,measurement,concept,perspective,overview,position,airplane,symmetry,dimension,toxic,algebra,illustration,classic,verification,citation,unusual,resource,analysis,license,comedy,screenplay,production,release,emphasis,director,trademark,vehicle,aircraft,experiment";
my @sampleDictionaryArray = split( /,/, $SampleDictionary );   # array of words;
my $sizeOfDictionary = scalar @sampleDictionaryArray;    # number of words in dictionary
my $word = $sampleDictionaryArray[ int( rand($sizeOfDictionary) ) - 1 ]; # using a random number generator take any one word out of sample dictionary.
my @ourword = split( //, lc($word) );   # Word which is to be guessed (array of characters)
my @inputWord = ();                 #stores the correct input characters
my $n         = scalar @ourword;    # number of character in word to be geuessed
my $lives     = 6;                  # number of body parts remaining
my @Misses    = ();                 # Stores the wrong guesses.

for ( my $i = 0 ; $i < $n ; $i++ ) {
    push( @inputWord, '_' );
}

print "You have six lives everytime you guess one wrong character you'll lose one life\n";

while ( $lives > 0 ) {
    &playGame();
}

sub playGame { # sub routine for game.

    print "your word sofar :";
    print "@inputWord\n";
    print "Make a guess : ";
    my $guess = <>; # take input
    chomp($guess); #remove '\n'(new line character) from input
    $guess = lc($guess);
    my $CorrecGuess = 0;
    my $AlreadyGuessed = 0;
    for ( my $i = 0 ; $i < $n ; $i++ ) {

        if ( $ourword[$i] eq $guess ) {
            $CorrecGuess = 1;
            if ( $inputWord[$i] eq $guess && $AlreadyGuessed==0) {
                $AlreadyGuessed = 1;
            }
            $inputWord[$i] = $guess;
        }
    }
    if ( $CorrecGuess == 0 ) {
        push( @Misses, $guess );
        $lives--;
        print "Bad Guess\n";
    }
    else {
        if ( $AlreadyGuessed == 0 ) {
            print "Good Guess\n";
        }
        else {
            print "You've already guessed it\n";
        }
    }
    print "Guessed : ";
    print "@inputWord\n";
    print "Missed : ";
    print "@Misses\n";
    &hangmanDisplay();
    if ( &HasWon() == 1 ) {
        print "You won\n";
        exit 0;
    }
}

sub HasWon { # Has all the characters guesses correctly?

    for ( my $i = 0 ; $i < $n ; $i++ ) {

        if ( $ourword[$i] ne $inputWord[$i] ) {
            return 0;
        }
    }
    return 1;
}

sub hangmanDisplay() {
    if ( $lives == 0 ) {
        &hangman0Display();
    }
    if ( $lives == 1 ) {
        &hangman1Display();
    }
    if ( $lives == 2 ) {
        &hangman2Display();
    }
    if ( $lives == 3 ) {
        &hangman3Display();
    }
    if ( $lives == 4 ) {
        &hangman4Display();
    }
    if ( $lives == 5 ) {
        &hangman5Display();
    }
    if ( $lives == 6 ) {
        &hangman6Display();
    }
}

sub hangman6Display { # 6 lives remaining 
    print "  -------\n";
    print "  |     |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman5Display { # 5 lives remaining
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman4Display { # 4 lives remaining
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |     |\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman3Display { # 3 lives remaining
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman2Display {# 2 lives remaining
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|/\n";
    print "  |\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman1Display {# 1 lives remaining
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|/\n";
    print "  |    /\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
}

sub hangman0Display {# 0 lives remaining
    print "  -------\n";
    print "  |     |\n";
    print "  |     o\n";
    print "  |    \\|/\n";
    print "  |    / \\\n";
    print "  |\n";
    print "  |\n";
    print "--|----\n";
    print "You lost!\n";
    print "The word was ";
    print "@ourword\n";
    exit 0;
}
