# _ __ ___   __| |___ _ __
# | '_ ` _ \ / _` / __| '_ \
# | | | | | | (_| \__ \ |_) |
# |_| |_| |_|\__,_|___/ .__/
#                    |_|

defmodule Installer do
  @moduledoc """
  Run this Elixir script to automatically link all these configs!
  """

  @config_path Path.expand("~/.config")
  @home_dir Path.expand("~")

  @ignore [~r(\.git$), ~r(\.gitignore), ~r(README)]

  def link do
    IO.puts("I'll link all these configs for you! Let's go:")
    actual_path = Path.expand(".")

    case File.stat(@config_path) do
      {:ok, _stat} ->
        IO.puts("Good, .config folder exists!")

      _ ->
        IO.puts("Well, .config folder doesn't exists... I'll create to you!")
        File.mkdir!(@config_path)
        IO.puts("Created .config foler on home dir!")
    end

    for config <- Path.wildcard("./*", match_dot: true) do
      existing_path = actual_path <> "/#{config}"

      cond do
        @ignore |> Enum.filter(&(config =~ &1)) |> length() > 0 ->
          skip(config)

        config =~ ~r(^\..+) ->
          if File.exists?(@home_dir <> "/#{config}") do
            skip(config)
          else
            existing_path
            |> link_to_home(config)

            IO.puts("Linked #{config}!")
          end

        config =~ ~r(exs$) ->
          skip(config)

        true ->
          if File.exists?(@config_path <> "/#{config}") do
            skip(config)
          else
            existing_path
            |> link_to_dot_config(config)

            IO.puts("Linked #{config}!")
          end
      end
    end

    IO.puts("Linked all! Congratutalions!")
    IO.puts("Please, remember to change ~/.gitconfig file")
  end

  defp link_to_home(existing, config), do: File.ln_s!(existing, @home_dir <> "/#{config}")

  defp link_to_dot_config(existing, config),
    do: File.ln_s!(existing, @config_path <> "/#{config}")

  defp root_config(commands) do
    IO.puts("Please, insert your sudo pass:")
    System.cmd("sudo", ["-A"] ++ commands, into: IO.read(:stdio, :line))
  end

  defp skip(config), do: IO.puts("Skipping #{config}...")
end

Installer.link()
