package LessVariableExtractor;

use LessUtils;

sub extractVariableFromFile {
    my ($self, $file) = @_;

    my @variablesLines = ();

    open(my $fh, '<:encoding(UTF-8)', $file) or die "Could not open file '$file' $!";

    while( my $line = <$fh>)  {
        my $value = LessUtils->lineIsCssColor($line);
        if ($value) {
            push @variablesLines, $value;
        }
    }

    return @variablesLines
}

1;
