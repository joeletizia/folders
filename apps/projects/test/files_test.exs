defmodule FilesTest do
  use ExUnit.Case, async: true
  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Projects.Repo)
  end

  test "it allows creation of a file" do
    folder = Folders.create_folder("folder")
    file = Files.create_file("file", "http://example.com/foo", folder)

    %Projects.File{name: "file", id: _, media_url: url, folder_id: folder_id} = file
    assert folder_id === folder.id
    assert url === "http://example.com/foo"
  end
end


