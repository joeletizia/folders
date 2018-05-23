defmodule Projects.Repo.Migrations.AddIndexToFilesFolderId do
  use Ecto.Migration

  def change do
    create index("files", [:folder_id])
  end
end
