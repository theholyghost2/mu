use v6;
use Test;
plan 30;

# L<S29/Num/"=item roots">

sub approx($a, $b){
    my ($x,$y);
    my $eps = 1e-3;
    # coerce both to Complex
    $x = $a + 0i;
    $y = $b + 0i;
    my $re = abs($x.re - $y.re);
    my $im = abs($x.im - $y.im);
    # both real and imag part must be with $eps of expected
    return ( $re < $eps && $im < $eps );
}

sub has_approx($n, @list) {
    for @list -> $i {
        if approx($i, $n) {
            return 1;
        }
    }
    return undef;
}

{
    my @l = roots(0, 1);
    ok(@l.elems == 1, 'roots(0, 1) returns 1 element');
    ok(has_approx(0, @l), 'roots(0, 1) contains 0');
}
{
    my @l = roots(0, 0);
    ok(@l.elems == 1, 'roots(0, 0) returns 1 element');
    ok(@l[0] ~~ 'NaN', 'roots(0,0) returns NaN');
}
{
    my @l = roots(0, -1);
    ok(@l.elems == 1, 'roots(0, -1) returns 1 element');
    ok(@l[0] ~~ 'NaN', 'roots(0,-1) returns NaN');
}
{
    my @l = roots(100, -1);
    ok(@l.elems == 1, 'roots(100, -1) returns 1 element');
    ok(@l[0] ~~ 'NaN', 'roots(100,-1) returns NaN');
}
{
    my @m = roots(1, 0);
    ok(@m.elems == 1, 'roots(1, 0) returns 1 element');
    ok(@m[0] ~~ 'NaN', 'roots(1,0) returns NaN');
}
{
    my @l = roots(4, 2);
    ok(@l.elems == 2, 'roots(4, 2) returns 2 elements');
    ok(has_approx(2, @l), 'roots(4, 2) contains 2');
    ok(has_approx(-2, @l), 'roots(4, 2) contains -2');
}
{
    my @l = roots(-1, 2);
    ok(@l.elems == 2, 'roots(-1, 2) returns 2 elements');
    ok(has_approx(1i, @l), 'roots(-1, 2) contains 1i');
    ok(has_approx(-1i, @l), 'roots(-1, 2) contains -1i');
}

#?pugs todo 'feature'
{
    my @l = 16.roots(4);
    ok(@l.elems == 4, '16.roots(4) returns 4 elements');
    ok(has_approx(2, @l), '16.roots(4) contains 2');
    ok(has_approx(-2, @l), '16.roots(4) contains -2');
    ok(has_approx(2i, @l), '16.roots(4) contains 2i');
    ok(has_approx(-2i, @l), '16.roots(4) contains -2i');
}
{
    my @l = (-1).roots(2);
    ok(@l.elems == 2, '(-1).roots(2) returns 2 elements');
    ok(has_approx(1i, @l), '(-1).roots(2) contains i');
    ok(has_approx(-1i, @l), '(-1).roots(2) contains -i');
}
{
    my @l = 0e0.roots(2);
    ok(@l.elems == 2, '0e0.roots(2) returns 2 elements');
    ok(has_approx(0, @l), '0e0.roots(2) contains 0');
}
{
    my @l = roots('NaN', 1);
    ok(@l.elems == 1, 'roots(NaN, 1) returns 1 element');
    ok(@l[0] ~~ 'NaN', 'roots(NaN,1) returns NaN');
}
{
    my @l = roots('Inf', 1);
    ok(@l.elems == 1, 'roots(Inf, 1) returns 1 element');
    ok(@l[0] ~~ 'Inf', 'roots(Inf,1) returns Inf');
}
