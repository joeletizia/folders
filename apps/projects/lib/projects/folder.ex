defmodule Projects.Folder do
  use Ecto.Schema

  schema "folders" do
    field :name, :string

    belongs_to :parent_folder, Projects.Folder
    has_many :folders, Projects.Folder, foreign_key: :parent_folder_id
    has_many :files, Projects.File, foreign_key: :folder_id
  end

  def changeset(folder, params \\ %{}) do
    folder
    |> Ecto.Changeset.cast(params, [:name, :parent_folder_id])
    |> Ecto.Changeset.validate_required([:name])
  end
end

