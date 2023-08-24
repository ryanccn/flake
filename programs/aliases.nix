{
  "vim".command = "hx";
  "dig".command = "doggo";

  "g".command = "git";
  "g".fishAlias = true;

  "j".command = "just";
  "j".fishAlias = true;

  "glol".command = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
  "glol".fishAlias = true;

  "ghrvw".command = "gh repo view --web";

  "opr".command = "op run --env-file=.env.1password --";
  "dr".command = "doppler run --";

  "dequarantine".command = "xattr -d com.apple.quarantine";

  "bcpa".command = "brew cleanup --prune=all";
  "puil".command = "pnpm update --interactive --latest";

  "pip-upgrade-all".command = "pip --disable-pip-version-check list --outdated --format=json | python -c \"import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))\" | xargs -n1 pip install -U";
  "pip-upgrade-all".fishAlias = true;
}
