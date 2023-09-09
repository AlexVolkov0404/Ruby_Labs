
$p = 5
$t = 8
$r = 0

$result = $p**$r*(1 - $p**(-1*$t))

print "result = " + $result.to_f.to_s, "\n"