defmodule Projects.Repo.Migrations.AddAssociationToProjects do
  use Ecto.Migration

  def up do
    alter table(:projects) do
      remove :root_folder_id

      add :root_folder_id, references(:folders), null: false
    end
  end

  def down do

  end
end
