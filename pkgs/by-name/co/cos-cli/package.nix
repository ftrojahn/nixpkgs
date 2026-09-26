{
  lib,
  rustPlatform,
  fetchFromGitHub,
  versionCheckHook,
  nix-update-script,
  cosmic-comp,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "cos-cli";
  version = "0.5.1-git";

  src = fetchFromGitHub {
    owner = "estin";
    repo = "cos-cli";
    rev = "fe8c52016888302d6239ef53f1dbf876d8552dc2";
    hash = "sha256-IN+36GlQKyCbvK83lfospUWeaghqZ/sKtJZga8lIzF4=";
  };

  cargoHash = "sha256-QR2+CbNWrIMpxtiAV+cyHnHYtiYe6lz+9RKvsIMhkdQ=";

  doInstallCheck = true;

  # TODO
  # nativeInstallCheckInputs = [ versionCheckHook ];
  # versionCheckProgram = #"${placeholder "out"}/bin/cos-cli";

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "A CLI utility for COSMIC Wayland toplevel and workspace management";

    # TODO
    # changelog = "https://github.com/cosmic-utils/cosmic-ctl/releases/tag/v${finalAttrs.version}";

    homepage = "https://github.com/estin/cos-cli";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ hiro98 ];
    mainProgram = "cos-cli";
    inherit (cosmic-comp.meta) platforms;
  };
})
