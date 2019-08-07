{ buildGoPackage, lib, fetchFromGitHub }:
buildGoPackage rec {
  name = "${pname}-${version}";
  pname = "aws-vault";
  version = "4.6.2";

  goPackagePath = "github.com/99designs/${pname}";

  src = fetchFromGitHub {
    owner = "99designs";
    repo = pname;
    rev = "v${version}";
    sha256 = "163zdw99ar2rdmaz05rm52n98901b0sarsmi011ii3y92f0xg2gf";
  };

  # set the version. see: aws-vault's Makefile
  buildFlagsArray = ''
    -ldflags=
    -X main.Version=v${version}
  '';

  meta = with lib; {
    description = "A vault for securely storing and accessing AWS credentials in development environments";
    homepage = "https://github.com/99designs/aws-vault";
    license = licenses.mit;
    maintainers = with maintainers; [ zimbatm ];
  };

}
