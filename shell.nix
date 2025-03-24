{ pkgs, unstable }:
with pkgs;
mkShell {
  name = "go shell";

  buildInputs = with pkgs; [
    erlang_27
    unstable.gleam
  ];

  shellHook = ''
    # bass ~/.nvm/nvm.sh

    # echo "The shell!"
    # git config core.hooksPath .hooks
  '';
}
