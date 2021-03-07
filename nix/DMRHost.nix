{ static ? false
, lib, stdenv, fetchFromGitHub, cmake, gnumake
}:

stdenv.mkDerivation rec {
  pname = "DMRHost";
  version = "unstable-2021-03-07";

#  src = ./.. ;

  src = fetchFromGitHub {
    owner = "BrandMeister";
    repo = pname;
    rev = "4356dc60c5e331b8c653a510fde7df10a96c3bec";
    sha256 = "00j6yk9wc3dv1nig610y4lj65ypak83m51j84730c9p9856kk6q3";
  };

  nativeBuildInputs = [ cmake ];

  outputs = [ "out" ];

  cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ]
               ++ [ "-DBUILD_SHARED_LIBS=${if static then "OFF" else "ON"}" ]                 
               ++ stdenv.lib.optional static "-DCMAKE_SKIP_RPATH:BOOL=TRUE"
               ++ stdenv.lib.optional static "-DCMAKE_EXE_LINKER_FLAGS=-static ";
  
  meta = with lib; {
    description = "s";
    homepage = "https://github.com/BrandMeister/DMRHost";
    license = licenses.gpl2Only;
    platforms = platforms.linux;
    maintainers = with maintainers; [ mafo ];
  };
}
