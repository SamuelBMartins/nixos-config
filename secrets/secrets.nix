let
  user = builtins.readFile ../assets/ssh/personal.pub;
in
{
  "email_personal.age".publicKeys = [ user ];
  "email_work.age".publicKeys = [ user ];
  "shh_personal.age".publicKeys = [ user ];
}