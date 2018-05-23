defmodule WebApiWeb.PageController do
  use WebApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
