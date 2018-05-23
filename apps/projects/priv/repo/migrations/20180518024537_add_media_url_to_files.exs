defmodule Projects.Repo.Migrations.AddMediaUrlToFiles do
  use Ecto.Migration

  def up do
    alter table(:files) do
      add :media_url, :text, null: false
    end
  end

  def down do
    alter table(:files) do
      remove :media_url
    end
  end
end
