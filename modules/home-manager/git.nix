{ inputs, ... }:
{
    programs.git = {
      enable = true;
      settings.user.name = "Adrian Christian Santos";
      settings.user.email = "adrian.crsantos@gmail.com";
    };
}
