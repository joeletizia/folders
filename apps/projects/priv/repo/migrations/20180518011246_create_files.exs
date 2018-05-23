defmodule Projects.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :name, :string, null: false
      add :folder_id, :integer, null: false
    end
  end
end
