defmodule FoldersTest do
  use ExUnit.Case, async: true
  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Projects.Repo)
  end

  test "it allows creation of a folder" do
    folder = Folders.create_folder("name")
    assert %Projects.Folder{name: "name", id: _, parent_folder_id: nil} = folder
  end

  test "it allows creation of a folder in a given folder" do
    folder = Folders.create_folder("parent")
    sub_folder = Folders.create_folder("sub folder", folder)

    assert %Projects.Folder{name: "sub folder"} = sub_folder
    assert sub_folder.parent_folder_id === folder.id
  end

  test "it can return a folder with its contents" do
    folder = Folders.create_folder("parent")
    sub_folder = Folders.create_folder("sub folder", folder)
    file = Files.create_file("file", "http://example.com/foo", folder)

    folder_with_children = Folders.find_by_id_with_children(folder.id)
    %Projects.Folder{files: [found_file], folders: [found_folder]} = folder_with_children

    assert found_file === file
    assert found_folder === sub_folder
  end
end

