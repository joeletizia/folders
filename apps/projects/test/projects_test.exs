defmodule ProjectsTest do
  use ExUnit.Case, async: true
  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Projects.Repo)
  end

  test "it allows retrieval of all projects" do
    projects = Projects.get_all_projects()
    assert Enum.count(projects) == 0

    project = Projects.create_new_project("project name")
    assert %Projects.Project{name: "project name"} = project

    projects = Projects.get_all_projects()
    assert Enum.count(projects) == 1
    assert [project] === projects
  end

  test "it allows for retrieval of all projects with folders loaded" do
    project = Projects.create_new_project("project name")
    assert %Projects.Project{name: "project name"} = project

    projects = Projects.get_all_projects_with_folders_loaded()
    assert Enum.count(projects) == 1
    [%Projects.Project{name: "project name", root_folder: root_folder}] = projects

    %Projects.Folder{name: "/"} = root_folder
  end

  test "it must have a name" do
    project = %Projects.Project{root_folder_id: 1}
    changeset = Projects.Project.changeset(project, %{})

    assert changeset.valid? === false
    assert [name: {"can't be blank", _}] = changeset.errors
  end

  test "it must have a root folder id" do
    project = %Projects.Project{name: "name"}
    changeset = Projects.Project.changeset(project, %{})

    assert changeset.valid? === false
    assert [root_folder_id: {"can't be blank", _}] = changeset.errors
  end
end
