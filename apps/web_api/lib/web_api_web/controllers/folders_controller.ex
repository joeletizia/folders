defmodule WebApiWeb.FoldersController do
  use WebApiWeb, :controller

  def show(conn, %{"id" => folder_id}) do
    folder = Folders.find_by_id_with_children(folder_id)
    render(conn, "show.json", folder: folder, conn: conn)
  end
end
