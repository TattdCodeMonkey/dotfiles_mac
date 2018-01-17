global_settings = "~/.iex.exs"
if File.exists?(global_settings), do: Code.require_file(global_settings)

Application.put_env(:elixir, :ansi_enabled, true)
def_prompt = [
    "\e[G",
    :green, "λ", :yellow, "|", :green, "%counter", " ", 
    :yellow, "▶", :reset
  ] |> IO.ANSI.format |> IO.chardata_to_string

IEx.configure(
  colors: [
    enabled: true,
    eval_result: [:cyan, :bright] ,
    eval_error: [[:red, :bright, "\n▶▶▶\n"]],
    eval_info: [:yellow, :bright ],
  ],
  default_prompt: def_prompt 
)
