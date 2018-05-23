defmodule Projects do
  import Ecto.Query

  def get_all_projects do
    Projects.Project
    |> Projects.Repo.all 
  end

  def get_all_projects_with_folders_loaded do
    query = from projects in Projects.Project,
    inner_join: folder in assoc(projects, :root_folder),
      preload: [root_folder: folder]

    Projects.Repo.all(query)
  end

  def create_new_project(name) do
    folder = Folders.create_folder("/")
    project = %Projects.Project{name: name, root_folder_id: folder.id}

    changeset = Projects.Project.changeset(project, %{})
    {:ok, inserted_project} = Projects.Repo.insert(changeset)

    inserted_project
  end
end
