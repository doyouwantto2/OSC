{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Hosts file for local development
  networking.extraHosts = ''
    127.0.0.1 localhost.localdev
    127.0.0.1 api.localdev
    127.0.0.1 app.localdev
    127.0.0.1 db.localdev
    127.0.0.1 ollama.localdev
    127.0.0.1 kobold.localdev
    127.0.0.1 ai.localdev
    127.0.0.1 llm.localdev
    127.0.0.1 stable.localdev
    127.0.0.1 textgen.localdev
  '';

}
