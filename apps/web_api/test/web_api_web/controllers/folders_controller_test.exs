defmodule WebApiWeb.FoldersControllerTest do
  use WebApiWeb.ConnCase

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Projects.Repo)
  end

  test "GET /api/folders/:id", %{conn: conn} do
    project = Projects.create_new_project("project name")
    folder = Folders.find_by_id_with_children(project.root_folder_id)
    file = Files.create_file("file name", "media url", folder)

    conn = get conn, "/api/folders/#{project.root_folder_id}"
    response = json_response(conn, 200)

    %{"id" => folder_id, "url" => folder_url, "name" => "/", "files" => [%{"id" => fetched_file_id}], "folders" => []} = response
    assert folder_id === project.root_folder_id
    assert file.id === fetched_file_id

    assert folder_url === folders_url(conn, :show, folder_id)
  end
end

