{ lib, getSystem, inputs, ... }:

{
  imports = [
    inputs.git-hooks-nix.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {

    # https://flake.parts/options/pre-commit-hooks-nix.html#options
    pre-commit.settings = {
      hooks = {
        clang-format = {
          enable = true;
          excludes = [
            # We don't want to format test data
            # ''tests/(?!nixos/).*\.nix''
            ''^tests/unit/[^/]*/data/.*$''

            # Don't format vendored code
            ''^doc/manual/redirects\.js$''
            ''^doc/manual/theme/highlight\.js$''

            # We haven't applied formatting to these files yet
            ''^doc/manual/redirects\.js$''
            ''^doc/manual/theme/highlight\.js$''
            ''^precompiled-headers\.h$''
            ''^subprojects/build-remote/build-remote\.cc$''
            ''^subprojects/libcmd/built-path\.cc$''
            ''^subprojects/libcmd/built-path\.hh$''
            ''^subprojects/libcmd/command\.cc$''
            ''^subprojects/libcmd/command\.hh$''
            ''^subprojects/libcmd/common-eval-args\.cc$''
            ''^subprojects/libcmd/common-eval-args\.hh$''
            ''^subprojects/libcmd/editor-for\.cc$''
            ''^subprojects/libcmd/installable-attr-path\.cc$''
            ''^subprojects/libcmd/installable-attr-path\.hh$''
            ''^subprojects/libcmd/installable-derived-path\.cc$''
            ''^subprojects/libcmd/installable-derived-path\.hh$''
            ''^subprojects/libcmd/installable-flake\.cc$''
            ''^subprojects/libcmd/installable-flake\.hh$''
            ''^subprojects/libcmd/installable-value\.cc$''
            ''^subprojects/libcmd/installable-value\.hh$''
            ''^subprojects/libcmd/installables\.cc$''
            ''^subprojects/libcmd/installables\.hh$''
            ''^subprojects/libcmd/legacy\.hh$''
            ''^subprojects/libcmd/markdown\.cc$''
            ''^subprojects/libcmd/misc-store-flags\.cc$''
            ''^subprojects/libcmd/repl-interacter\.cc$''
            ''^subprojects/libcmd/repl-interacter\.hh$''
            ''^subprojects/libcmd/repl\.cc$''
            ''^subprojects/libcmd/repl\.hh$''
            ''^subprojects/libexpr-c/nix_api_expr\.cc$''
            ''^subprojects/libexpr-c/nix_api_external\.cc$''
            ''^subprojects/libexpr/attr-path\.cc$''
            ''^subprojects/libexpr/attr-path\.hh$''
            ''^subprojects/libexpr/attr-set\.cc$''
            ''^subprojects/libexpr/attr-set\.hh$''
            ''^subprojects/libexpr/eval-cache\.cc$''
            ''^subprojects/libexpr/eval-cache\.hh$''
            ''^subprojects/libexpr/eval-error\.cc$''
            ''^subprojects/libexpr/eval-inline\.hh$''
            ''^subprojects/libexpr/eval-settings\.cc$''
            ''^subprojects/libexpr/eval-settings\.hh$''
            ''^subprojects/libexpr/eval\.cc$''
            ''^subprojects/libexpr/eval\.hh$''
            ''^subprojects/libexpr/function-trace\.cc$''
            ''^subprojects/libexpr/gc-small-vector\.hh$''
            ''^subprojects/libexpr/get-drvs\.cc$''
            ''^subprojects/libexpr/get-drvs\.hh$''
            ''^subprojects/libexpr/json-to-value\.cc$''
            ''^subprojects/libexpr/nixexpr\.cc$''
            ''^subprojects/libexpr/nixexpr\.hh$''
            ''^subprojects/libexpr/parser-state\.hh$''
            ''^subprojects/libexpr/pos-table\.hh$''
            ''^subprojects/libexpr/primops\.cc$''
            ''^subprojects/libexpr/primops\.hh$''
            ''^subprojects/libexpr/primops/context\.cc$''
            ''^subprojects/libexpr/primops/fetchClosure\.cc$''
            ''^subprojects/libexpr/primops/fetchMercurial\.cc$''
            ''^subprojects/libexpr/primops/fetchTree\.cc$''
            ''^subprojects/libexpr/primops/fromTOML\.cc$''
            ''^subprojects/libexpr/print-ambiguous\.cc$''
            ''^subprojects/libexpr/print-ambiguous\.hh$''
            ''^subprojects/libexpr/print-options\.hh$''
            ''^subprojects/libexpr/print\.cc$''
            ''^subprojects/libexpr/print\.hh$''
            ''^subprojects/libexpr/search-path\.cc$''
            ''^subprojects/libexpr/symbol-table\.hh$''
            ''^subprojects/libexpr/value-to-json\.cc$''
            ''^subprojects/libexpr/value-to-json\.hh$''
            ''^subprojects/libexpr/value-to-xml\.cc$''
            ''^subprojects/libexpr/value-to-xml\.hh$''
            ''^subprojects/libexpr/value\.hh$''
            ''^subprojects/libexpr/value/context\.cc$''
            ''^subprojects/libexpr/value/context\.hh$''
            ''^subprojects/libfetchers/attrs\.cc$''
            ''^subprojects/libfetchers/cache\.cc$''
            ''^subprojects/libfetchers/cache\.hh$''
            ''^subprojects/libfetchers/fetch-settings\.cc$''
            ''^subprojects/libfetchers/fetch-settings\.hh$''
            ''^subprojects/libfetchers/fetch-to-store\.cc$''
            ''^subprojects/libfetchers/fetchers\.cc$''
            ''^subprojects/libfetchers/fetchers\.hh$''
            ''^subprojects/libfetchers/filtering-source-accessor\.cc$''
            ''^subprojects/libfetchers/filtering-source-accessor\.hh$''
            ''^subprojects/libfetchers/fs-source-accessor\.cc$''
            ''^subprojects/libfetchers/fs-source-accessor\.hh$''
            ''^subprojects/libfetchers/git-utils\.cc$''
            ''^subprojects/libfetchers/git-utils\.hh$''
            ''^subprojects/libfetchers/github\.cc$''
            ''^subprojects/libfetchers/indirect\.cc$''
            ''^subprojects/libfetchers/memory-source-accessor\.cc$''
            ''^subprojects/libfetchers/path\.cc$''
            ''^subprojects/libfetchers/registry\.cc$''
            ''^subprojects/libfetchers/registry\.hh$''
            ''^subprojects/libfetchers/tarball\.cc$''
            ''^subprojects/libfetchers/tarball\.hh$''
            ''^subprojects/libfetchers/git\.cc$''
            ''^subprojects/libfetchers/mercurial\.cc$''
            ''^subprojects/libflake/flake/config\.cc$''
            ''^subprojects/libflake/flake/flake\.cc$''
            ''^subprojects/libflake/flake/flake\.hh$''
            ''^subprojects/libflake/flake/flakeref\.cc$''
            ''^subprojects/libflake/flake/flakeref\.hh$''
            ''^subprojects/libflake/flake/lockfile\.cc$''
            ''^subprojects/libflake/flake/lockfile\.hh$''
            ''^subprojects/libflake/flake/url-name\.cc$''
            ''^subprojects/libmain/common-args\.cc$''
            ''^subprojects/libmain/common-args\.hh$''
            ''^subprojects/libmain/loggers\.cc$''
            ''^subprojects/libmain/loggers\.hh$''
            ''^subprojects/libmain/progress-bar\.cc$''
            ''^subprojects/libmain/shared\.cc$''
            ''^subprojects/libmain/shared\.hh$''
            ''^subprojects/libmain/unix/stack\.cc$''
            ''^subprojects/libstore/binary-cache-store\.cc$''
            ''^subprojects/libstore/binary-cache-store\.hh$''
            ''^subprojects/libstore/build-result\.hh$''
            ''^subprojects/libstore/builtins\.hh$''
            ''^subprojects/libstore/builtins/buildenv\.cc$''
            ''^subprojects/libstore/builtins/buildenv\.hh$''
            ''^subprojects/libstore/common-protocol-impl\.hh$''
            ''^subprojects/libstore/common-protocol\.cc$''
            ''^subprojects/libstore/common-protocol\.hh$''
            ''^subprojects/libstore/common-ssh-store-config\.hh$''
            ''^subprojects/libstore/content-address\.cc$''
            ''^subprojects/libstore/content-address\.hh$''
            ''^subprojects/libstore/daemon\.cc$''
            ''^subprojects/libstore/daemon\.hh$''
            ''^subprojects/libstore/derivations\.cc$''
            ''^subprojects/libstore/derivations\.hh$''
            ''^subprojects/libstore/derived-path-map\.cc$''
            ''^subprojects/libstore/derived-path-map\.hh$''
            ''^subprojects/libstore/derived-path\.cc$''
            ''^subprojects/libstore/derived-path\.hh$''
            ''^subprojects/libstore/downstream-placeholder\.cc$''
            ''^subprojects/libstore/downstream-placeholder\.hh$''
            ''^subprojects/libstore/dummy-store\.cc$''
            ''^subprojects/libstore/export-import\.cc$''
            ''^subprojects/libstore/filetransfer\.cc$''
            ''^subprojects/libstore/filetransfer\.hh$''
            ''^subprojects/libstore/gc-store\.hh$''
            ''^subprojects/libstore/globals\.cc$''
            ''^subprojects/libstore/globals\.hh$''
            ''^subprojects/libstore/http-binary-cache-store\.cc$''
            ''^subprojects/libstore/legacy-ssh-store\.cc$''
            ''^subprojects/libstore/legacy-ssh-store\.hh$''
            ''^subprojects/libstore/length-prefixed-protocol-helper\.hh$''
            ''^subprojects/libstore/linux/personality\.cc$''
            ''^subprojects/libstore/linux/personality\.hh$''
            ''^subprojects/libstore/local-binary-cache-store\.cc$''
            ''^subprojects/libstore/local-fs-store\.cc$''
            ''^subprojects/libstore/local-fs-store\.hh$''
            ''^subprojects/libstore/log-store\.cc$''
            ''^subprojects/libstore/log-store\.hh$''
            ''^subprojects/libstore/machines\.cc$''
            ''^subprojects/libstore/machines\.hh$''
            ''^subprojects/libstore/make-content-addressed\.cc$''
            ''^subprojects/libstore/make-content-addressed\.hh$''
            ''^subprojects/libstore/misc\.cc$''
            ''^subprojects/libstore/names\.cc$''
            ''^subprojects/libstore/names\.hh$''
            ''^subprojects/libstore/nar-accessor\.cc$''
            ''^subprojects/libstore/nar-accessor\.hh$''
            ''^subprojects/libstore/nar-info-disk-cache\.cc$''
            ''^subprojects/libstore/nar-info-disk-cache\.hh$''
            ''^subprojects/libstore/nar-info\.cc$''
            ''^subprojects/libstore/nar-info\.hh$''
            ''^subprojects/libstore/outputs-spec\.cc$''
            ''^subprojects/libstore/outputs-spec\.hh$''
            ''^subprojects/libstore/parsed-derivations\.cc$''
            ''^subprojects/libstore/path-info\.cc$''
            ''^subprojects/libstore/path-info\.hh$''
            ''^subprojects/libstore/path-references\.cc$''
            ''^subprojects/libstore/path-regex\.hh$''
            ''^subprojects/libstore/path-with-outputs\.cc$''
            ''^subprojects/libstore/path\.cc$''
            ''^subprojects/libstore/path\.hh$''
            ''^subprojects/libstore/pathlocks\.cc$''
            ''^subprojects/libstore/pathlocks\.hh$''
            ''^subprojects/libstore/profiles\.cc$''
            ''^subprojects/libstore/profiles\.hh$''
            ''^subprojects/libstore/realisation\.cc$''
            ''^subprojects/libstore/realisation\.hh$''
            ''^subprojects/libstore/remote-fs-accessor\.cc$''
            ''^subprojects/libstore/remote-fs-accessor\.hh$''
            ''^subprojects/libstore/remote-store-connection\.hh$''
            ''^subprojects/libstore/remote-store\.cc$''
            ''^subprojects/libstore/remote-store\.hh$''
            ''^subprojects/libstore/s3-binary-cache-store\.cc$''
            ''^subprojects/libstore/s3\.hh$''
            ''^subprojects/libstore/serve-protocol-impl\.cc$''
            ''^subprojects/libstore/serve-protocol-impl\.hh$''
            ''^subprojects/libstore/serve-protocol\.cc$''
            ''^subprojects/libstore/serve-protocol\.hh$''
            ''^subprojects/libstore/sqlite\.cc$''
            ''^subprojects/libstore/sqlite\.hh$''
            ''^subprojects/libstore/ssh-store\.cc$''
            ''^subprojects/libstore/ssh\.cc$''
            ''^subprojects/libstore/ssh\.hh$''
            ''^subprojects/libstore/store-api\.cc$''
            ''^subprojects/libstore/store-api\.hh$''
            ''^subprojects/libstore/store-dir-config\.hh$''
            ''^subprojects/libstore/build/derivation-goal\.cc$''
            ''^subprojects/libstore/build/derivation-goal\.hh$''
            ''^subprojects/libstore/build/drv-output-substitution-goal\.cc$''
            ''^subprojects/libstore/build/drv-output-substitution-goal\.hh$''
            ''^subprojects/libstore/build/entry-points\.cc$''
            ''^subprojects/libstore/build/goal\.cc$''
            ''^subprojects/libstore/build/goal\.hh$''
            ''^subprojects/libstore/unix/build/hook-instance\.cc$''
            ''^subprojects/libstore/unix/build/local-derivation-goal\.cc$''
            ''^subprojects/libstore/unix/build/local-derivation-goal\.hh$''
            ''^subprojects/libstore/build/substitution-goal\.cc$''
            ''^subprojects/libstore/build/substitution-goal\.hh$''
            ''^subprojects/libstore/build/worker\.cc$''
            ''^subprojects/libstore/build/worker\.hh$''
            ''^subprojects/libstore/builtins/fetchurl\.cc$''
            ''^subprojects/libstore/builtins/unpack-channel\.cc$''
            ''^subprojects/libstore/gc\.cc$''
            ''^subprojects/libstore/local-overlay-store\.cc$''
            ''^subprojects/libstore/local-overlay-store\.hh$''
            ''^subprojects/libstore/local-store\.cc$''
            ''^subprojects/libstore/local-store\.hh$''
            ''^subprojects/libstore/unix/user-lock\.cc$''
            ''^subprojects/libstore/unix/user-lock\.hh$''
            ''^subprojects/libstore/optimise-store\.cc$''
            ''^subprojects/libstore/unix/pathlocks\.cc$''
            ''^subprojects/libstore/posix-fs-canonicalise\.cc$''
            ''^subprojects/libstore/posix-fs-canonicalise\.hh$''
            ''^subprojects/libstore/uds-remote-store\.cc$''
            ''^subprojects/libstore/uds-remote-store\.hh$''
            ''^subprojects/libstore/windows/build\.cc$''
            ''^subprojects/libstore/worker-protocol-impl\.hh$''
            ''^subprojects/libstore/worker-protocol\.cc$''
            ''^subprojects/libstore/worker-protocol\.hh$''
            ''^subprojects/libutil-c/nix_api_util_internal\.h$''
            ''^subprojects/libutil/archive\.cc$''
            ''^subprojects/libutil/archive\.hh$''
            ''^subprojects/libutil/args\.cc$''
            ''^subprojects/libutil/args\.hh$''
            ''^subprojects/libutil/args/root\.hh$''
            ''^subprojects/libutil/callback\.hh$''
            ''^subprojects/libutil/canon-path\.cc$''
            ''^subprojects/libutil/canon-path\.hh$''
            ''^subprojects/libutil/chunked-vector\.hh$''
            ''^subprojects/libutil/closure\.hh$''
            ''^subprojects/libutil/comparator\.hh$''
            ''^subprojects/libutil/compute-levels\.cc$''
            ''^subprojects/libutil/config-impl\.hh$''
            ''^subprojects/libutil/config\.cc$''
            ''^subprojects/libutil/config\.hh$''
            ''^subprojects/libutil/current-process\.cc$''
            ''^subprojects/libutil/current-process\.hh$''
            ''^subprojects/libutil/english\.cc$''
            ''^subprojects/libutil/english\.hh$''
            ''^subprojects/libutil/error\.cc$''
            ''^subprojects/libutil/error\.hh$''
            ''^subprojects/libutil/exit\.hh$''
            ''^subprojects/libutil/experimental-features\.cc$''
            ''^subprojects/libutil/experimental-features\.hh$''
            ''^subprojects/libutil/file-content-address\.cc$''
            ''^subprojects/libutil/file-content-address\.hh$''
            ''^subprojects/libutil/file-descriptor\.cc$''
            ''^subprojects/libutil/file-descriptor\.hh$''
            ''^subprojects/libutil/file-path-impl\.hh$''
            ''^subprojects/libutil/file-path\.hh$''
            ''^subprojects/libutil/file-system\.cc$''
            ''^subprojects/libutil/file-system\.hh$''
            ''^subprojects/libutil/finally\.hh$''
            ''^subprojects/libutil/fmt\.hh$''
            ''^subprojects/libutil/fs-sink\.cc$''
            ''^subprojects/libutil/fs-sink\.hh$''
            ''^subprojects/libutil/git\.cc$''
            ''^subprojects/libutil/git\.hh$''
            ''^subprojects/libutil/hash\.cc$''
            ''^subprojects/libutil/hash\.hh$''
            ''^subprojects/libutil/hilite\.cc$''
            ''^subprojects/libutil/hilite\.hh$''
            ''^subprojects/libutil/source-accessor\.hh$''
            ''^subprojects/libutil/json-impls\.hh$''
            ''^subprojects/libutil/json-utils\.cc$''
            ''^subprojects/libutil/json-utils\.hh$''
            ''^subprojects/libutil/linux/cgroup\.cc$''
            ''^subprojects/libutil/linux/namespaces\.cc$''
            ''^subprojects/libutil/logging\.cc$''
            ''^subprojects/libutil/logging\.hh$''
            ''^subprojects/libutil/lru-cache\.hh$''
            ''^subprojects/libutil/memory-source-accessor\.cc$''
            ''^subprojects/libutil/memory-source-accessor\.hh$''
            ''^subprojects/libutil/pool\.hh$''
            ''^subprojects/libutil/position\.cc$''
            ''^subprojects/libutil/position\.hh$''
            ''^subprojects/libutil/posix-source-accessor\.cc$''
            ''^subprojects/libutil/posix-source-accessor\.hh$''
            ''^subprojects/libutil/processes\.hh$''
            ''^subprojects/libutil/ref\.hh$''
            ''^subprojects/libutil/references\.cc$''
            ''^subprojects/libutil/references\.hh$''
            ''^subprojects/libutil/regex-combinators\.hh$''
            ''^subprojects/libutil/serialise\.cc$''
            ''^subprojects/libutil/serialise\.hh$''
            ''^subprojects/libutil/signals\.hh$''
            ''^subprojects/libutil/signature/local-keys\.cc$''
            ''^subprojects/libutil/signature/local-keys\.hh$''
            ''^subprojects/libutil/signature/signer\.cc$''
            ''^subprojects/libutil/signature/signer\.hh$''
            ''^subprojects/libutil/source-accessor\.cc$''
            ''^subprojects/libutil/source-accessor\.hh$''
            ''^subprojects/libutil/source-path\.cc$''
            ''^subprojects/libutil/source-path\.hh$''
            ''^subprojects/libutil/split\.hh$''
            ''^subprojects/libutil/suggestions\.cc$''
            ''^subprojects/libutil/suggestions\.hh$''
            ''^subprojects/libutil/sync\.hh$''
            ''^subprojects/libutil/terminal\.cc$''
            ''^subprojects/libutil/terminal\.hh$''
            ''^subprojects/libutil/thread-pool\.cc$''
            ''^subprojects/libutil/thread-pool\.hh$''
            ''^subprojects/libutil/topo-sort\.hh$''
            ''^subprojects/libutil/types\.hh$''
            ''^subprojects/libutil/unix/file-descriptor\.cc$''
            ''^subprojects/libutil/unix/file-path\.cc$''
            ''^subprojects/libutil/unix/monitor-fd\.hh$''
            ''^subprojects/libutil/unix/processes\.cc$''
            ''^subprojects/libutil/unix/signals-impl\.hh$''
            ''^subprojects/libutil/unix/signals\.cc$''
            ''^subprojects/libutil/unix-domain-socket\.cc$''
            ''^subprojects/libutil/unix/users\.cc$''
            ''^subprojects/libutil/url-parts\.hh$''
            ''^subprojects/libutil/url\.cc$''
            ''^subprojects/libutil/url\.hh$''
            ''^subprojects/libutil/users\.cc$''
            ''^subprojects/libutil/users\.hh$''
            ''^subprojects/libutil/util\.cc$''
            ''^subprojects/libutil/util\.hh$''
            ''^subprojects/libutil/variant-wrapper\.hh$''
            ''^subprojects/libutil/windows/file-descriptor\.cc$''
            ''^subprojects/libutil/windows/file-path\.cc$''
            ''^subprojects/libutil/windows/processes\.cc$''
            ''^subprojects/libutil/windows/users\.cc$''
            ''^subprojects/libutil/windows/windows-error\.cc$''
            ''^subprojects/libutil/windows/windows-error\.hh$''
            ''^subprojects/libutil/xml-writer\.cc$''
            ''^subprojects/libutil/xml-writer\.hh$''
            ''^subprojects/nix-build/nix-build\.cc$''
            ''^subprojects/nix-channel/nix-channel\.cc$''
            ''^subprojects/nix-collect-garbage/nix-collect-garbage\.cc$''
            ''^subprojects/nix-env/buildenv.nix$''
            ''^subprojects/nix-env/nix-env\.cc$''
            ''^subprojects/nix-env/user-env\.cc$''
            ''^subprojects/nix-env/user-env\.hh$''
            ''^subprojects/nix-instantiate/nix-instantiate\.cc$''
            ''^subprojects/nix-store/dotgraph\.cc$''
            ''^subprojects/nix-store/graphml\.cc$''
            ''^subprojects/nix-store/nix-store\.cc$''
            ''^subprojects/nix/add-to-store\.cc$''
            ''^subprojects/nix/app\.cc$''
            ''^subprojects/nix/build\.cc$''
            ''^subprojects/nix/bundle\.cc$''
            ''^subprojects/nix/cat\.cc$''
            ''^subprojects/nix/config-check\.cc$''
            ''^subprojects/nix/config\.cc$''
            ''^subprojects/nix/copy\.cc$''
            ''^subprojects/nix/derivation-add\.cc$''
            ''^subprojects/nix/derivation-show\.cc$''
            ''^subprojects/nix/derivation\.cc$''
            ''^subprojects/nix/develop\.cc$''
            ''^subprojects/nix/diff-closures\.cc$''
            ''^subprojects/nix/dump-path\.cc$''
            ''^subprojects/nix/edit\.cc$''
            ''^subprojects/nix/eval\.cc$''
            ''^subprojects/nix/flake\.cc$''
            ''^subprojects/nix/fmt\.cc$''
            ''^subprojects/nix/hash\.cc$''
            ''^subprojects/nix/log\.cc$''
            ''^subprojects/nix/ls\.cc$''
            ''^subprojects/nix/main\.cc$''
            ''^subprojects/nix/make-content-addressed\.cc$''
            ''^subprojects/nix/nar\.cc$''
            ''^subprojects/nix/optimise-store\.cc$''
            ''^subprojects/nix/path-from-hash-part\.cc$''
            ''^subprojects/nix/path-info\.cc$''
            ''^subprojects/nix/prefetch\.cc$''
            ''^subprojects/nix/profile\.cc$''
            ''^subprojects/nix/realisation\.cc$''
            ''^subprojects/nix/registry\.cc$''
            ''^subprojects/nix/repl\.cc$''
            ''^subprojects/nix/run\.cc$''
            ''^subprojects/nix/run\.hh$''
            ''^subprojects/nix/search\.cc$''
            ''^subprojects/nix/sigs\.cc$''
            ''^subprojects/nix/store-copy-log\.cc$''
            ''^subprojects/nix/store-delete\.cc$''
            ''^subprojects/nix/store-gc\.cc$''
            ''^subprojects/nix/store-info\.cc$''
            ''^subprojects/nix/store-repair\.cc$''
            ''^subprojects/nix/store\.cc$''
            ''^subprojects/nix/unix/daemon\.cc$''
            ''^subprojects/nix/upgrade-nix\.cc$''
            ''^subprojects/nix/verify\.cc$''
            ''^subprojects/nix/why-depends\.cc$''

            ''^tests/functional/plugins/plugintest\.cc''
            ''^tests/functional/test-libstoreconsumer/main\.cc''
            ''^tests/nixos/ca-fd-leak/sender\.c''
            ''^tests/nixos/ca-fd-leak/smuggler\.c''
            ''^tests/nixos/user-sandboxing/attacker\.c''
            ''^tests/unit/libexpr-support/tests/libexpr\.hh''
            ''^tests/unit/libexpr-support/tests/value/context\.cc''
            ''^tests/unit/libexpr-support/tests/value/context\.hh''
            ''^tests/unit/libexpr/derived-path\.cc''
            ''^tests/unit/libexpr/error_traces\.cc''
            ''^tests/unit/libexpr/eval\.cc''
            ''^tests/unit/libexpr/json\.cc''
            ''^tests/unit/libexpr/main\.cc''
            ''^tests/unit/libexpr/primops\.cc''
            ''^tests/unit/libexpr/search-path\.cc''
            ''^tests/unit/libexpr/trivial\.cc''
            ''^tests/unit/libexpr/value/context\.cc''
            ''^tests/unit/libexpr/value/print\.cc''
            ''^tests/unit/libfetchers/public-key\.cc''
            ''^tests/unit/libflake/flakeref\.cc''
            ''^tests/unit/libflake/url-name\.cc''
            ''^tests/unit/libstore-support/tests/derived-path\.cc''
            ''^tests/unit/libstore-support/tests/derived-path\.hh''
            ''^tests/unit/libstore-support/tests/nix_api_store\.hh''
            ''^tests/unit/libstore-support/tests/outputs-spec\.cc''
            ''^tests/unit/libstore-support/tests/outputs-spec\.hh''
            ''^tests/unit/libstore-support/tests/path\.cc''
            ''^tests/unit/libstore-support/tests/path\.hh''
            ''^tests/unit/libstore-support/tests/protocol\.hh''
            ''^tests/unit/libstore/common-protocol\.cc''
            ''^tests/unit/libstore/content-address\.cc''
            ''^tests/unit/libstore/derivation\.cc''
            ''^tests/unit/libstore/derived-path\.cc''
            ''^tests/unit/libstore/downstream-placeholder\.cc''
            ''^tests/unit/libstore/machines\.cc''
            ''^tests/unit/libstore/nar-info-disk-cache\.cc''
            ''^tests/unit/libstore/nar-info\.cc''
            ''^tests/unit/libstore/outputs-spec\.cc''
            ''^tests/unit/libstore/path-info\.cc''
            ''^tests/unit/libstore/path\.cc''
            ''^tests/unit/libstore/serve-protocol\.cc''
            ''^tests/unit/libstore/worker-protocol\.cc''
            ''^tests/unit/libutil-support/tests/characterization\.hh''
            ''^tests/unit/libutil-support/tests/hash\.cc''
            ''^tests/unit/libutil-support/tests/hash\.hh''
            ''^tests/unit/libutil/args\.cc''
            ''^tests/unit/libutil/canon-path\.cc''
            ''^tests/unit/libutil/chunked-vector\.cc''
            ''^tests/unit/libutil/closure\.cc''
            ''^tests/unit/libutil/compression\.cc''
            ''^tests/unit/libutil/config\.cc''
            ''^tests/unit/libutil/file-content-address\.cc''
            ''^tests/unit/libutil/git\.cc''
            ''^tests/unit/libutil/hash\.cc''
            ''^tests/unit/libutil/hilite\.cc''
            ''^tests/unit/libutil/json-utils\.cc''
            ''^tests/unit/libutil/logging\.cc''
            ''^tests/unit/libutil/lru-cache\.cc''
            ''^tests/unit/libutil/pool\.cc''
            ''^tests/unit/libutil/references\.cc''
            ''^tests/unit/libutil/suggestions\.cc''
            ''^tests/unit/libutil/url\.cc''
            ''^tests/unit/libutil/xml-writer\.cc''
          ];
        };
        shellcheck = {
          enable = true;
          excludes = [
            # We haven't linted these files yet
            ''^config/install-sh$''
            ''^misc/bash/completion\.sh$''
            ''^misc/fish/completion\.fish$''
            ''^misc/zsh/completion\.zsh$''
            ''^scripts/create-darwin-volume\.sh$''
            ''^scripts/install-darwin-multi-user\.sh$''
            ''^scripts/install-multi-user\.sh$''
            ''^scripts/install-nix-from-closure\.sh$''
            ''^scripts/install-systemd-multi-user\.sh$''
            ''^subprojects/nix/get-env\.sh$''
            ''^tests/functional/build\.sh$''
            ''^tests/functional/ca/build-dry\.sh$''
            ''^tests/functional/ca/build-with-garbage-path\.sh$''
            ''^tests/functional/ca/common\.sh$''
            ''^tests/functional/ca/concurrent-builds\.sh$''
            ''^tests/functional/ca/eval-store\.sh$''
            ''^tests/functional/ca/gc\.sh$''
            ''^tests/functional/ca/import-from-derivation\.sh$''
            ''^tests/functional/ca/new-build-cmd\.sh$''
            ''^tests/functional/ca/nix-shell\.sh$''
            ''^tests/functional/ca/post-hook\.sh$''
            ''^tests/functional/ca/recursive\.sh$''
            ''^tests/functional/ca/repl\.sh$''
            ''^tests/functional/ca/selfref-gc\.sh$''
            ''^tests/functional/ca/why-depends\.sh$''
            ''^tests/functional/characterisation-test-infra\.sh$''
            ''^tests/functional/check\.sh$''
            ''^tests/functional/common/vars-and-functions\.sh$''
            ''^tests/functional/completions\.sh$''
            ''^tests/functional/compute-levels\.sh$''
            ''^tests/functional/config\.sh$''
            ''^tests/functional/db-migration\.sh$''
            ''^tests/functional/debugger\.sh$''
            ''^tests/functional/dependencies\.builder0\.sh$''
            ''^tests/functional/dependencies\.sh$''
            ''^tests/functional/dump-db\.sh$''
            ''^tests/functional/dyn-drv/build-built-drv\.sh$''
            ''^tests/functional/dyn-drv/common\.sh$''
            ''^tests/functional/dyn-drv/dep-built-drv\.sh$''
            ''^tests/functional/dyn-drv/eval-outputOf\.sh$''
            ''^tests/functional/dyn-drv/old-daemon-error-hack\.sh$''
            ''^tests/functional/dyn-drv/recursive-mod-json\.sh$''
            ''^tests/functional/eval-store\.sh$''
            ''^tests/functional/eval\.sh$''
            ''^tests/functional/export-graph\.sh$''
            ''^tests/functional/export\.sh$''
            ''^tests/functional/extra-sandbox-profile\.sh$''
            ''^tests/functional/fetchClosure\.sh$''
            ''^tests/functional/fetchGit\.sh$''
            ''^tests/functional/fetchGitRefs\.sh$''
            ''^tests/functional/fetchGitSubmodules\.sh$''
            ''^tests/functional/fetchGitVerification\.sh$''
            ''^tests/functional/fetchMercurial\.sh$''
            ''^tests/functional/fetchurl\.sh$''
            ''^tests/functional/fixed\.builder1\.sh$''
            ''^tests/functional/fixed\.builder2\.sh$''
            ''^tests/functional/fixed\.sh$''
            ''^tests/functional/flakes/absolute-paths\.sh$''
            ''^tests/functional/flakes/check\.sh$''
            ''^tests/functional/flakes/common\.sh$''
            ''^tests/functional/flakes/config\.sh$''
            ''^tests/functional/flakes/develop\.sh$''
            ''^tests/functional/flakes/flakes\.sh$''
            ''^tests/functional/flakes/follow-paths\.sh$''
            ''^tests/functional/flakes/prefetch\.sh$''
            ''^tests/functional/flakes/run\.sh$''
            ''^tests/functional/flakes/show\.sh$''
            ''^tests/functional/fmt\.sh$''
            ''^tests/functional/fmt\.simple\.sh$''
            ''^tests/functional/gc-auto\.sh$''
            ''^tests/functional/gc-concurrent\.builder\.sh$''
            ''^tests/functional/gc-concurrent\.sh$''
            ''^tests/functional/gc-concurrent2\.builder\.sh$''
            ''^tests/functional/gc-non-blocking\.sh$''
            ''^tests/functional/gc\.sh$''
            ''^tests/functional/git-hashing/common\.sh$''
            ''^tests/functional/git-hashing/simple\.sh$''
            ''^tests/functional/hash-convert\.sh$''
            ''^tests/functional/help\.sh$''
            ''^tests/functional/impure-derivations\.sh$''
            ''^tests/functional/impure-env\.sh$''
            ''^tests/functional/impure-eval\.sh$''
            ''^tests/functional/install-darwin\.sh$''
            ''^tests/functional/lang\.sh$''
            ''^tests/functional/legacy-ssh-store\.sh$''
            ''^tests/functional/linux-sandbox\.sh$''
            ''^tests/functional/local-overlay-store/add-lower-inner\.sh$''
            ''^tests/functional/local-overlay-store/add-lower\.sh$''
            ''^tests/functional/local-overlay-store/bad-uris\.sh$''
            ''^tests/functional/local-overlay-store/build-inner\.sh$''
            ''^tests/functional/local-overlay-store/build\.sh$''
            ''^tests/functional/local-overlay-store/check-post-init-inner\.sh$''
            ''^tests/functional/local-overlay-store/check-post-init\.sh$''
            ''^tests/functional/local-overlay-store/common\.sh$''
            ''^tests/functional/local-overlay-store/delete-duplicate-inner\.sh$''
            ''^tests/functional/local-overlay-store/delete-duplicate\.sh$''
            ''^tests/functional/local-overlay-store/delete-refs-inner\.sh$''
            ''^tests/functional/local-overlay-store/delete-refs\.sh$''
            ''^tests/functional/local-overlay-store/gc-inner\.sh$''
            ''^tests/functional/local-overlay-store/gc\.sh$''
            ''^tests/functional/local-overlay-store/optimise-inner\.sh$''
            ''^tests/functional/local-overlay-store/optimise\.sh$''
            ''^tests/functional/local-overlay-store/redundant-add-inner\.sh$''
            ''^tests/functional/local-overlay-store/redundant-add\.sh$''
            ''^tests/functional/local-overlay-store/remount\.sh$''
            ''^tests/functional/local-overlay-store/stale-file-handle-inner\.sh$''
            ''^tests/functional/local-overlay-store/stale-file-handle\.sh$''
            ''^tests/functional/local-overlay-store/verify-inner\.sh$''
            ''^tests/functional/local-overlay-store/verify\.sh$''
            ''^tests/functional/logging\.sh$''
            ''^tests/functional/misc\.sh$''
            ''^tests/functional/multiple-outputs\.sh$''
            ''^tests/functional/nar-access\.sh$''
            ''^tests/functional/nested-sandboxing\.sh$''
            ''^tests/functional/nested-sandboxing/command\.sh$''
            ''^tests/functional/nix-build\.sh$''
            ''^tests/functional/nix-channel\.sh$''
            ''^tests/functional/nix-collect-garbage-d\.sh$''
            ''^tests/functional/nix-copy-ssh-common\.sh$''
            ''^tests/functional/nix-copy-ssh-ng\.sh$''
            ''^tests/functional/nix-copy-ssh\.sh$''
            ''^tests/functional/nix-daemon-untrusting\.sh$''
            ''^tests/functional/nix-profile\.sh$''
            ''^tests/functional/nix-shell\.sh$''
            ''^tests/functional/nix_path\.sh$''
            ''^tests/functional/optimise-store\.sh$''
            ''^tests/functional/output-normalization\.sh$''
            ''^tests/functional/parallel\.builder\.sh$''
            ''^tests/functional/parallel\.sh$''
            ''^tests/functional/pass-as-file\.sh$''
            ''^tests/functional/path-from-hash-part\.sh$''
            ''^tests/functional/path-info\.sh$''
            ''^tests/functional/placeholders\.sh$''
            ''^tests/functional/plugins\.sh$''
            ''^tests/functional/post-hook\.sh$''
            ''^tests/functional/pure-eval\.sh$''
            ''^tests/functional/push-to-store-old\.sh$''
            ''^tests/functional/push-to-store\.sh$''
            ''^tests/functional/read-only-store\.sh$''
            ''^tests/functional/readfile-context\.sh$''
            ''^tests/functional/recursive\.sh$''
            ''^tests/functional/referrers\.sh$''
            ''^tests/functional/remote-store\.sh$''
            ''^tests/functional/repair\.sh$''
            ''^tests/functional/restricted\.sh$''
            ''^tests/functional/search\.sh$''
            ''^tests/functional/secure-drv-outputs\.sh$''
            ''^tests/functional/selfref-gc\.sh$''
            ''^tests/functional/shell\.sh$''
            ''^tests/functional/shell\.shebang\.sh$''
            ''^tests/functional/simple\.builder\.sh$''
            ''^tests/functional/supplementary-groups\.sh$''
            ''^tests/functional/toString-path\.sh$''
            ''^tests/functional/user-envs-migration\.sh$''
            ''^tests/functional/user-envs-test-case\.sh$''
            ''^tests/functional/user-envs\.builder\.sh$''
            ''^tests/functional/user-envs\.sh$''
            ''^tests/functional/why-depends\.sh$''
            ''^tests/functional/zstd\.sh$''
            ''^tests/unit/libutil/data/git/check-data\.sh$''
          ];
        };
        # TODO: nixfmt, https://github.com/NixOS/nixfmt/issues/153
      };
    };
  };

  # We'll be pulling from this in the main flake
  flake.getSystem = getSystem;
}
