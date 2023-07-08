let
  user = builtins.readFile ../assets/ssh/personal.pub;
in
{
  "email_personal.age".publicKeys = [ user ];
  "shh_personal.age".publicKeys = [ user ];
}