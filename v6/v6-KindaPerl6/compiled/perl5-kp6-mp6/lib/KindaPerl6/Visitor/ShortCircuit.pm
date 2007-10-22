# Do not edit this file - Generated by MiniPerl6
use v5;
use strict;
use MiniPerl6::Perl5::Runtime;
use MiniPerl6::Perl5::Match;

package KindaPerl6::Visitor::ShortCircuit;
sub new { shift; bless {@_}, "KindaPerl6::Visitor::ShortCircuit" }

sub new_pad {
    my $List__ = \@_;
    do { [] };
    COMPILER::add_pad();
    my $pad = COMPILER::current_pad();
    COMPILER::drop_pad();
    return ($pad);
}

sub thunk {
    my $List__ = \@_;
    my $value;
    do { $value = $List__->[0]; [$value] };
    Sub->new( 'block' => Lit::Code->new( 'pad' => new_pad(), 'body' => [$value], 'sig' => Sig->new( 'positional' => [], 'named' => [], ), ), );
}

sub visit {
    my $self   = shift;
    my $List__ = \@_;
    my $node;
    my $node_name;
    do { $node = $List__->[0]; $node_name = $List__->[1]; [ $node, $node_name ] };
    my $pass_thunks = { 'infix:<&&>' => 1, 'infix:<||>' => 1, 'infix:<//>' => 1, };
    do {
        if ( ( ( $node_name eq 'Apply' ) && $pass_thunks->{ $node->code()->name() } ) ) {
            my $left  = $node->arguments()->[0]->emit($self);
            my $right = $node->arguments()->[1]->emit($self);
            return ( Apply->new( 'code' => $node->code(), 'arguments' => [ thunk($left), thunk($right) ], ) );
        }
        else { }
    };
    return ( (undef) );
}

1;
