defmodule WebApiWeb.FoldersView do
  use WebApiWeb, :view

  def render("show.json", %{folder: folder, conn: conn}) do
    %{
      id: folder.id,
      name: folder.name,
      url: folders_url(conn, :show, folder.id),
      files: Enum.map(folder.files, &file_json/1),
      folders: Enum.map(folder.folders, fn(folder) -> sub_folder_json(folder, conn) end),
    }
  end

  defp sub_folder_json(folder = %Projects.Folder{}, conn) do
    %{
      id: folder.id,
      name: folder.name,
      url: folders_url(conn, :show, folder.id),
    }
  end

  defp file_json(file = %Projects.File{}) do
    %{
      id: file.id,
      name: file.name,
      media_url: file.media_url,
    }
  end
end

