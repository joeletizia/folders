defmodule Projects.Project do
  use Ecto.Schema

  schema "projects" do
    field :name, :string
    belongs_to :root_folder, Projects.Folder
  end

  def changeset(project, params \\ %{}) do
    project
    |> Ecto.Changeset.cast(params, [:name, :root_folder_id])
    |> Ecto.Changeset.validate_required([:name, :root_folder_id])
  end
end
