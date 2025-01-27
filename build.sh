#!/usr/bin/env bash

help-menu() {
cat <<EOF

       -------------------------------------------
                   wastebin build script
       -------------------------------------------

./build.sh [OPTION]

---------------------------------------------------------------------------------------
    FLAG                 |                   What it does
---------------------------------------------------------------------------------------
    -b,  --build         | Build the project
    -r,  --run           | Run the project
    -cc, --cc, --cross   | Build with cross-compilation for x86_64-unknown-linux-gnu

EOF
exit
}

parse_arguments() {
  if [[ $# -eq 0 ]]; then
    help-menu
  fi

  while [[ $# -gt 0 ]]
  do
    case $1 in
      -cc|--cc|--cross)
        CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-unknown-linux-gnu-gcc cargo build --target=x86_64-unknown-linux-gnu --release
        ;;
      -b|--build)
        cargo build --release
        ;;
      -r|--run)
        cargo run
        ;;
      -h|--help)
        help-menu
        ;;
      *)
        help-menu
        ;;
    esac
    shift
  done
}

parse_arguments "$@"
