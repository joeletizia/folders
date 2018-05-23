defmodule WebApiWeb.ProjectsControllerTest do
  use WebApiWeb.ConnCase

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Projects.Repo)
  end

  test "GET /api/projects", %{conn: conn} do
    project = Projects.create_new_project("project name")
    conn = get conn, "/api/projects"
    response = json_response(conn, 200)

    %{"projects" => [%{"name" => "project name", "root_folder" => %{"id" => root_folder_id}}]} = response

    assert root_folder_id === project.root_folder_id
  end
end
