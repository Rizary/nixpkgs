{ stdenv, fetchFromGitHub, rustPlatform }:

with rustPlatform;

buildRustPackage rec {
  pname = "ion";
  version = "1.0.5";

  src = fetchFromGitHub {
    owner = "redox-os";
    repo = "ion";
    rev = "994b82071569d13fdd7f752af92e64430823e77d";
    sha256 = "088325nlvv1f0c9m8hlnh7v6jbs4dpr3ji9q88fmql8f9nnidcgj";
  };

  cargoSha256 = "02wy2sgacxn05j3n5kn57ajyjvk1sg6261rdz7drqgrqsd2zgpa5";

  meta = with stdenv.lib; {
    description = "Modern system shell with simple (and powerful) syntax";
    homepage = https://github.com/redox-os/ion;
    license = licenses.mit;
    maintainers = with maintainers; [ dywedir ];
    platforms = platforms.all;
    broken = stdenv.isDarwin;
  };

  passthru = {
	  shellPath = "/bin/ion";
  };
}
