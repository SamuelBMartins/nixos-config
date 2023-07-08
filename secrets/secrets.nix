let
  user = builtins.readFile ../assets/ssh/personal.pub;
in
{
  "secret1.age".publicKeys = [ user ];
}