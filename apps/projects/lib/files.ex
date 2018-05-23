defmodule Files do
  def create_file(file_name, media_url, folder) do
    file = %Projects.File{name: file_name, media_url: media_url, folder_id: folder.id}
    changeset = Projects.File.changeset(file, %{})

    {:ok, inserted_file} = Projects.Repo.insert(changeset)
    inserted_file
  end
end
