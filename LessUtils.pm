package LessUtils;

use StringUtils;

sub getFirstCaracter {
    return substr(StringUtils->trim($_[0]), 0, 1);
}

sub lineIsVariableDeclaration {
    my ($self, $line) = @_;

    $firstCaracter = getFirstCaracter($line);

    my $hasDeclarationSymbol         = $firstCaracter eq '@';
    my $containsDeclarationSeparator = index($line, ':') != -1;
    my $hasEndOfLineSymbol           = index($line, ';') != -1;
    my $isAnImport                   = index($line, 'import') > -1;

    return $hasDeclarationSymbol && $containsDeclarationSeparator && $hasEndOfLineSymbol && !$isAnImport;

}

sub lineIsCssColor {
    my ($self, $line) = @_;

    print "line : $line";
    if ($line =~ /(#(?:[\da-f]{3}){1,2}|rgb\((?:\d{1,3},\s*){2}\d{1,3}\)|rgba\((?:\d{1,3},\s*){3}\d*\.?\d+\)|hsl\(\d{1,3}(?:,\s*\d{1,3}%){2}\)|hsla\(\d{1,3}(?:,\s*\d{1,3}%){2},\s*\d*\.?\d+\))/i) {
        return $1;
    }

    return;
}

1;
