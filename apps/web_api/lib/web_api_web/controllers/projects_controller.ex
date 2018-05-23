defmodule WebApiWeb.ProjectsController do
  use WebApiWeb, :controller

  def index(conn, _params) do
    projects = Projects.get_all_projects_with_folders_loaded
    render(conn, "index.json", projects: projects, conn: conn)
  end
end
