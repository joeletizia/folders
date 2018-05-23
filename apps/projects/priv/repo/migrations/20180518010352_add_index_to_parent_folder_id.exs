defmodule Projects.Repo.Migrations.AddIndexToParentFolderId do
  use Ecto.Migration

  def change do
    create index("folders", [:parent_folder_id])
  end
end
