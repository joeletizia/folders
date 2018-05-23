defmodule Folders do
  import Ecto.Query

  def create_folder(name) do
    folder = %Projects.Folder{name: name}
    changeset = Projects.Folder.changeset(folder, %{})
    {:ok, inserted_folder} = Projects.Repo.insert(changeset)

    inserted_folder
  end

  def create_folder(name, parent_folder) do
    folder = %Projects.Folder{name: name, parent_folder_id: parent_folder.id}
    changeset = Projects.Folder.changeset(folder, %{})
    {:ok, inserted_folder} = Projects.Repo.insert(changeset)

    inserted_folder
  end

  def find_by_id_with_children(folder_id) do
    query = from folders in Projects.Folder,
      left_join: child_folders in assoc(folders, :folders),
        preload: [folders: child_folders],
      left_join: child_files in assoc(folders, :files),
        preload: [files: child_files],
      where: folders.id == ^folder_id

    Projects.Repo.one(query)
  end
end
