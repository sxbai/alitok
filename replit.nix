{ pkgs }: {
  deps = [
    pkgs.openssl.out
    pkgs.openssl.dev
    pkgs.python39Full
  ];
  env = {
    OPENSSL_PATH="${pkgs.openssl.out}";
  };
}