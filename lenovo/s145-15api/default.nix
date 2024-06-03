{
  imports = [
    ../../../common/cpu/amd
    ../../../common/gpu/amd
    ../../../common/gpu/amd/southern-islands
  ];

  # Blacklist ideapad-laptop because it keeps resetting rfkill devices
  boot.blacklistedKernelModules = [ "ideapad-laptop" ];

  # For some reason we have to specify manually which model we want snd-hda-intel to use
  # without it external microphone won't work
  # also disable power save because the audio starts crackling under heavy system load
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=alc255-acer,dell-headset-multi power_save=0
  '';
}
