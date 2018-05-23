defmodule WebApiWeb.ProjectsView do
  use WebApiWeb, :view

  def render("index.json", %{projects: projects, conn: conn}) do
    %{
      projects: Enum.map(projects, fn(project) -> project_json(conn, project) end)
    }
  end

  defp project_json(conn, project = %Projects.Project{}) do
    %{
      id: project.id,
      name: project.name,
      root_folder: folder_json(project.root_folder, conn),
    }
  end

  defp folder_json(folder = %Projects.Folder{}, conn) do
    %{
      id: folder.id,
      name: folder.name,
      url: folders_url(conn, :show, folder.id),
    }
  end
end
