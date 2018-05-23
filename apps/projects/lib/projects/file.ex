defmodule Projects.File do
  use Ecto.Schema

  schema "files" do
    field :name, :string
    field :media_url, :string
    belongs_to :folder, Projects.Folder
  end

  def changeset(file, params \\ %{}) do
    file
    |> Ecto.Changeset.cast(params, [:name, :folder_id, :media_url])
    |> Ecto.Changeset.validate_required([:name, :folder_id, :media_url])
  end
end


