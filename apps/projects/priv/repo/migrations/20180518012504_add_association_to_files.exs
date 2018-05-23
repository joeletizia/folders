defmodule Projects.Repo.Migrations.AddAssociationToFiles do
  use Ecto.Migration

  def up do
    alter table(:files) do
      remove :folder_id

      add :folder_id, references(:folders), null: false
    end

    alter table(:folders) do
      remove :parent_folder_id

      add :parent_folder_id, references(:folders)
    end
  end

  def down do
    alter table(:files) do
      remove :folder_id

      add :folder_id, :integer, null: false
    end

    alter table(:folders) do
      remove :parent_folder_id

      add :parent_folder_id, :integer
    end
  end
end
