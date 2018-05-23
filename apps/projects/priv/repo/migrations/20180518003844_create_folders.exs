defmodule Projects.Repo.Migrations.CreateFolders do
  use Ecto.Migration

  def change do
    create table(:folders) do
      add :name, :string, null: false
      add :parent_folder_id, :integer
    end
  end
end
